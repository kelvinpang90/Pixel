package com.pwk.tools;

import com.pwk.service.AdminService;
import com.pwk.service.CaseService;
import com.pwk.service.SolutionService;

public class Engine {
    public static AdminService adminService;
    public static CaseService caseService;
    public static SolutionService solutionService;

    public void setAdminService(AdminService adminService) {
        Engine.adminService = adminService;
    }

    public void setCaseService(CaseService caseService) {
        Engine.caseService = caseService;
    }

    public void setSolutionService(SolutionService solutionService) {
        Engine.solutionService = solutionService;
    }
}
