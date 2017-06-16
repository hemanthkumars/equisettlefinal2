// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.equisettle.foundation.domain;

import com.equisettle.foundation.domain.Case;
import com.equisettle.foundation.domain.CaseStatus;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.OneToMany;

privileged aspect CaseStatus_Roo_DbManaged {
    
    @OneToMany(mappedBy = "caseStatusId")
    private Set<Case> CaseStatus.case1s;
    
    @Column(name = "CASE_STATUS", length = 255)
    private String CaseStatus.caseStatus;
    
    public Set<Case> CaseStatus.getCase1s() {
        return case1s;
    }
    
    public void CaseStatus.setCase1s(Set<Case> case1s) {
        this.case1s = case1s;
    }
    
    public String CaseStatus.getCaseStatus() {
        return caseStatus;
    }
    
    public void CaseStatus.setCaseStatus(String caseStatus) {
        this.caseStatus = caseStatus;
    }
    
}
