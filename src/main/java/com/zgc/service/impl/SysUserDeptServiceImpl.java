package com.zgc.service.impl;

import com.zgc.base.dao.BaseDao;
import com.zgc.base.service.impl.BaseServiceImpl;
import com.zgc.dao.SysRoleDao;
import com.zgc.dao.SysUserDeptDao;
import com.zgc.model.SysRole;
import com.zgc.model.SysUserDept;
import com.zgc.service.ISysRoleService;
import com.zgc.service.ISysUserDeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @program: HMSH
 * @description: 用户和部门
 * @author: laoyangtou
 * @create: 2018-07-06 15:51
 **/
@Service
public class SysUserDeptServiceImpl extends BaseServiceImpl<SysUserDept> implements ISysUserDeptService {
    @Autowired
    SysUserDeptDao sysUserDeptDao;
    @Override
    public BaseDao<SysUserDept> baseDao() {
        return sysUserDeptDao;
    }
}


