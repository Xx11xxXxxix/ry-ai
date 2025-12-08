package com.ruoyi.hw.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.hw.mapper.HwUploadFile2Mapper;
import com.ruoyi.hw.domain.HwUploadFile2;
import com.ruoyi.hw.service.IHwUploadFile2Service;

/**
 * 作业文件明细2.0Service业务层处理
 * 
 * @author wenjie
 * @date 2025-12-08
 */
@Service
public class HwUploadFile2ServiceImpl implements IHwUploadFile2Service 
{
    @Autowired
    private HwUploadFile2Mapper hwUploadFile2Mapper;

    /**
     * 查询作业文件明细2.0
     * 
     * @param id 作业文件明细2.0主键
     * @return 作业文件明细2.0
     */
    @Override
    public HwUploadFile2 selectHwUploadFile2ById(Long id)
    {
        return hwUploadFile2Mapper.selectHwUploadFile2ById(id);
    }

    /**
     * 查询作业文件明细2.0列表
     * 
     * @param hwUploadFile2 作业文件明细2.0
     * @return 作业文件明细2.0
     */
    @Override
    public List<HwUploadFile2> selectHwUploadFile2List(HwUploadFile2 hwUploadFile2)
    {
        return hwUploadFile2Mapper.selectHwUploadFile2List(hwUploadFile2);
    }

    /**
     * 新增作业文件明细2.0
     * 
     * @param hwUploadFile2 作业文件明细2.0
     * @return 结果
     */
    @Override
    public int insertHwUploadFile2(HwUploadFile2 hwUploadFile2)
    {
        hwUploadFile2.setCreateTime(DateUtils.getNowDate());
        return hwUploadFile2Mapper.insertHwUploadFile2(hwUploadFile2);
    }

    /**
     * 修改作业文件明细2.0
     * 
     * @param hwUploadFile2 作业文件明细2.0
     * @return 结果
     */
    @Override
    public int updateHwUploadFile2(HwUploadFile2 hwUploadFile2)
    {
        return hwUploadFile2Mapper.updateHwUploadFile2(hwUploadFile2);
    }

    /**
     * 批量删除作业文件明细2.0
     * 
     * @param ids 需要删除的作业文件明细2.0主键
     * @return 结果
     */
    @Override
    public int deleteHwUploadFile2ByIds(Long[] ids)
    {
        return hwUploadFile2Mapper.deleteHwUploadFile2ByIds(ids);
    }

    /**
     * 删除作业文件明细2.0信息
     * 
     * @param id 作业文件明细2.0主键
     * @return 结果
     */
    @Override
    public int deleteHwUploadFile2ById(Long id)
    {
        return hwUploadFile2Mapper.deleteHwUploadFile2ById(id);
    }
}
