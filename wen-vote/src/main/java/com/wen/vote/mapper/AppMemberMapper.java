package com.wen.vote.mapper;

import java.util.List;
import com.wen.vote.domain.AppMember;

/**
 * App会员Mapper接口
 * 
 * @author wen
 * @date 2025-12-24
 */
public interface AppMemberMapper 
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
     * 删除App会员
     * 
     * @param memberId App会员主键
     * @return 结果
     */
    public int deleteAppMemberByMemberId(Long memberId);

    /**
     * 批量删除App会员
     * 
     * @param memberIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteAppMemberByMemberIds(Long[] memberIds);
}
