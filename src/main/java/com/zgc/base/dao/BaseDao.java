package com.zgc.base.dao;

public interface BaseDao<T> {

    T findById(int id);

    int add(T t);

    int update(T t);

    int deleteById(int id);
}
