package com.zgc.service.impl;

import com.zgc.base.dao.BaseDao;
import com.zgc.base.service.impl.BaseServiceImpl;
import com.zgc.dao.UserDao;
import com.zgc.model.User;
import com.zgc.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl extends BaseServiceImpl<User> implements IUserService {

    @Autowired
    UserDao userDao;

    @Override
    public BaseDao<User> baseDao() {
        return userDao;
    }

    @Override
    public User findById(int id) {
        return super.findById(id);
    }

    @Override
    public int add(User user) {
        return super.add(user);
    }

    @Override
    public int update(User user) {
        return super.update(user);
    }

    @Override
    public int deleteById(int id) {
        return super.deleteById(id);
    }

}
