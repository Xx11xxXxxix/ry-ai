package com.ruoyi.common.utils.file;

import org.mozilla.universalchardet.UniversalDetector;
import org.springframework.web.multipart.MultipartFile;
import java.io.InputStream;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;

/**
 * 文件编码探测工具类 (基于 JUniversalChardet)
 * 用于解决 Windows(GBK) 与 Linux/Mac(UTF-8) 跨平台文件乱码问题
 */
public class FileCharsetUtil {

    /**
     * 智能读取 MultipartFile 内容
     */
    public static String readContent(MultipartFile file) {
        if (file == null || file.isEmpty()) {
            return "";
        }

        // 1. 创建探测器
        UniversalDetector detector = new UniversalDetector(null);
        byte[] buf = new byte[4096];
        int nread;
        String charsetName = null;

        try (InputStream is = file.getInputStream()) {
            // 2. 读取数据块进行探测 (为了性能，不一定读完整个文件，读到确定为止)
            while ((nread = is.read(buf)) > 0 && !detector.isDone()) {
                detector.handleData(buf, 0, nread);
            }
            // 3. 结束探测
            detector.dataEnd();

            // 4. 获取探测结果
            charsetName = detector.getDetectedCharset();

            // 5. 如果探测失败（通常是因为纯英文ASCII），默认使用 UTF-8
            if (charsetName == null) {
                charsetName = StandardCharsets.UTF_8.name();
            }

            // 6. 直接用探测到的编码 new String
            return new String(file.getBytes(), charsetName);

        } catch (Exception e) {
            e.printStackTrace();
            // 兜底方案：盲猜 UTF-8
            try {
                return new String(file.getBytes(), StandardCharsets.UTF_8);
            } catch (Exception ex) {
                return "";
            }
        } finally {
            // 释放探测器资源
            detector.reset();
        }
    }
}