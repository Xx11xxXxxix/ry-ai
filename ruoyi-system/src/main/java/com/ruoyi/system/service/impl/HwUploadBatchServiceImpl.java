package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.HwUploadBatchMapper;
import com.ruoyi.system.domain.HwUploadBatch;
import com.ruoyi.system.service.IHwUploadBatchService;

/**
 * 作业提交批次Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-12-05
 */
@Service
public class HwUploadBatchServiceImpl implements IHwUploadBatchService 
{
    @Autowired
    private HwUploadBatchMapper hwUploadBatchMapper;

    /**
     * 查询作业提交批次
     * 
     * @param id 作业提交批次主键
     * @return 作业提交批次
     */
    @Override
    public HwUploadBatch selectHwUploadBatchById(Long id)
    {
        return hwUploadBatchMapper.selectHwUploadBatchById(id);
    }

    /**
     * 查询作业提交批次列表
     * 
     * @param hwUploadBatch 作业提交批次
     * @return 作业提交批次
     */
    @Override
    public List<HwUploadBatch> selectHwUploadBatchList(HwUploadBatch hwUploadBatch)
    {
        return hwUploadBatchMapper.selectHwUploadBatchList(hwUploadBatch);
    }

    /**
     * 新增作业提交批次
     * 
     * @param hwUploadBatch 作业提交批次
     * @return 结果
     */
    @Override
    public int insertHwUploadBatch(HwUploadBatch hwUploadBatch)
    {
        hwUploadBatch.setCreateTime(DateUtils.getNowDate());
        return hwUploadBatchMapper.insertHwUploadBatch(hwUploadBatch);
    }

    /**
     * 修改作业提交批次
     * 
     * @param hwUploadBatch 作业提交批次
     * @return 结果
     */
    @Override
    public int updateHwUploadBatch(HwUploadBatch hwUploadBatch)
    {
        hwUploadBatch.setUpdateTime(DateUtils.getNowDate());
        return hwUploadBatchMapper.updateHwUploadBatch(hwUploadBatch);
    }

    /**
     * 批量删除作业提交批次
     * 
     * @param ids 需要删除的作业提交批次主键
     * @return 结果
     */
    @Override
    public int deleteHwUploadBatchByIds(Long[] ids)
    {
        return hwUploadBatchMapper.deleteHwUploadBatchByIds(ids);
    }

    /**
     * 删除作业提交批次信息
     * 
     * @param id 作业提交批次主键
     * @return 结果
     */
    @Override
    public int deleteHwUploadBatchById(Long id)
    {
        return hwUploadBatchMapper.deleteHwUploadBatchById(id);
    }
}
