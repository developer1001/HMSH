package com.zgc.dao;

import com.zgc.base.dao.BaseDao;
import com.zgc.model.SysRoleAuth;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SysRoleAuthDao extends BaseDao<SysRoleAuth> {

    public List<SysRoleAuth> getByRoleId(@Param("roleIdList") List<Integer> roleIdList);
}
