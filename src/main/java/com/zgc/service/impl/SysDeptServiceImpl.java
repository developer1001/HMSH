package com.zgc.service.impl;

import com.zgc.base.dao.BaseDao;
import com.zgc.base.service.impl.BaseServiceImpl;
import com.zgc.dao.SysDeptDao;
import com.zgc.model.SysDept;
import com.zgc.service.ISysDeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @program: HMSH
 * @description: 系统菜单权限
 * @author: laoyangtou
 * @create: 2018-07-06 15:44
 **/
@Service
public class SysDeptServiceImpl extends BaseServiceImpl<SysDept> implements ISysDeptService {
    @Autowired
    SysDeptDao sysDeptDao;
    @Override
    public BaseDao<SysDept> baseDao() {
        return sysDeptDao;
    }
}
