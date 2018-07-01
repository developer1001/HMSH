package com.zgc.service;

import com.zgc.base.service.BaseService;
import com.zgc.model.SysUser;

public interface ISysUserService extends BaseService<SysUser>{
    /**
     * 登录验证
     * @param loginName
     * @param password
     * @return
     */
    SysUser login(String loginName, String password);
}
