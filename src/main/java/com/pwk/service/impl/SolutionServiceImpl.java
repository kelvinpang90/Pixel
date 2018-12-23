package com.pwk.service.impl;

import com.pwk.entity.Solution;
import com.pwk.service.SolutionService;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by wenkai.peng on 10/24/2014.
 */
@Transactional
public class SolutionServiceImpl implements SolutionService {

    @Resource
    private SessionFactory sessionFactory;

    @Override
    public void add(Solution solution) {
        sessionFactory.getCurrentSession().save(solution);
    }

    @Override
    public void delete(int id) {
        sessionFactory.getCurrentSession().delete(this.getById(id));
    }

    @Override
    public void update(Solution solution) {
        sessionFactory.getCurrentSession().merge(solution);
    }

    @Override
    public Solution getById(int id) {
        return (Solution)sessionFactory.getCurrentSession().get(Solution.class,id);
    }

    @Override
    public List<Solution> getByList(int page, int size) {
        if(page==0||size==0){
            page = 1;
            size = 10;
        }
        Query query = sessionFactory.getCurrentSession().createQuery("from Solution s ");
        query.setFirstResult(size * (page - 1));
        query.setMaxResults(size);
        return query.list();
    }

    @Override
    public int getTotal() {
        return sessionFactory.getCurrentSession().createQuery("from Solution s where 1=1 ").list().size();
    }
}
