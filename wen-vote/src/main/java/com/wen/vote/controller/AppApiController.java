package com.wen.vote.controller;

import com.wen.common.core.domain.AjaxResult;
// 核心修正1：引入你刚才生成的实体类 (路径变了)
import com.wen.vote.domain.AppMember;
// 核心修正2：引入你刚才生成的 Service (路径变了)
import com.wen.vote.service.IAppMemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import java.util.Date;

/**
 * 专门给安卓用的接口
 */
@RestController
@RequestMapping("/app/api")
public class AppApiController {

    @Autowired
    private IAppMemberService memberService;

    // 注册接口
    @PostMapping("/register")
    public AjaxResult register(@RequestBody AppMember member) {
        if (member.getUsername() == null || member.getPassword() == null) {
            return AjaxResult.error("账号密码不能为空");
        }

        // 简单的重复校验 (可选)
        AppMember exist = new AppMember();
        exist.setUsername(member.getUsername());
        if (memberService.selectAppMemberList(exist).size() > 0) {
            return AjaxResult.error("账号已存在");
        }

        member.setCreateTime(new Date());
        member.setStatus("0"); // 0正常
        //默认运行投票
        member.setVoteStatus("0");
        // 这里的 insertAppMember 是代码生成器自动生成的
        int rows = memberService.insertAppMember(member);

        return rows > 0 ? AjaxResult.success("注册成功") : AjaxResult.error("注册失败");
    }
}