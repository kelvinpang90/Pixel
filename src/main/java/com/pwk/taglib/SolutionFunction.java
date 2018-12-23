package com.pwk.taglib;

import com.pwk.entity.Solution;
import com.pwk.tools.Engine;

import java.util.List;

/**
 * Created by wenkai.peng on 10/24/2014.
 */
public class SolutionFunction {
    public static Solution getById(int id){
        return Engine.solutionService.getById(id);
    }
    public static List<Solution> getByList(int page,int size){
        return Engine.solutionService.getByList(page,size);
    }
    public static int getTotal(){
        return Engine.solutionService.getTotal();
    }
}
