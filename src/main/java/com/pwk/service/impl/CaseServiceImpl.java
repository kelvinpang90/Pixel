package com.pwk.service.impl;

import com.pwk.entity.Case;
import com.pwk.service.CaseService;
import org.apache.commons.lang.StringUtils;
import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by wenkai.peng on 10/23/2014.
 */
@Transactional
public class CaseServiceImpl implements CaseService {

    @Resource
    private SessionFactory sessionFactory;

    @Override
    public void add(Case cases) {
        sessionFactory.getCurrentSession().save(cases);
    }

    @Override
    public void delete(int id) {
        sessionFactory.getCurrentSession().delete(this.getById(id));
    }

    @Override
    public void update(Case cases) {
        sessionFactory.getCurrentSession().merge(cases);
    }

    @Override
    public Case getById(int id) {
        return (Case)sessionFactory.getCurrentSession().get(Case.class,id);
    }


    @Override
    public List<Case> getByList(String type, int page, int size) {
        if(page==0||size==0){
            page = 1;
            size = 10;
        }
        Query query = null;
        if(StringUtils.isNotBlank(type)){
            query = sessionFactory.getCurrentSession().createQuery("from Case c where c.type=:type order by c.createDate desc");
            query.setParameter("type",type, Hibernate.STRING);
        }else{
            query = sessionFactory.getCurrentSession().createQuery("from Case c order by c.createDate desc");
        }
        query.setFirstResult(size * (page - 1));
        query.setMaxResults(size);
        return query.list();
    }

    @Override
    public int getTotal() {
        return sessionFactory.getCurrentSession().createQuery("from Case where 1=1").list().size();
    }
}
