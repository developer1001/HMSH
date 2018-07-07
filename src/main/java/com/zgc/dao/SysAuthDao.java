package com.zgc.dao;

import com.zgc.base.dao.BaseDao;
import com.zgc.model.SysAuth;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SysAuthDao extends BaseDao<SysAuth> {
    List<SysAuth> getByRoleId (@Param("authIdList") List<Integer> roleIdList);
}
