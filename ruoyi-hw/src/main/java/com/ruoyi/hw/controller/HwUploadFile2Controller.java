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
import com.ruoyi.hw.domain.HwUploadFile2; // 适配1: 导入 V2.0 实体
import com.ruoyi.hw.service.IHwUploadFile2Service; // 适配2: 导入 V2.0 服务
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 作业文件明细2.0Controller
 *
 * @author wenjie
 * @date 2025-12-08
 */
@RestController
@RequestMapping("/hw/file2") // 适配3: 更新 API 基础路由
public class HwUploadFile2Controller extends BaseController
{
    @Autowired
    private IHwUploadFile2Service hwUploadFile2Service; // 适配4: 注入 V2.0 服务实例

    /**
     * 查询作业文件明细2.0列表
     */
    // 适配5: 更新权限标识
    @PreAuthorize("@ss.hasPermi('hw:file2:list')")
    @GetMapping("/list")
    // 适配6: 所有方法参数和返回类型均已更新为 V2.0 实体
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