package com.zgc.service;

import com.zgc.base.service.BaseService;
import com.zgc.model.SysAuth;
import com.zgc.model.SysRole;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ISysAuthService extends BaseService<SysAuth> {
    List<SysAuth> getByRoleId ( List<Integer> roleIdList);

}
