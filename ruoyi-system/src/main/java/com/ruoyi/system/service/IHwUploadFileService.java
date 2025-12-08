package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.HwUploadFile;

/**
 * 作业文件明细Service接口
 * 
 * @author ruoyi
 * @date 2025-12-05
 */
public interface IHwUploadFileService 
{
    /**
     * 查询作业文件明细
     * 
     * @param id 作业文件明细主键
     * @return 作业文件明细
     */
    public HwUploadFile selectHwUploadFileById(Long id);

    /**
     * 查询作业文件明细列表
     * 
     * @param hwUploadFile 作业文件明细
     * @return 作业文件明细集合
     */
    public List<HwUploadFile> selectHwUploadFileList(HwUploadFile hwUploadFile);

    /**
     * 新增作业文件明细
     * 
     * @param hwUploadFile 作业文件明细
     * @return 结果
     */
    public int insertHwUploadFile(HwUploadFile hwUploadFile);

    /**
     * 修改作业文件明细
     * 
     * @param hwUploadFile 作业文件明细
     * @return 结果
     */
    public int updateHwUploadFile(HwUploadFile hwUploadFile);

    /**
     * 批量删除作业文件明细
     * 
     * @param ids 需要删除的作业文件明细主键集合
     * @return 结果
     */
    public int deleteHwUploadFileByIds(Long[] ids);

    /**
     * 删除作业文件明细信息
     * 
     * @param id 作业文件明细主键
     * @return 结果
     */
    public int deleteHwUploadFileById(Long id);
}
