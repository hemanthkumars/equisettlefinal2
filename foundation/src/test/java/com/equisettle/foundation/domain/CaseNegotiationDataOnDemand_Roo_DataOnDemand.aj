// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.equisettle.foundation.domain;

import com.equisettle.foundation.domain.CaseDataOnDemand;
import com.equisettle.foundation.domain.CaseNegotiation;
import com.equisettle.foundation.domain.CaseNegotiationDataOnDemand;
import com.equisettle.foundation.domain.ClientDataOnDemand;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

privileged aspect CaseNegotiationDataOnDemand_Roo_DataOnDemand {
    
    declare @type: CaseNegotiationDataOnDemand: @Component;
    
    private Random CaseNegotiationDataOnDemand.rnd = new SecureRandom();
    
    private List<CaseNegotiation> CaseNegotiationDataOnDemand.data;
    
    @Autowired
    ClientDataOnDemand CaseNegotiationDataOnDemand.clientDataOnDemand;
    
    @Autowired
    CaseDataOnDemand CaseNegotiationDataOnDemand.caseDataOnDemand;
    
    public CaseNegotiation CaseNegotiationDataOnDemand.getNewTransientCaseNegotiation(int index) {
        CaseNegotiation obj = new CaseNegotiation();
        setAuditCreatedDtTime(obj, index);
        setCaseDocumentUrl(obj, index);
        setCaseNegotiationSentDate(obj, index);
        setNegotiationAmount(obj, index);
        setNegotiationCount(obj, index);
        setNegotiationMessage(obj, index);
        return obj;
    }
    
    public void CaseNegotiationDataOnDemand.setAuditCreatedDtTime(CaseNegotiation obj, int index) {
        Calendar auditCreatedDtTime = Calendar.getInstance();
        obj.setAuditCreatedDtTime(auditCreatedDtTime);
    }
    
    public void CaseNegotiationDataOnDemand.setCaseDocumentUrl(CaseNegotiation obj, int index) {
        String caseDocumentUrl = "caseDocumentUrl_" + index;
        if (caseDocumentUrl.length() > 255) {
            caseDocumentUrl = caseDocumentUrl.substring(0, 255);
        }
        obj.setCaseDocumentUrl(caseDocumentUrl);
    }
    
    public void CaseNegotiationDataOnDemand.setCaseNegotiationSentDate(CaseNegotiation obj, int index) {
        Calendar caseNegotiationSentDate = Calendar.getInstance();
        obj.setCaseNegotiationSentDate(caseNegotiationSentDate);
    }
    
    public void CaseNegotiationDataOnDemand.setNegotiationAmount(CaseNegotiation obj, int index) {
        Integer negotiationAmount = new Integer(index);
        obj.setNegotiationAmount(negotiationAmount);
    }
    
    public void CaseNegotiationDataOnDemand.setNegotiationCount(CaseNegotiation obj, int index) {
        Integer negotiationCount = new Integer(index);
        obj.setNegotiationCount(negotiationCount);
    }
    
    public void CaseNegotiationDataOnDemand.setNegotiationMessage(CaseNegotiation obj, int index) {
        Integer negotiationMessage = new Integer(index);
        obj.setNegotiationMessage(negotiationMessage);
    }
    
    public CaseNegotiation CaseNegotiationDataOnDemand.getSpecificCaseNegotiation(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        CaseNegotiation obj = data.get(index);
        Integer id = obj.getCaseNegotiationId();
        return CaseNegotiation.findCaseNegotiation(id);
    }
    
    public CaseNegotiation CaseNegotiationDataOnDemand.getRandomCaseNegotiation() {
        init();
        CaseNegotiation obj = data.get(rnd.nextInt(data.size()));
        Integer id = obj.getCaseNegotiationId();
        return CaseNegotiation.findCaseNegotiation(id);
    }
    
    public boolean CaseNegotiationDataOnDemand.modifyCaseNegotiation(CaseNegotiation obj) {
        return false;
    }
    
    public void CaseNegotiationDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = CaseNegotiation.findCaseNegotiationEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'CaseNegotiation' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<CaseNegotiation>();
        for (int i = 0; i < 10; i++) {
            CaseNegotiation obj = getNewTransientCaseNegotiation(i);
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
