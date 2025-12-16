package com.ruoyi.hw.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.hw.mapper.HwUploadFile2Mapper;
import com.ruoyi.hw.domain.HwUploadFile2;
import com.ruoyi.hw.service.IHwUploadFile2Service;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.core.domain.entity.SysRole;

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
        // 1. 获取当前用户
        SysUser user = SecurityUtils.getLoginUser().getUser();

        // 2. 权限判断
        if (!SysUser.isAdmin(user.getUserId())) {
            boolean isTeacher = false;
            if (user.getRoles() != null) {
                for (SysRole role : user.getRoles()) {
                    if ("teacher".equals(role.getRoleKey()) || "教师".equals(role.getRoleName())) {
                        isTeacher = true;
                        break;
                    }
                }
            }

            // 3. 核心逻辑：如果是学生（非教师），将 ID 放入 params 参数中
            // BaseEntity 自带 params 属性，专门用于传递 XML 查询参数
            if (!isTeacher) {
                hwUploadFile2.getParams().put("studentId", user.getUserId());
            }
        }

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
        // **核心修正：添加更新时间的逻辑，与 HwUploadBatch2ServiceImpl 保持一致**
        hwUploadFile2.setUpdateTime(DateUtils.getNowDate());
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
