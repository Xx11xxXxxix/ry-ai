package com.ruoyi.system.domain;

import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 作业提交批次对象 hw_upload_batch
 * 
 * @author ruoyi
 * @date 2025-12-05
 */
public class HwUploadBatch extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 批次ID */
    private Long id;

    /** 学生ID */
    @Excel(name = "学生ID")
    private Long studentId;

    /** 学生姓名 */
    @Excel(name = "学生姓名")
    private String studentName;

    /** 课程ID（可选） */
    @Excel(name = "课程ID", readConverterExp = "可=选")
    private String courseId;

    /** 批次号（时间戳+随机） */
    @Excel(name = "批次号", readConverterExp = "时=间戳+随机")
    private String batchNo;

    /** 本次提交文件数量 */
    @Excel(name = "本次提交文件数量")
    private Long fileCount;

    /** 提交时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "提交时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date submitTime;

    /** AI评测状态 0未评 1评测中 2已完成 3失败 */
    @Excel(name = "AI评测状态 0未评 1评测中 2已完成 3失败")
    private Long aiStatus;

    /** AI完整评语 */
    @Excel(name = "AI完整评语")
    private String aiReview;

    /** AI总得分 */
    @Excel(name = "AI总得分")
    private BigDecimal totalScore;

    @Excel(name = "教师评语")
    private String tcReview;

    public void setTcReview(String tcReview)
    {
        this.tcReview = tcReview;
    }

    public String getTcReview()
    {
        return tcReview;
    }


    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }

    public void setStudentId(Long studentId) 
    {
        this.studentId = studentId;
    }

    public Long getStudentId() 
    {
        return studentId;
    }

    public void setStudentName(String studentName) 
    {
        this.studentName = studentName;
    }

    public String getStudentName() 
    {
        return studentName;
    }

    public void setCourseId(String courseId)
    {
        this.courseId = courseId;
    }

    public String getCourseId()
    {
        return courseId;
    }

    public void setBatchNo(String batchNo) 
    {
        this.batchNo = batchNo;
    }

    public String getBatchNo() 
    {
        return batchNo;
    }

    public void setFileCount(Long fileCount) 
    {
        this.fileCount = fileCount;
    }

    public Long getFileCount() 
    {
        return fileCount;
    }

    public void setSubmitTime(Date submitTime) 
    {
        this.submitTime = submitTime;
    }

    public Date getSubmitTime() 
    {
        return submitTime;
    }

    public void setAiStatus(Long aiStatus) 
    {
        this.aiStatus = aiStatus;
    }

    public Long getAiStatus() 
    {
        return aiStatus;
    }

    public void setAiReview(String aiReview) 
    {
        this.aiReview = aiReview;
    }

    public String getAiReview() 
    {
        return aiReview;
    }

    public void setTotalScore(BigDecimal totalScore) 
    {
        this.totalScore = totalScore;
    }

    public BigDecimal getTotalScore() 
    {
        return totalScore;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("studentId", getStudentId())
            .append("studentName", getStudentName())
            .append("courseId", getCourseId())
            .append("batchNo", getBatchNo())
            .append("fileCount", getFileCount())
            .append("submitTime", getSubmitTime())
            .append("aiStatus", getAiStatus())
            .append("aiReview", getAiReview())
            .append("totalScore", getTotalScore())
            .append("createTime", getCreateTime())
            .append("updateTime", getUpdateTime())
            .append("tcReview", getTcReview())
            .toString();
    }
}
