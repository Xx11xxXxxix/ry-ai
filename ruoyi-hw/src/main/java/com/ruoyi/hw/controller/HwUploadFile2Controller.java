package com.ruoyi.hw.controller;

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
import com.ruoyi.hw.domain.HwUploadFile2;
import com.ruoyi.hw.service.IHwUploadFile2Service;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 作业文件明细2.0Controller
 * 
 * @author wenjie
 * @date 2025-12-08
 */
@RestController
@RequestMapping("/hw/file2")
public class HwUploadFile2Controller extends BaseController
{
    @Autowired
    private IHwUploadFile2Service hwUploadFile2Service;

    /**
     * 查询作业文件明细2.0列表
     */
    @PreAuthorize("@ss.hasPermi('hw:file2:list')")
    @GetMapping("/list")
    public TableDataInfo list(HwUploadFile2 hwUploadFile2)
    {
        startPage();
        List<HwUploadFile2> list = hwUploadFile2Service.selectHwUploadFile2List(hwUploadFile2);
        return getDataTable(list);
    }

    /**
     * 导出作业文件明细2.0列表
     */
    @PreAuthorize("@ss.hasPermi('hw:file2:export')")
    @Log(title = "作业文件明细2.0", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, HwUploadFile2 hwUploadFile2)
    {
        List<HwUploadFile2> list = hwUploadFile2Service.selectHwUploadFile2List(hwUploadFile2);
        ExcelUtil<HwUploadFile2> util = new ExcelUtil<HwUploadFile2>(HwUploadFile2.class);
        util.exportExcel(response, list, "作业文件明细2.0数据");
    }

    /**
     * 获取作业文件明细2.0详细信息
     */
    @PreAuthorize("@ss.hasPermi('hw:file2:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(hwUploadFile2Service.selectHwUploadFile2ById(id));
    }

    /**
     * 新增作业文件明细2.0
     */
    @PreAuthorize("@ss.hasPermi('hw:file2:add')")
    @Log(title = "作业文件明细2.0", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody HwUploadFile2 hwUploadFile2)
    {
        return toAjax(hwUploadFile2Service.insertHwUploadFile2(hwUploadFile2));
    }

    /**
     * 修改作业文件明细2.0
     */
    @PreAuthorize("@ss.hasPermi('hw:file2:edit')")
    @Log(title = "作业文件明细2.0", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody HwUploadFile2 hwUploadFile2)
    {
        return toAjax(hwUploadFile2Service.updateHwUploadFile2(hwUploadFile2));
    }

    /**
     * 删除作业文件明细2.0
     */
    @PreAuthorize("@ss.hasPermi('hw:file2:remove')")
    @Log(title = "作业文件明细2.0", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(hwUploadFile2Service.deleteHwUploadFile2ByIds(ids));
    }
}
