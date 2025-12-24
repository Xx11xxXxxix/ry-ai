package com.wen.vote.service;

import java.util.List;
import com.wen.vote.domain.AppMember;

/**
 * App会员Service接口
 * 
 * @author wen
 * @date 2025-12-24
 */
public interface IAppMemberService 
{
    /**
     * 查询App会员
     * 
     * @param memberId App会员主键
     * @return App会员
     */
    public AppMember selectAppMemberByMemberId(Long memberId);

    /**
     * 查询App会员列表
     * 
     * @param appMember App会员
     * @return App会员集合
     */
    public List<AppMember> selectAppMemberList(AppMember appMember);

    /**
     * 新增App会员
     * 
     * @param appMember App会员
     * @return 结果
     */
    public int insertAppMember(AppMember appMember);

    /**
     * 修改App会员
     * 
     * @param appMember App会员
     * @return 结果
     */
    public int updateAppMember(AppMember appMember);

    /**
     * 批量删除App会员
     * 
     * @param memberIds 需要删除的App会员主键集合
     * @return 结果
     */
    public int deleteAppMemberByMemberIds(Long[] memberIds);

    /**
     * 删除App会员信息
     * 
     * @param memberId App会员主键
     * @return 结果
     */
    public int deleteAppMemberByMemberId(Long memberId);
}
