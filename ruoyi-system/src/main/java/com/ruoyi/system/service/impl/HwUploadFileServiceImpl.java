package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.HwUploadFileMapper;
import com.ruoyi.system.domain.HwUploadFile;
import com.ruoyi.system.service.IHwUploadFileService;

/**
 * 作业文件明细Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-12-05
 */
@Service
public class HwUploadFileServiceImpl implements IHwUploadFileService 
{
    @Autowired
    private HwUploadFileMapper hwUploadFileMapper;

    /**
     * 查询作业文件明细
     * 
     * @param id 作业文件明细主键
     * @return 作业文件明细
     */
    @Override
    public HwUploadFile selectHwUploadFileById(Long id)
    {
        return hwUploadFileMapper.selectHwUploadFileById(id);
    }

    /**
     * 查询作业文件明细列表
     * 
     * @param hwUploadFile 作业文件明细
     * @return 作业文件明细
     */
    @Override
    public List<HwUploadFile> selectHwUploadFileList(HwUploadFile hwUploadFile)
    {
        return hwUploadFileMapper.selectHwUploadFileList(hwUploadFile);
    }

    /**
     * 新增作业文件明细
     * 
     * @param hwUploadFile 作业文件明细
     * @return 结果
     */
    @Override
    public int insertHwUploadFile(HwUploadFile hwUploadFile)
    {
        hwUploadFile.setCreateTime(DateUtils.getNowDate());
        return hwUploadFileMapper.insertHwUploadFile(hwUploadFile);
    }

    /**
     * 修改作业文件明细
     * 
     * @param hwUploadFile 作业文件明细
     * @return 结果
     */
    @Override
    public int updateHwUploadFile(HwUploadFile hwUploadFile)
    {
        return hwUploadFileMapper.updateHwUploadFile(hwUploadFile);
    }

    /**
     * 批量删除作业文件明细
     * 
     * @param ids 需要删除的作业文件明细主键
     * @return 结果
     */
    @Override
    public int deleteHwUploadFileByIds(Long[] ids)
    {
        return hwUploadFileMapper.deleteHwUploadFileByIds(ids);
    }

    /**
     * 删除作业文件明细信息
     * 
     * @param id 作业文件明细主键
     * @return 结果
     */
    @Override
    public int deleteHwUploadFileById(Long id)
    {
        return hwUploadFileMapper.deleteHwUploadFileById(id);
    }
}
