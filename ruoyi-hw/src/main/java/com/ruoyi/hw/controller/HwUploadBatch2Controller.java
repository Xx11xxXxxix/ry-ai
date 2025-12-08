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
import com.ruoyi.hw.domain.HwUploadBatch2;
import com.ruoyi.hw.service.IHwUploadBatch2Service;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 作业提交批次2.0Controller
 * 
 * @author wenjiee
 * @date 2025-12-08
 */
@RestController
@RequestMapping("/hw/batch2")
public class HwUploadBatch2Controller extends BaseController
{
    @Autowired
    private IHwUploadBatch2Service hwUploadBatch2Service;

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
     * 导出作业提交批次2.0列表
     */
    @PreAuthorize("@ss.hasPermi('hw:batch2:export')")
    @Log(title = "作业提交批次2.0", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, HwUploadBatch2 hwUploadBatch2)
    {
        List<HwUploadBatch2> list = hwUploadBatch2Service.selectHwUploadBatch2List(hwUploadBatch2);
        ExcelUtil<HwUploadBatch2> util = new ExcelUtil<HwUploadBatch2>(HwUploadBatch2.class);
        util.exportExcel(response, list, "作业提交批次2.0数据");
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
     * 新增作业提交批次2.0
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
}
