package com.ruoyi.hw.mapper;

import java.util.List;
import com.ruoyi.hw.domain.HwUploadBatch2;

/**
 * 作业提交批次2.0Mapper接口
 *
 * @author wenjiee
 * @date 2025-12-08
 */
public interface HwUploadBatch2Mapper
{
    /**
     * 根据主键查询作业提交批次2.0
     *
     * @param id 作业提交批次2.0主键
     * @return 作业提交批次2.0
     */
    public HwUploadBatch2 selectHwUploadBatch2ById(Long id);

    /**
     * 查询作业提交批次2.0列表
     *
     * @param hwUploadBatch2 作业提交批次2.0查询条件
     * @return 作业提交批次2.0集合
     */
    public List<HwUploadBatch2> selectHwUploadBatch2List(HwUploadBatch2 hwUploadBatch2);

    /**
     * 新增作业提交批次2.0
     *
     * @param hwUploadBatch2 作业提交批次2.0对象
     * @return 影响行数
     */
    public int insertHwUploadBatch2(HwUploadBatch2 hwUploadBatch2);

    /**
     * 修改作业提交批次2.0
     *
     * @param hwUploadBatch2 作业提交批次2.0对象
     * @return 影响行数
     */
    public int updateHwUploadBatch2(HwUploadBatch2 hwUploadBatch2);

    /**
     * 根据主键删除作业提交批次2.0
     *
     * @param id 作业提交批次2.0主键
     * @return 影响行数
     */
    public int deleteHwUploadBatch2ById(Long id);

    /**
     * 批量删除作业提交批次2.0
     *
     * @param ids 需要删除的数据主键集合
     * @return 影响行数
     */
    public int deleteHwUploadBatch2ByIds(Long[] ids);
}