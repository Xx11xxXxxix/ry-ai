package com.ruoyi.hw.domain;

import java.math.BigDecimal;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 作业文件明细2.0对象 hw_upload_file
 * 
 * @author wenjie
 * @date 2025-12-08
 */
public class HwUploadFile2 extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** id */
    @Excel(name = "id")
    private Long id;

    /** 关联批次ID */
    @Excel(name = "关联批次ID")
    private Long batchId;

    /** 原始文件名 */
    @Excel(name = "原始文件名")
    private String fileName;

    /** 后缀如 .c .cpp .java */
    @Excel(name = "后缀如 .c .cpp .java")
    private String fileExt;

    /** 文件大小字节 */
    @Excel(name = "文件大小字节")
    private Long fileSize;

    /** 存储路径 /upload/homework/2025/12/03/xxx.c */
    @Excel(name = "存储路径 /upload/homework/2025/12/03/xxx.c")
    private String filePath;

    /** 文件内容文本（供AI直接读） */
    @Excel(name = "文件内容文本", readConverterExp = "供=AI直接读")
    private String codeContent;

    /** 判题结果 */
    @Excel(name = "判题结果")
    private String judgeResult;

    /** 单文件AI得分 */
    @Excel(name = "单文件AI得分")
    private BigDecimal aiScore;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }

    public void setBatchId(Long batchId) 
    {
        this.batchId = batchId;
    }

    public Long getBatchId() 
    {
        return batchId;
    }

    public void setFileName(String fileName) 
    {
        this.fileName = fileName;
    }

    public String getFileName() 
    {
        return fileName;
    }

    public void setFileExt(String fileExt) 
    {
        this.fileExt = fileExt;
    }

    public String getFileExt() 
    {
        return fileExt;
    }

    public void setFileSize(Long fileSize) 
    {
        this.fileSize = fileSize;
    }

    public Long getFileSize() 
    {
        return fileSize;
    }

    public void setFilePath(String filePath) 
    {
        this.filePath = filePath;
    }

    public String getFilePath() 
    {
        return filePath;
    }

    public void setCodeContent(String codeContent) 
    {
        this.codeContent = codeContent;
    }

    public String getCodeContent() 
    {
        return codeContent;
    }

    public void setJudgeResult(String judgeResult) 
    {
        this.judgeResult = judgeResult;
    }

    public String getJudgeResult() 
    {
        return judgeResult;
    }

    public void setAiScore(BigDecimal aiScore) 
    {
        this.aiScore = aiScore;
    }

    public BigDecimal getAiScore() 
    {
        return aiScore;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("batchId", getBatchId())
            .append("fileName", getFileName())
            .append("fileExt", getFileExt())
            .append("fileSize", getFileSize())
            .append("filePath", getFilePath())
            .append("codeContent", getCodeContent())
            .append("judgeResult", getJudgeResult())
            .append("aiScore", getAiScore())
            .append("createTime", getCreateTime())
            .toString();
    }
}
