// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.equisettle.foundation.domain;

import com.equisettle.foundation.domain.CaseType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

privileged aspect CaseType_Roo_Jpa_Entity {
    
    declare @type: CaseType: @Entity;
    
    declare @type: CaseType: @Table(name = "case_type");
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "CASE_TYPE_ID")
    private Integer CaseType.caseTypeId;
    
    public Integer CaseType.getCaseTypeId() {
        return this.caseTypeId;
    }
    
    public void CaseType.setCaseTypeId(Integer id) {
        this.caseTypeId = id;
    }
    
}