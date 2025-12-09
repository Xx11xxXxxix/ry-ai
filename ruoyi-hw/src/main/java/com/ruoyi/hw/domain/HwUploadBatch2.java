package com.ruoyi.hw.domain;

import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 作业提交批次2.0对象 hw_upload_batch
 *
 * @author wenjiee
 * @date 2025-12-08
 */
public class HwUploadBatch2 extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    private Long id;
    private Long studentId;
    private String studentName;
    private String courseId; // 保持 String 类型，与原版一致
    private String batchNo;
    private Long fileCount;
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date submitTime;
    private Long aiStatus;
    private String aiReview;
    private BigDecimal totalScore;
    private String tcReview; // 保留此字段，因为原始 HwUploadBatch 中存在

    // --- Getters and Setters (与原版完全一致) ---

    public void setTcReview(String tcReview) { this.tcReview = tcReview; }
    public String getTcReview() { return tcReview; }
    public void setId(Long id) { this.id = id; }
    public Long getId() { return id; }
    public void setStudentId(Long studentId) { this.studentId = studentId; }
    public Long getStudentId() { return studentId; }
    public void setStudentName(String studentName) { this.studentName = studentName; }
    public String getStudentName() { return studentName; }
    public void setCourseId(String courseId) { this.courseId = courseId; }
    public String getCourseId() { return courseId; }
    public void setBatchNo(String batchNo) { this.batchNo = batchNo; }
    public String getBatchNo() { return batchNo; }
    public void setFileCount(Long fileCount) { this.fileCount = fileCount; }
    public Long getFileCount() { return fileCount; }
    public void setSubmitTime(Date submitTime) { this.submitTime = submitTime; }
    public Date getSubmitTime() { return submitTime; }
    public void setAiStatus(Long aiStatus) { this.aiStatus = aiStatus; }
    public Long getAiStatus() { return aiStatus; }
    public void setAiReview(String aiReview) { this.aiReview = aiReview; }
    public String getAiReview() { return aiReview; }
    public void setTotalScore(BigDecimal totalScore) { this.totalScore = totalScore; }
    public BigDecimal getTotalScore() { return totalScore; }

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