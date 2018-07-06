package com.zgc.service.impl;

import com.zgc.base.dao.BaseDao;
import com.zgc.base.service.impl.BaseServiceImpl;
import com.zgc.dao.SysUserDeptDao;
import com.zgc.dao.SysUserRoleDao;
import com.zgc.model.SysUserDept;
import com.zgc.model.SysUserRole;
import com.zgc.service.ISysUserDeptService;
import com.zgc.service.ISysUserRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @program: HMSH
 * @description: 用户和角色
 * @author: laoyangtou
 * @create: 2018-07-06 15:53
 **/
@Service
public class SysUserRoleServciceImpl extends BaseServiceImpl<SysUserRole> implements ISysUserRoleService {
    @Autowired
    SysUserRoleDao sysUserRoleDao;
    @Override
    public BaseDao<SysUserRole> baseDao() {
        return sysUserRoleDao;
    }
}



