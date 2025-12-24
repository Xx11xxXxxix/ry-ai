package com.wen.vote.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.wen.common.annotation.Excel;
import com.wen.common.core.domain.BaseEntity;

/**
 * App会员对象 olvs_app_member
 * 
 * @author wen
 * @date 2025-12-24
 */
public class AppMember extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 会员ID */
    @Excel(name = "会员ID")
    private Long memberId;

    /** 账号 */
    @Excel(name = "账号")
    private String username;

    /** 密码 */
    @Excel(name = "密码")
    private String password;

    /** 昵称 */
    @Excel(name = "昵称")
    private String nickname;

    /** 手机号 */
    @Excel(name = "手机号")
    private String phone;

    /** 状态（0正常 1停用） */
    @Excel(name = "状态", readConverterExp = "0=正常,1=停用")
    private String status;

    @Excel(name = "投票权限", readConverterExp = "0=正常,1=禁止")
    private String voteStatus;

    public void setMemberId(Long memberId) 
    {
        this.memberId = memberId;
    }

    public Long getMemberId() 
    {
        return memberId;
    }

    public void setUsername(String username) 
    {
        this.username = username;
    }

    public String getUsername() 
    {
        return username;
    }

    public void setPassword(String password) 
    {
        this.password = password;
    }

    public String getPassword() 
    {
        return password;
    }

    public void setNickname(String nickname) 
    {
        this.nickname = nickname;
    }

    public String getNickname() 
    {
        return nickname;
    }

    public void setPhone(String phone) 
    {
        this.phone = phone;
    }

    public String getPhone() 
    {
        return phone;
    }

    public void setStatus(String status) 
    {
        this.status = status;
    }

    public String getStatus() 
    {
        return status;
    }

    public void setVoteStatus(String voteStatus) {
        this.voteStatus = voteStatus;
    }

    public String getVoteStatus() {
        return voteStatus;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("memberId", getMemberId())
            .append("username", getUsername())
            .append("password", getPassword())
            .append("nickname", getNickname())
            .append("phone", getPhone())
            .append("status", getStatus())
            .append("createTime", getCreateTime())
            .toString();
    }
}
