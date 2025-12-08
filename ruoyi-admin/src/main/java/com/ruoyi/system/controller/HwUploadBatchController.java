package com.ruoyi.system.controller;

import java.util.Date;
import java.util.List;
import java.io.IOException; // 必须引用
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.system.service.AsyncAiService;
import java.util.ArrayList;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*; // 包含了 RequestParam, PostMapping 等
import org.springframework.web.multipart.MultipartFile; // 必须引用

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.utils.file.FileUploadUtils; // 必须引用
import com.ruoyi.system.domain.HwUploadFile;
import com.ruoyi.system.service.IHwUploadFileService; // 假设你生成代码时生成了这个Service
import java.nio.charset.StandardCharsets; // 用于指定编码读取内容
import org.springframework.transaction.annotation.Transactional; // 用于事务控制
import org.apache.commons.io.FilenameUtils; // 若依自带工具，用于获取后缀
// --- 关键修改看这里 ---
// 如果 com.ruoyi.framework.config.RuoYiConfig 报错，请尝试换成下面这个：
import com.ruoyi.common.config.RuoYiConfig;
// 或者保持原样，取决于你的若依版本
// import com.ruoyi.framework.config.RuoYiConfig;

import com.ruoyi.system.domain.HwUploadBatch;
import com.ruoyi.system.service.IHwUploadBatchService;
/**
 * 作业提交批次Controller
 * 
 * @author ruoyi
 * @date 2025-12-05
 */
@RestController
@RequestMapping("/system/batch")
public class HwUploadBatchController extends BaseController
{

    @Autowired
    private IHwUploadBatchService HwUploadBatchServiceImpl;
    @Autowired
    private IHwUploadFileService hwUploadFileServiceImpl;
    @Autowired
    private IHwUploadBatchService hwUploadBatchService;
    @Autowired
    private AsyncAiService asyncAiService;
    /**
     * 查询作业提交批次列表
     */
    @PreAuthorize("@ss.hasPermi('system:batch:list')")
    @GetMapping("/list")
    public TableDataInfo list(HwUploadBatch hwUploadBatch)
    {
        startPage();
        List<HwUploadBatch> list = hwUploadBatchService.selectHwUploadBatchList(hwUploadBatch);
        return getDataTable(list);
    }

    /**
     * 导出作业提交批次列表
     */
    @PreAuthorize("@ss.hasPermi('system:batch:export')")
    @Log(title = "作业提交批次", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, HwUploadBatch hwUploadBatch)
    {
        List<HwUploadBatch> list = hwUploadBatchService.selectHwUploadBatchList(hwUploadBatch);
        ExcelUtil<HwUploadBatch> util = new ExcelUtil<HwUploadBatch>(HwUploadBatch.class);
        util.exportExcel(response, list, "作业提交批次数据");
    }

    /**
     * 获取作业提交批次详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:batch:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(hwUploadBatchService.selectHwUploadBatchById(id));
    }

    /**
     * 新增作业提交批次
     */
    @PreAuthorize("@ss.hasPermi('system:batch:add')")
    @Log(title = "作业提交批次", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody HwUploadBatch hwUploadBatch)
    {
        return toAjax(hwUploadBatchService.insertHwUploadBatch(hwUploadBatch));
    }

    /**
     * 修改作业提交批次
     */
    @PreAuthorize("@ss.hasPermi('system:batch:edit')")
    @Log(title = "作业提交批次", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody HwUploadBatch hwUploadBatch)
    {
        return toAjax(hwUploadBatchService.updateHwUploadBatch(hwUploadBatch));
    }

    /**
     * 删除作业提交批次
     */
    @PreAuthorize("@ss.hasPermi('system:batch:remove')")
    @Log(title = "作业提交批次", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(hwUploadBatchService.deleteHwUploadBatchByIds(ids));
    }
    @PreAuthorize("@ss.hasPermi('system:batch:add')")
    @Log(title = "作业提交批次", businessType = BusinessType.INSERT)
    @PostMapping("/addWithFile")
    @Transactional(rollbackFor = Exception.class)
    public AjaxResult addWithFile(@RequestParam(value = "files", required = false) MultipartFile[] files, HwUploadBatch hwUploadBatch) throws  Exception
    {
        // 1. 设置批次基础信息
        Long userId = SecurityUtils.getUserId();
        String nickName = SecurityUtils.getLoginUser().getUser().getNickName(); // 获取昵称，或者用 getUsername() 获取账号

        // 2. 强制填入对象，覆盖前端传来的（如果有的话）
        hwUploadBatch.setStudentId(userId);
        hwUploadBatch.setStudentName(nickName);

        // 3. 自动设置提交时间为当前服务器时间 (防止学生伪造时间)
        hwUploadBatch.setSubmitTime(new Date());
        if (files != null) {
            hwUploadBatch.setFileCount((long) files.length);
        } else {
            hwUploadBatch.setFileCount(0L);
        }

        // 自动生成批次号
        if (hwUploadBatch.getBatchNo() == null) {
            hwUploadBatch.setBatchNo(String.valueOf(System.currentTimeMillis()));
        }

        // 设置默认状态
        hwUploadBatch.setAiStatus(1L); // 0 未评

        // 2. 先保存批次 (为了获取生成的ID)
        hwUploadBatchService.insertHwUploadBatch(hwUploadBatch);
        Long batchId = hwUploadBatch.getId(); // 获取主键ID

        List<HwUploadFile> savedFiles = new ArrayList<>();
        // 3. 处理文件列表
        if (files != null && files.length > 0) {
            StringBuilder fileNames = new StringBuilder();

            for (MultipartFile file : files) {
                // --- A. 上传物理文件 ---
                String filePath = FileUploadUtils.upload(RuoYiConfig.getUploadPath(), file,null);
                String originalFilename = file.getOriginalFilename();
                String extension = FilenameUtils.getExtension(originalFilename); // 获取后缀，如 java, c

                // --- B. 读取文件内容 (核心步骤) ---
                // 注意：这里假设代码文件是 UTF-8 编码。如果是 GBK 可能需要探测编码，通常 UTF-8 即可。
                String codeContent = new String(file.getBytes(), StandardCharsets.UTF_8);

                // --- C. 构建 HwUploadFile 对象 ---
                HwUploadFile uploadFile = new HwUploadFile();
                uploadFile.setBatchId(batchId);           // 关联刚才生成的批次ID
                uploadFile.setFileName(originalFilename); // 文件名
                uploadFile.setFileExt("." + extension);   // 后缀
                uploadFile.setFileSize(file.getSize());   // 大小
                uploadFile.setFilePath(filePath);         // 磁盘路径
                uploadFile.setCodeContent(codeContent);   // **数据库存储代码内容**

                // --- D. 保存到数据库 ---
                hwUploadFileServiceImpl.insertHwUploadFile(uploadFile);

                fileNames.append(originalFilename).append("; ");
                savedFiles.add(uploadFile);

            }

            // (可选) 更新一下批次的备注，说明包含哪些文件
            // hwUploadBatch.setAiReview("包含文件：" + fileNames.toString());
            // hwUploadBatchService.updateHwUploadBatch(hwUploadBatch);
        }
        if (!savedFiles.isEmpty()) {
            // 这行代码会立即返回，不会卡住前端
            asyncAiService.processAiReview(batchId, savedFiles);
        } else {
            // 如果没文件，直接把状态改成已完成或不需要评测
            HwUploadBatch emptyBatch = new HwUploadBatch();
            emptyBatch.setId(batchId);
            emptyBatch.setAiStatus(2L);
            emptyBatch.setAiReview("无文件提交，无需评测");
            hwUploadBatchService.updateHwUploadBatch(emptyBatch);
        }
        return success("上传成功");
    }
}
