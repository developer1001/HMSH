package com.zgc.dao;

import com.zgc.base.dao.BaseDao;
import com.zgc.model.SysUserRole;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SysUserRoleDao extends BaseDao<SysUserRole> {
    List<SysUserRole> getByUserId(@Param("userId") int userId);
}
