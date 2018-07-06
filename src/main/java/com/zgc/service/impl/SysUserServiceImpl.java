package com.zgc.service.impl;

import com.zgc.base.dao.BaseDao;
import com.zgc.base.service.impl.BaseServiceImpl;
import com.zgc.dao.SysUserDao;
import com.zgc.model.SysUser;
import com.zgc.service.ISysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @program: HMSH
 * @description: 系统用户，SysUser
 * @author: laoyangtou
 * @create: 2018-07-06 14:26
 **/
@Service
public class SysUserServiceImpl extends BaseServiceImpl<SysUser> implements ISysUserService {

    @Autowired
    SysUserDao sysUserDao;
    @Override
    public BaseDao<SysUser> baseDao() {
        return sysUserDao;
    }

}
