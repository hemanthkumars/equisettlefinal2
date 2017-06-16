// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.equisettle.foundation.domain;

import com.equisettle.foundation.domain.CaseStatus;
import com.equisettle.foundation.domain.CaseStatusDataOnDemand;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.stereotype.Component;

privileged aspect CaseStatusDataOnDemand_Roo_DataOnDemand {
    
    declare @type: CaseStatusDataOnDemand: @Component;
    
    private Random CaseStatusDataOnDemand.rnd = new SecureRandom();
    
    private List<CaseStatus> CaseStatusDataOnDemand.data;
    
    public CaseStatus CaseStatusDataOnDemand.getNewTransientCaseStatus(int index) {
        CaseStatus obj = new CaseStatus();
        setCaseStatus(obj, index);
        return obj;
    }
    
    public void CaseStatusDataOnDemand.setCaseStatus(CaseStatus obj, int index) {
        String caseStatus = "caseStatus_" + index;
        if (caseStatus.length() > 255) {
            caseStatus = caseStatus.substring(0, 255);
        }
        obj.setCaseStatus(caseStatus);
    }
    
    public CaseStatus CaseStatusDataOnDemand.getSpecificCaseStatus(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        CaseStatus obj = data.get(index);
        Integer id = obj.getCaseStatusId();
        return CaseStatus.findCaseStatus(id);
    }
    
    public CaseStatus CaseStatusDataOnDemand.getRandomCaseStatus() {
        init();
        CaseStatus obj = data.get(rnd.nextInt(data.size()));
        Integer id = obj.getCaseStatusId();
        return CaseStatus.findCaseStatus(id);
    }
    
    public boolean CaseStatusDataOnDemand.modifyCaseStatus(CaseStatus obj) {
        return false;
    }
    
    public void CaseStatusDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = CaseStatus.findCaseStatusEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'CaseStatus' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<CaseStatus>();
        for (int i = 0; i < 10; i++) {
            CaseStatus obj = getNewTransientCaseStatus(i);
            try {
                obj.persist();
            } catch (final ConstraintViolationException e) {
                final StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    final ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
                }
                throw new IllegalStateException(msg.toString(), e);
            }
            obj.flush();
            data.add(obj);
        }
    }
    
}
