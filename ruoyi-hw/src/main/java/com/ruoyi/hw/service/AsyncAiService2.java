package com.ruoyi.hw.service; // 你的包名

import cn.hutool.core.util.ReUtil;
import cn.hutool.http.HttpRequest;
import cn.hutool.http.HttpResponse;
import cn.hutool.json.JSONArray;
import cn.hutool.json.JSONObject;
import cn.hutool.json.JSONUtil;
import com.ruoyi.hw.service.IHwUploadBatch2Service;
import com.ruoyi.hw.domain.HwUploadBatch2;
import com.ruoyi.hw.domain.HwUploadFile2;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.List;

/**
 * AI 异步评测服务 (SiliconFlow 版本)
 */
@Service
public class AsyncAiService2 {

    private static final Logger log = LoggerFactory.getLogger(AsyncAiService2.class);

    @Autowired
    private IHwUploadBatch2Service hwUploadBatch2Service;

    // 硅基流动 API 地址
    private static final String API_URL = "https://api.siliconflow.cn/v1/chat/completions";
    // 模型名称
    private static final String MODEL_NAME = "Qwen/Qwen2.5-VL-72B-Instruct";

    // TODO: 请在这里填入你的真实 API KEY (sk-xxxxxxxx)
    private static final String API_KEY = "Bearer sk-tyffrgciufmtnrcahskqciqlepgxhgfwifbmlanvqenwsuvw";

    /**
     * 异步执行 AI 评测
     */
    @Async
    public void processAiReview(Long batchId, List<HwUploadFile2> files) {
        log.info(">>> [AI评测] 开始处理批次: {}", batchId);

        try {
            // 1. 准备 Prompt (提示词)
            StringBuilder fileContentBuilder = new StringBuilder();
            for (HwUploadFile2 file : files) {
                fileContentBuilder.append("【文件名：").append(file.getFileName()).append("】\n");
                fileContentBuilder.append("```\n").append(file.getCodeContent()).append("\n```\n\n");
            }

            // 系统提示词：设定 AI 角色和输出格式严格要求
            String systemPrompt = "你是一名计算机专业助教。请对学生提交的代码作业进行评分和点评。\n" +
                    "要求如下：\n" +
                    "1. 分析代码的功能、优缺点、代码规范和潜在Bug。\n" +
                    "2. 给出一个 0-100 的总分。\n" +
                    "3. 必须严格按照以下格式返回，不要包含其他多余的寒暄：\n" +
                    "【总分】：(这里只写数字)\n" +
                    "【点评】：(这里写完整的评语内容)";

            String userPrompt = "以下是学生提交的文件内容：\n" + fileContentBuilder.toString();

            // 2. 构建 JSON 请求体
            JSONObject jsonBody = new JSONObject();
            jsonBody.set("model", MODEL_NAME);
            jsonBody.set("stream", false);
            jsonBody.set("temperature", 0.7);
            jsonBody.set("max_tokens", 4096);

            // 构建 messages 数组
            JSONArray messages = new JSONArray();
            messages.add(new JSONObject().set("role", "system").set("content", systemPrompt));
            messages.add(new JSONObject().set("role", "user").set("content", userPrompt));

            jsonBody.set("messages", messages);

            // 3. 发送 HTTP 请求 (使用 Hutool)
            log.info(">>> [AI评测] 正在调用 SiliconFlow API...");

            HttpResponse response = HttpRequest.post(API_URL)
                    .header("Authorization", API_KEY)
                    .header("Content-Type", "application/json")
                    .body(jsonBody.toString())
                    .timeout(60000) // 设置超时时间 60秒
                    .execute();

            String responseBody = response.body();

            if (!response.isOk()) {
                throw new RuntimeException("API请求失败，状态码：" + response.getStatus() + "，响应：" + responseBody);
            }

            // 4. 解析响应结果
            JSONObject jsonResponse = JSONUtil.parseObj(responseBody);
            // 路径：choices[0].message.content
            String aiContent = jsonResponse.getByPath("choices[0].message.content", String.class);

            if (aiContent == null) {
                throw new RuntimeException("AI返回内容为空");
            }

            log.info(">>> [AI评测] AI响应成功，长度: {}", aiContent.length());

            // 5. 提取分数和整理评语
            BigDecimal totalScore = new BigDecimal(0);

            // 使用正则提取 "【总分】：85" 中的数字
            // 匹配模式：【总分】[:：]\s*(\d+(\.\d+)?)
            String scoreStr = ReUtil.get("【总分】[:：]?\\s*(\\d+(\\.\\d+)?)", aiContent, 1);

            if (scoreStr != null) {
                try {
                    totalScore = new BigDecimal(scoreStr);
                } catch (Exception e) {
                    log.warn("分数解析失败，使用默认0分");
                }
            } else {
                // 如果AI没按格式返回，尝试暴力提取第一个出现的数字，或者默认为0
                log.warn("未匹配到标准格式分数，AI回复：{}", aiContent.substring(0, Math.min(50, aiContent.length())));
            }

            // 6. 更新数据库
            HwUploadBatch2 batch = new HwUploadBatch2();
            batch.setId(batchId);
            batch.setAiReview(aiContent); // 存入完整回复
            batch.setTotalScore(totalScore);
            batch.setAiStatus(2L); // 2 = 已完成

            hwUploadBatch2Service.updateHwUploadBatch2(batch);

            log.info(">>> [AI评测] 批次 {} 处理完成，得分：{}", batchId, totalScore);

        } catch (Exception e) {
            log.error(">>> [AI评测] 发生异常", e);
            // 更新为失败状态
            HwUploadBatch2 errorBatch = new HwUploadBatch2();
            errorBatch.setId(batchId);
            errorBatch.setAiStatus(3L); // 3 = 失败
            errorBatch.setAiReview("评测失败：" + e.getMessage());
            // 防止数据库报错，分数设为0
            errorBatch.setTotalScore(BigDecimal.ZERO);
            hwUploadBatch2Service.updateHwUploadBatch2(errorBatch);
        }
    }
}