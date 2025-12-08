package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.HwUploadBatch;

/**
 * 作业提交批次Mapper接口
 * 
 * @author ruoyi
 * @date 2025-12-05
 */
public interface HwUploadBatchMapper 
{
    /**
     * 查询作业提交批次
     * 
     * @param id 作业提交批次主键
     * @return 作业提交批次
     */
    public HwUploadBatch selectHwUploadBatchById(Long id);

    /**
     * 查询作业提交批次列表
     * 
     * @param hwUploadBatch 作业提交批次
     * @return 作业提交批次集合
     */
    public List<HwUploadBatch> selectHwUploadBatchList(HwUploadBatch hwUploadBatch);

    /**
     * 新增作业提交批次
     * 
     * @param hwUploadBatch 作业提交批次
     * @return 结果
     */
    public int insertHwUploadBatch(HwUploadBatch hwUploadBatch);

    /**
     * 修改作业提交批次
     * 
     * @param hwUploadBatch 作业提交批次
     * @return 结果
     */
    public int updateHwUploadBatch(HwUploadBatch hwUploadBatch);

    /**
     * 删除作业提交批次
     * 
     * @param id 作业提交批次主键
     * @return 结果
     */
    public int deleteHwUploadBatchById(Long id);

    /**
     * 批量删除作业提交批次
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteHwUploadBatchByIds(Long[] ids);
}
