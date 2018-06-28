package com.zgc.base.service;

public interface BaseService<T> {
    T findById(int id);

    int add(T t);

    int update(T t);

    int deleteById(int id);
}
