package com.zgc.service.impl;

import com.zgc.base.dao.BaseDao;
import com.zgc.base.service.impl.BaseServiceImpl;
import com.zgc.dao.SysRoleDao;
import com.zgc.model.SysRole;
import com.zgc.service.ISysRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @program: HMSH
 * @description: 系统角色
 * @author: laoyangtou
 * @create: 2018-07-06 15:49
 **/
@Service
public class SysRoleServiceImpl extends BaseServiceImpl<SysRole> implements ISysRoleService {
    @Autowired
    SysRoleDao sysRoleDao;
    @Override
    public BaseDao<SysRole> baseDao() {
        return sysRoleDao;
    }
}

