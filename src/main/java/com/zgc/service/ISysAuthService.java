package com.zgc.service;

import com.zgc.base.service.BaseService;
import com.zgc.model.SysAuth;

import java.util.List;

public interface ISysAuthService extends BaseService<SysAuth> {
    List<SysAuth> getByRoleId ( List<Integer> roleIdList);

}
