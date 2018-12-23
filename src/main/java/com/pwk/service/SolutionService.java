package com.pwk.service;

import com.pwk.entity.Solution;

import java.util.List;

/**
 * Created by wenkai.peng on 10/24/2014.
 */
public interface SolutionService {
    public void add(Solution solution);
    public void delete(int id);
    public void update(Solution solution);
    public Solution getById(int id);
    public List<Solution> getByList(int page,int size);
    public int getTotal();
}
