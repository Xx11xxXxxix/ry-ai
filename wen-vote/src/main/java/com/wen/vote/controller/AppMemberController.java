package com.wen.vote.controller;

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
import com.wen.common.annotation.Log;
import com.wen.common.core.controller.BaseController;
import com.wen.common.core.domain.AjaxResult;
import com.wen.common.enums.BusinessType;
import com.wen.vote.domain.AppMember;
import com.wen.vote.service.IAppMemberService;
import com.wen.common.utils.poi.ExcelUtil;
import com.wen.common.core.page.TableDataInfo;

/**
 * App会员Controller
 * 
 * @author wen
 * @date 2025-12-24
 */
@RestController
@RequestMapping("/vote/member")
public class AppMemberController extends BaseController
{
    @Autowired
    private IAppMemberService appMemberService;

    /**
     * 查询App会员列表
     */
    @PreAuthorize("@ss.hasPermi('vote:member:list')")
    @GetMapping("/list")
    public TableDataInfo list(AppMember appMember)
    {
        startPage();
        List<AppMember> list = appMemberService.selectAppMemberList(appMember);
        return getDataTable(list);
    }

    /**
     * 导出App会员列表
     */
    @PreAuthorize("@ss.hasPermi('vote:member:export')")
    @Log(title = "App会员", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, AppMember appMember)
    {
        List<AppMember> list = appMemberService.selectAppMemberList(appMember);
        ExcelUtil<AppMember> util = new ExcelUtil<AppMember>(AppMember.class);
        util.exportExcel(response, list, "App会员数据");
    }

    /**
     * 获取App会员详细信息
     */
    @PreAuthorize("@ss.hasPermi('vote:member:query')")
    @GetMapping(value = "/{memberId}")
    public AjaxResult getInfo(@PathVariable("memberId") Long memberId)
    {
        return success(appMemberService.selectAppMemberByMemberId(memberId));
    }

    /**
     * 新增App会员
     */
    @PreAuthorize("@ss.hasPermi('vote:member:add')")
    @Log(title = "App会员", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody AppMember appMember)
    {
        return toAjax(appMemberService.insertAppMember(appMember));
    }

    /**
     * 修改App会员
     */
    @PreAuthorize("@ss.hasPermi('vote:member:edit')")
    @Log(title = "App会员", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody AppMember appMember)
    {
        return toAjax(appMemberService.updateAppMember(appMember));
    }

    /**
     * 删除App会员
     */
    @PreAuthorize("@ss.hasPermi('vote:member:remove')")
    @Log(title = "App会员", businessType = BusinessType.DELETE)
	@DeleteMapping("/{memberIds}")
    public AjaxResult remove(@PathVariable Long[] memberIds)
    {
        return toAjax(appMemberService.deleteAppMemberByMemberIds(memberIds));
    }
}
