package com.zgc.service.impl;

import com.zgc.base.dao.BaseDao;
import com.zgc.base.service.impl.BaseServiceImpl;
import com.zgc.dao.SysAuthDao;
import com.zgc.dao.SysUserDao;
import com.zgc.model.SysAuth;
import com.zgc.model.SysUser;
import com.zgc.service.ISysAuthService;
import com.zgc.service.ISysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @program: HMSH
 * @description: 系统权限，SysAuth
 * @author: laoyangtou
 * @create: 2018-07-06 14:26
 **/
@Service
public class SysAuthServiceImpl extends BaseServiceImpl<SysAuth> implements ISysAuthService {

    @Autowired
    SysAuthDao sysAuthDao;
    @Override
    public BaseDao<SysAuth> baseDao() {
        return sysAuthDao;
    }

}
