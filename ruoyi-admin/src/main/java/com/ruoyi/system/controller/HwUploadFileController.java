package com.ruoyi.system.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.system.domain.HwUploadFile;
import com.ruoyi.system.service.IHwUploadFileService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 作业文件明细Controller
 * 
 * @author ruoyi
 * @date 2025-12-05
 */
@RestController
@RequestMapping("/system/file")
public class HwUploadFileController extends BaseController
{
    @Autowired
    private IHwUploadFileService hwUploadFileService;

    /**
     * 查询作业文件明细列表
     */
    @PreAuthorize("@ss.hasPermi('system:file:list')")
    @GetMapping("/list")
    public TableDataInfo list(HwUploadFile hwUploadFile)
    {
        startPage();
        List<HwUploadFile> list = hwUploadFileService.selectHwUploadFileList(hwUploadFile);
        return getDataTable(list);
    }

    /**
     * 导出作业文件明细列表
     */
    @PreAuthorize("@ss.hasPermi('system:file:export')")
    @Log(title = "作业文件明细", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, HwUploadFile hwUploadFile)
    {
        List<HwUploadFile> list = hwUploadFileService.selectHwUploadFileList(hwUploadFile);
        ExcelUtil<HwUploadFile> util = new ExcelUtil<HwUploadFile>(HwUploadFile.class);
        util.exportExcel(response, list, "作业文件明细数据");
    }

    /**
     * 获取作业文件明细详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:file:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(hwUploadFileService.selectHwUploadFileById(id));
    }

    /**
     * 新增作业文件明细
     */
    @PreAuthorize("@ss.hasPermi('system:file:add')")
    @Log(title = "作业文件明细", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody HwUploadFile hwUploadFile)
    {
        return toAjax(hwUploadFileService.insertHwUploadFile(hwUploadFile));
    }

    /**
     * 修改作业文件明细
     */
    @PreAuthorize("@ss.hasPermi('system:file:edit')")
    @Log(title = "作业文件明细", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody HwUploadFile hwUploadFile)
    {
        return toAjax(hwUploadFileService.updateHwUploadFile(hwUploadFile));
    }

    /**
     * 删除作业文件明细
     */
    @PreAuthorize("@ss.hasPermi('system:file:remove')")
    @Log(title = "作业文件明细", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(hwUploadFileService.deleteHwUploadFileByIds(ids));
    }
}
