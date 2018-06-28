package com.zgc.dao;

import com.zgc.base.dao.BaseDao;
import com.zgc.model.User;
//基本的增删改查在 BaseDao里已经实现，不需要自己去写，继承即可。
public interface UserDao extends BaseDao<User> {

}
