package com.ruoyi.hw.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.hw.mapper.HwUploadBatch2Mapper; // 适配1: 导入新的 Mapper 接口
import com.ruoyi.hw.domain.HwUploadBatch2;     // 适配2: 导入新的 Domain 实体
import com.ruoyi.hw.service.IHwUploadBatch2Service; // 适配3: 实现新的 Service 接口
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.core.domain.entity.SysRole;
import com.ruoyi.common.utils.StringUtils;
/**
 * 作业提交批次2.0 Service业务层处理
 *
 * @author wenjiee
 * @date 2025-12-08
 */
@Service
public class HwUploadBatch2ServiceImpl implements IHwUploadBatch2Service
{
    @Autowired
    private HwUploadBatch2Mapper hwUploadBatch2Mapper; // 适配4: 注入新的 Mapper 实例

    /**
     * 查询作业提交批次2.0
     *
     * @param id 作业提交批次2.0主键
     * @return 作业提交批次2.0
     */
    @Override
    public HwUploadBatch2 selectHwUploadBatch2ById(Long id)
    {
        // 适配5: 所有方法的操作对象均已切换为 HwUploadBatch2
        return hwUploadBatch2Mapper.selectHwUploadBatch2ById(id);
    }

    /**
     * 查询作业提交批次2.0列表
     *
     * @param hwUploadBatch2 作业提交批次2.0
     * @return 作业提交批次2.0集合
     */
    @Override
    public List<HwUploadBatch2> selectHwUploadBatch2List(HwUploadBatch2 hwUploadBatch2)
    {
        SysUser user = SecurityUtils.getLoginUser().getUser();

        if (!SysUser.isAdmin(user.getUserId())) {

            List<SysRole> roles = user.getRoles();
            boolean isTeacher = false;

            if (roles != null) {
                for (SysRole role : roles) {
                    if ("teacher".equals(role.getRoleKey()) || "教师".equals(role.getRoleName())) {
                        isTeacher = true;
                        break;
                    }
                }
            }

            if (!isTeacher) {
                hwUploadBatch2.setStudentId(user.getUserId());
            }
        }

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
        // 业务逻辑保留: 自动设置创建时间
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
        // 业务逻辑保留: 自动设置更新时间
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