package com.ruoyi.hw.mapper;

import java.util.List;
import com.ruoyi.hw.domain.HwUploadFile2;

/**
 * 作业文件明细2.0Mapper接口
 * 
 * @author wenjie
 * @date 2025-12-08
 */
public interface HwUploadFile2Mapper 
{
    /**
     * 查询作业文件明细2.0
     * 
     * @param id 作业文件明细2.0主键
     * @return 作业文件明细2.0
     */
    public HwUploadFile2 selectHwUploadFile2ById(Long id);

    /**
     * 查询作业文件明细2.0列表
     * 
     * @param hwUploadFile2 作业文件明细2.0
     * @return 作业文件明细2.0集合
     */
    public List<HwUploadFile2> selectHwUploadFile2List(HwUploadFile2 hwUploadFile2);

    /**
     * 新增作业文件明细2.0
     * 
     * @param hwUploadFile2 作业文件明细2.0
     * @return 结果
     */
    public int insertHwUploadFile2(HwUploadFile2 hwUploadFile2);

    /**
     * 修改作业文件明细2.0
     * 
     * @param hwUploadFile2 作业文件明细2.0
     * @return 结果
     */
    public int updateHwUploadFile2(HwUploadFile2 hwUploadFile2);

    /**
     * 删除作业文件明细2.0
     * 
     * @param id 作业文件明细2.0主键
     * @return 结果
     */
    public int deleteHwUploadFile2ById(Long id);

    /**
     * 批量删除作业文件明细2.0
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteHwUploadFile2ByIds(Long[] ids);
}
