package com.ruoyi.hw.service.impl;

import java.util.HashSet;
import java.util.List;
import java.util.Set;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ruoyi.hw.mapper.HwUploadFile2Mapper;
import com.ruoyi.hw.domain.HwUploadFile2;
import com.ruoyi.hw.service.IHwUploadFile2Service;
import com.ruoyi.hw.mapper.HwUploadBatch2Mapper;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.core.domain.entity.SysRole;

/**
 * 作业文件明细2.0 Service业务层处理
 */
@Service
public class HwUploadFile2ServiceImpl implements IHwUploadFile2Service
{
    @Autowired
    private HwUploadFile2Mapper hwUploadFile2Mapper;

    @Autowired
    private HwUploadBatch2Mapper hwUploadBatch2Mapper;

    /**
     * 查询作业文件明细2.0
     */
    @Override
    public HwUploadFile2 selectHwUploadFile2ById(Long id)
    {
        return hwUploadFile2Mapper.selectHwUploadFile2ById(id);
    }

    /**
     * 查询列表（带权限控制）
     */
    @Override
    public List<HwUploadFile2> selectHwUploadFile2List(HwUploadFile2 hwUploadFile2)
    {
        SysUser user = SecurityUtils.getLoginUser().getUser();
        // 如果不是管理员
        if (!SysUser.isAdmin(user.getUserId())) {
            boolean isTeacher = false;
            // 判断是否为教师
            if (user.getRoles() != null) {
                for (SysRole role : user.getRoles()) {
                    if ("teacher".equals(role.getRoleKey()) || "教师".equals(role.getRoleName())) {
                        isTeacher = true;
                        break;
                    }
                }
            }
            // 学生只能看自己的
            if (!isTeacher) {
                hwUploadFile2.getParams().put("studentId", user.getUserId());
            }
        }
        return hwUploadFile2Mapper.selectHwUploadFile2List(hwUploadFile2);
    }

    /**
     * 新增
     */
    @Override
    public int insertHwUploadFile2(HwUploadFile2 hwUploadFile2)
    {
        hwUploadFile2.setCreateTime(DateUtils.getNowDate());
        return hwUploadFile2Mapper.insertHwUploadFile2(hwUploadFile2);
    }

    /**
     * 修改
     */
    @Override
    public int updateHwUploadFile2(HwUploadFile2 hwUploadFile2)
    {
        hwUploadFile2.setUpdateTime(DateUtils.getNowDate());
        return hwUploadFile2Mapper.updateHwUploadFile2(hwUploadFile2);
    }

    /**
     * 批量删除：删文件 -> 连带删批次
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public int deleteHwUploadFile2ByIds(Long[] ids)
    {
        Set<Long> relatedBatchIds = new HashSet<>();
        for (Long id : ids) {
            HwUploadFile2 file = hwUploadFile2Mapper.selectHwUploadFile2ById(id);
            if (file != null && file.getBatchId() != null) {
                relatedBatchIds.add(file.getBatchId());
            }
        }

        int rows = hwUploadFile2Mapper.deleteHwUploadFile2ByIds(ids);

        if (!relatedBatchIds.isEmpty()) {
            hwUploadBatch2Mapper.deleteHwUploadBatch2ByIds(relatedBatchIds.toArray(new Long[0]));
        }

        return rows;
    }

    /**
     * 单个删除：删文件 -> 连带删批次
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public int deleteHwUploadFile2ById(Long id)
    {
        HwUploadFile2 file = hwUploadFile2Mapper.selectHwUploadFile2ById(id);
        Long batchId = (file != null) ? file.getBatchId() : null;

        int rows = hwUploadFile2Mapper.deleteHwUploadFile2ById(id);

        if (batchId != null) {
            hwUploadBatch2Mapper.deleteHwUploadBatch2ById(batchId);
        }
        return rows;
    }
}