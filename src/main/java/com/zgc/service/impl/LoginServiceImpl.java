package com.zgc.service.impl;

import com.zgc.base.dao.BaseDao;
import com.zgc.base.service.impl.BaseServiceImpl;
import com.zgc.dao.LoginDao;
import com.zgc.model.SysUser;
import com.zgc.service.ILoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginServiceImpl extends BaseServiceImpl<SysUser> implements ILoginService {

    @Autowired
    LoginDao loginDao;

    /**
     * 登录校验
     * @param loginName
     * @param password
     * @return
     */
    @Override
    public SysUser login(String loginName, String password) {
        return loginDao.login(loginName,password);
    }

    @Override
    public BaseDao<SysUser> baseDao() {
        return null;
    }
}
