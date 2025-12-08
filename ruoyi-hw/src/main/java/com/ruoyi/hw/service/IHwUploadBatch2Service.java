package com.ruoyi.hw.service;

import java.util.List;
import com.ruoyi.hw.domain.HwUploadBatch2;

/**
 * 作业提交批次2.0Service接口
 * 
 * @author wenjiee
 * @date 2025-12-08
 */
public interface IHwUploadBatch2Service 
{
    /**
     * 查询作业提交批次2.0
     * 
     * @param id 作业提交批次2.0主键
     * @return 作业提交批次2.0
     */
    public HwUploadBatch2 selectHwUploadBatch2ById(Long id);

    /**
     * 查询作业提交批次2.0列表
     * 
     * @param hwUploadBatch2 作业提交批次2.0
     * @return 作业提交批次2.0集合
     */
    public List<HwUploadBatch2> selectHwUploadBatch2List(HwUploadBatch2 hwUploadBatch2);

    /**
     * 新增作业提交批次2.0
     * 
     * @param hwUploadBatch2 作业提交批次2.0
     * @return 结果
     */
    public int insertHwUploadBatch2(HwUploadBatch2 hwUploadBatch2);

    /**
     * 修改作业提交批次2.0
     * 
     * @param hwUploadBatch2 作业提交批次2.0
     * @return 结果
     */
    public int updateHwUploadBatch2(HwUploadBatch2 hwUploadBatch2);

    /**
     * 批量删除作业提交批次2.0
     * 
     * @param ids 需要删除的作业提交批次2.0主键集合
     * @return 结果
     */
    public int deleteHwUploadBatch2ByIds(Long[] ids);

    /**
     * 删除作业提交批次2.0信息
     * 
     * @param id 作业提交批次2.0主键
     * @return 结果
     */
    public int deleteHwUploadBatch2ById(Long id);
}
