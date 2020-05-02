package com.mmarciniak.repository;

import java.util.List;

public interface Repository<T> {
    T save(T entity);
    List<T>  findAll();
    T findById(Integer id);
    void delete(T entity);
}
