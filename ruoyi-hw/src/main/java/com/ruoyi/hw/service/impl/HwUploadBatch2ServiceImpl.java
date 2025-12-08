package com.ruoyi.hw.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.hw.mapper.HwUploadBatch2Mapper;
import com.ruoyi.hw.domain.HwUploadBatch2;
import com.ruoyi.hw.service.IHwUploadBatch2Service;

/**
 * 作业提交批次2.0Service业务层处理
 * 
 * @author wenjiee
 * @date 2025-12-08
 */
@Service
public class HwUploadBatch2ServiceImpl implements IHwUploadBatch2Service 
{
    @Autowired
    private HwUploadBatch2Mapper hwUploadBatch2Mapper;

    /**
     * 查询作业提交批次2.0
     * 
     * @param id 作业提交批次2.0主键
     * @return 作业提交批次2.0
     */
    @Override
    public HwUploadBatch2 selectHwUploadBatch2ById(Long id)
    {
        return hwUploadBatch2Mapper.selectHwUploadBatch2ById(id);
    }

    /**
     * 查询作业提交批次2.0列表
     * 
     * @param hwUploadBatch2 作业提交批次2.0
     * @return 作业提交批次2.0
     */
    @Override
    public List<HwUploadBatch2> selectHwUploadBatch2List(HwUploadBatch2 hwUploadBatch2)
    {
        return hwUploadBatch2Mapper.selectHwUploadBatch2List(hwUploadBatch2);
    }

    /**
     * 新增作业提交批次2.0
     * 
     * @param hwUploadBatch2 作业提交批次2.0
     * @return 结果
     */
    @Override
    public int insertHwUploadBatch2(HwUploadBatch2 hwUploadBatch2)
    {
        hwUploadBatch2.setCreateTime(DateUtils.getNowDate());
        return hwUploadBatch2Mapper.insertHwUploadBatch2(hwUploadBatch2);
    }

    /**
     * 修改作业提交批次2.0
     * 
     * @param hwUploadBatch2 作业提交批次2.0
     * @return 结果
     */
    @Override
    public int updateHwUploadBatch2(HwUploadBatch2 hwUploadBatch2)
    {
        hwUploadBatch2.setUpdateTime(DateUtils.getNowDate());
        return hwUploadBatch2Mapper.updateHwUploadBatch2(hwUploadBatch2);
    }

    /**
     * 批量删除作业提交批次2.0
     * 
     * @param ids 需要删除的作业提交批次2.0主键
     * @return 结果
     */
    @Override
    public int deleteHwUploadBatch2ByIds(Long[] ids)
    {
        return hwUploadBatch2Mapper.deleteHwUploadBatch2ByIds(ids);
    }

    /**
     * 删除作业提交批次2.0信息
     * 
     * @param id 作业提交批次2.0主键
     * @return 结果
     */
    @Override
    public int deleteHwUploadBatch2ById(Long id)
    {
        return hwUploadBatch2Mapper.deleteHwUploadBatch2ById(id);
    }
}
