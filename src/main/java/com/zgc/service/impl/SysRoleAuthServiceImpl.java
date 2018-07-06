package com.zgc.service.impl;

import com.zgc.base.dao.BaseDao;
import com.zgc.base.service.impl.BaseServiceImpl;
import com.zgc.dao.SysDeptDao;
import com.zgc.dao.SysRoleAuthDao;
import com.zgc.model.SysDept;
import com.zgc.model.SysRoleAuth;
import com.zgc.service.ISysDeptService;
import com.zgc.service.ISysRoleAuthService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @program: HMSH
 * @description: 角色与菜单
 * @author: laoyangtou
 * @create: 2018-07-06 15:47
 **/
@Service
public class SysRoleAuthServiceImpl extends BaseServiceImpl<SysRoleAuth> implements ISysRoleAuthService {
    @Autowired
    SysRoleAuthDao sysRoleAuthDao;
    @Override
    public BaseDao<SysRoleAuth> baseDao() {
        return sysRoleAuthDao;
    }
}
