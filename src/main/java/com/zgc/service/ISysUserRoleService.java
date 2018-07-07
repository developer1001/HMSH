package com.zgc.service;

import com.zgc.base.service.BaseService;
import com.zgc.model.SysAuth;
import com.zgc.model.SysUserRole;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ISysUserRoleService extends BaseService<SysUserRole> {
    /**
     * 根据用户id获取所有的角色
     * @param userId
     * @return
     */
    List<SysUserRole> getByUserId(int userId);

}
