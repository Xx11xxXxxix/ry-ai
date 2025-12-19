package com.ruoyi.hw.controller;

import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.common.config.RuoYiConfig;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.common.utils.file.FileUploadUtils;
import com.ruoyi.hw.domain.HwUploadFile2;
import com.ruoyi.hw.service.IHwUploadFile2Service;
// 核心修正1：导入新的服务类，地址已变为 hw 模块
import com.ruoyi.hw.service.AsyncAiService2;
import org.apache.commons.io.FilenameUtils;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.hw.domain.HwUploadBatch2;
import com.ruoyi.hw.service.IHwUploadBatch2Service;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;
import org.springframework.web.multipart.MultipartFile;

/**
 * 作业提交批次2.0Controller
 */
@RestController
@RequestMapping("/hw/batch2")
public class HwUploadBatch2Controller extends BaseController
{
    @Autowired
    private IHwUploadBatch2Service hwUploadBatch2Service;

    @Autowired
    private IHwUploadFile2Service hwUploadFile2Service;

    // 核心修正2：注入新的服务实例，类型和变量名均已更新
    @Autowired
    private AsyncAiService2 asyncAiService2;

    // --- (省略标准 CRUD 方法: list, export, getInfo, add, edit, remove) ---
    // ... 这些方法保持不变 ...
    /**
     * 查询作业提交批次2.0列表
     */
    @PreAuthorize("@ss.hasPermi('hw:batch2:list')")
    @GetMapping("/list")
    public TableDataInfo list(HwUploadBatch2 hwUploadBatch2)
    {
        startPage();
        List<HwUploadBatch2> list = hwUploadBatch2Service.selectHwUploadBatch2List(hwUploadBatch2);
        return getDataTable(list);
    }

    /**
     * 获取作业提交批次2.0详细信息
     */
    @PreAuthorize("@ss.hasPermi('hw:batch2:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(hwUploadBatch2Service.selectHwUploadBatch2ById(id));
    }

    /**
     * 新增作业提交批次2.0 (不含文件)
     */
    @PreAuthorize("@ss.hasPermi('hw:batch2:add')")
    @Log(title = "作业提交批次2.0", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody HwUploadBatch2 hwUploadBatch2)
    {
        return toAjax(hwUploadBatch2Service.insertHwUploadBatch2(hwUploadBatch2));
    }

    /**
     * 修改作业提交批次2.0
     */
    @PreAuthorize("@ss.hasPermi('hw:batch2:edit')")
    @Log(title = "作业提交批次2.0", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody HwUploadBatch2 hwUploadBatch2)
    {
        return toAjax(hwUploadBatch2Service.updateHwUploadBatch2(hwUploadBatch2));
    }

    /**
     * 删除作业提交批次2.0
     */
    @PreAuthorize("@ss.hasPermi('hw:batch2:remove')")
    @Log(title = "作业提交批次2.0", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(hwUploadBatch2Service.deleteHwUploadBatch2ByIds(ids));
    }


    /**
     * 新增作业提交批次2.0（包含文件上传）
     */
    @PreAuthorize("@ss.hasPermi('hw:batch2:add')")
    @Log(title = "作业提交批次2.0（含文件）", businessType = BusinessType.INSERT)
    @PostMapping("/addWithFiles")
    @Transactional(rollbackFor = Exception.class)
    public AjaxResult addWithFiles(@RequestParam(value = "files", required = false) MultipartFile[] files, HwUploadBatch2 hwUploadBatch2) throws Exception
    {

        // ... (方法内部的上半部分逻辑保持不变) ...
        Long userId = SecurityUtils.getUserId();
        String nickName = SecurityUtils.getLoginUser().getUser().getNickName();
        System.out.println("=== 提交作业 userId: " + userId + " ===");
        hwUploadBatch2.setStudentId(userId);
        hwUploadBatch2.setStudentName(nickName);
        hwUploadBatch2.setSubmitTime(new Date());
        hwUploadBatch2.setFileCount(files != null ? (long) files.length : 0L);
        hwUploadBatch2.setBatchNo(String.valueOf(System.currentTimeMillis()));
        hwUploadBatch2.setAiStatus(1L);

        hwUploadBatch2Service.insertHwUploadBatch2(hwUploadBatch2);
        Long batchId = hwUploadBatch2.getId();

        List<HwUploadFile2> savedFiles = new ArrayList<>();
        if (files != null && files.length > 0) {
            for (MultipartFile file : files) {
                String filePath = FileUploadUtils.upload(RuoYiConfig.getUploadPath(), file, null);
                String originalFilename = file.getOriginalFilename();
                String extension = FilenameUtils.getExtension(originalFilename);
                String codeContent = new String(file.getBytes(), StandardCharsets.UTF_8);

                HwUploadFile2 uploadFile = new HwUploadFile2();
                uploadFile.setBatchId(batchId);
                uploadFile.setFileName(originalFilename);
                uploadFile.setFileExt("." + extension);
                uploadFile.setFileSize(file.getSize());
                uploadFile.setFilePath(filePath);
                uploadFile.setCodeContent(codeContent);

                hwUploadFile2Service.insertHwUploadFile2(uploadFile);
                savedFiles.add(uploadFile);
            }
        }


        if (!savedFiles.isEmpty()) {
            // 核心修正3：调用新的服务实例的方法
            asyncAiService2.processAiReview(batchId, savedFiles);
        } else {
            HwUploadBatch2 emptyBatch = new HwUploadBatch2();
            emptyBatch.setId(batchId);
            emptyBatch.setAiStatus(2L);
            emptyBatch.setAiReview("无文件提交，无需评测");
            hwUploadBatch2Service.updateHwUploadBatch2(emptyBatch);
        }

        return success("上传成功");
    }
}