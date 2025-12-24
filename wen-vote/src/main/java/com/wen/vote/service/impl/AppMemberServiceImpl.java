package com.wen.vote.service.impl;

import java.util.List;
import com.wen.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.wen.vote.mapper.AppMemberMapper;
import com.wen.vote.domain.AppMember;
import com.wen.vote.service.IAppMemberService;

/**
 * App会员Service业务层处理
 * 
 * @author wen
 * @date 2025-12-24
 */
@Service
public class AppMemberServiceImpl implements IAppMemberService 
{
    @Autowired
    private AppMemberMapper appMemberMapper;

    /**
     * 查询App会员
     * 
     * @param memberId App会员主键
     * @return App会员
     */
    @Override
    public AppMember selectAppMemberByMemberId(Long memberId)
    {
        return appMemberMapper.selectAppMemberByMemberId(memberId);
    }

    /**
     * 查询App会员列表
     * 
     * @param appMember App会员
     * @return App会员
     */
    @Override
    public List<AppMember> selectAppMemberList(AppMember appMember)
    {
        return appMemberMapper.selectAppMemberList(appMember);
    }

    /**
     * 新增App会员
     * 
     * @param appMember App会员
     * @return 结果
     */
    @Override
    public int insertAppMember(AppMember appMember)
    {
        appMember.setCreateTime(DateUtils.getNowDate());
        return appMemberMapper.insertAppMember(appMember);
    }

    /**
     * 修改App会员
     * 
     * @param appMember App会员
     * @return 结果
     */
    @Override
    public int updateAppMember(AppMember appMember)
    {
        return appMemberMapper.updateAppMember(appMember);
    }

    /**
     * 批量删除App会员
     * 
     * @param memberIds 需要删除的App会员主键
     * @return 结果
     */
    @Override
    public int deleteAppMemberByMemberIds(Long[] memberIds)
    {
        return appMemberMapper.deleteAppMemberByMemberIds(memberIds);
    }

    /**
     * 删除App会员信息
     * 
     * @param memberId App会员主键
     * @return 结果
     */
    @Override
    public int deleteAppMemberByMemberId(Long memberId)
    {
        return appMemberMapper.deleteAppMemberByMemberId(memberId);
    }
}
