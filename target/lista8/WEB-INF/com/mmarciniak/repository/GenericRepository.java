package com.mmarciniak.repository;

import com.mmarciniak.config.HibernateConfig;
import org.hibernate.Session;
import org.hibernate.query.Query;


import java.util.List;

public class GenericRepository<T> implements Repository<T>{

    private Class<T> clazz;



    public void setClazz(Class<T> clazzToSet){
        this.clazz = clazzToSet;
    }

    @Override
    public T save(T entity) {
        try(Session session = HibernateConfig.getSessionFactory().openSession())
        {
            session.beginTransaction();
            session.saveOrUpdate(entity);
            session.getTransaction().commit();
        }
        return entity;
    }

    @Override
    public List<T> findAll() {
        List entities;
        try(Session session = HibernateConfig.getSessionFactory().openSession())
        {
            entities = session.createQuery("FROM " + clazz.getSimpleName()).list();
        }
        return entities;
    }

    @Override
    public T findById(Integer id) {
        T entity;
        try(Session session =HibernateConfig.getSessionFactory().openSession()) {
            Query query = session.createQuery("FROM " + clazz.getSimpleName() + " WHERE id = :id");
            query.setParameter("id",id);
            entity = (T) query.list().get(0);
        }
        return entity;
    }

    @Override
    public void delete(T entity) {
        try (Session session = HibernateConfig.getSessionFactory().openSession()){
            session.beginTransaction();
            session.delete(entity);
            session.getTransaction().commit();
        }
    }
}
