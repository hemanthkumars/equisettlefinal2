// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.equisettle.foundation.domain;

import com.equisettle.foundation.domain.Case;
import com.equisettle.foundation.domain.CaseNegotiation;
import com.equisettle.foundation.domain.Client;
import java.util.Calendar;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.springframework.format.annotation.DateTimeFormat;

privileged aspect CaseNegotiation_Roo_DbManaged {
    
    @ManyToOne
    @JoinColumn(name = "CASE_ATTEMPTED_BY_ID", referencedColumnName = "CLIENT_ID")
    private Client CaseNegotiation.caseAttemptedById;
    
    @ManyToOne
    @JoinColumn(name = "CASE_RESPONSE_BY_ID", referencedColumnName = "CLIENT_ID")
    private Client CaseNegotiation.caseResponseById;
    
    @ManyToOne
    @JoinColumn(name = "CASE_ID", referencedColumnName = "CASE_ID")
    private Case CaseNegotiation.caseId;
    
    @Column(name = "CASE_NEGOTIATION_SENT_DATE")
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "MM")
    private Date CaseNegotiation.caseNegotiationSentDate;
    
    @Column(name = "CASE_ATTEMPTED_NEGOTIATION_AMOUNT")
    private Integer CaseNegotiation.caseAttemptedNegotiationAmount;
    
    @Column(name = "NEGOTIATION_MESSAGE")
    private String CaseNegotiation.negotiationMessage;
    
    @Column(name = "CASE_DOCUMENT_URL", length = 255)
    private String CaseNegotiation.caseDocumentUrl;
    
    @Column(name = "NEGOTIATION_COUNT")
    private Integer CaseNegotiation.negotiationCount;
    
    @Column(name = "AUDIT_CREATED_DT_TIME")
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "MM")
    private Date CaseNegotiation.auditCreatedDtTime;
    
    public Client CaseNegotiation.getCaseAttemptedById() {
        return caseAttemptedById;
    }
    
    public void CaseNegotiation.setCaseAttemptedById(Client caseAttemptedById) {
        this.caseAttemptedById = caseAttemptedById;
    }
    
    public Client CaseNegotiation.getCaseResponseById() {
        return caseResponseById;
    }
    
    public void CaseNegotiation.setCaseResponseById(Client caseResponseById) {
        this.caseResponseById = caseResponseById;
    }
    
    public Case CaseNegotiation.getCaseId() {
        return caseId;
    }
    
    public void CaseNegotiation.setCaseId(Case caseId) {
        this.caseId = caseId;
    }
    
    public Date CaseNegotiation.getCaseNegotiationSentDate() {
        return caseNegotiationSentDate;
    }
    
    public void CaseNegotiation.setCaseNegotiationSentDate(Date caseNegotiationSentDate) {
        this.caseNegotiationSentDate = caseNegotiationSentDate;
    }
    
    public Integer CaseNegotiation.getCaseAttemptedNegotiationAmount() {
        return caseAttemptedNegotiationAmount;
    }
    
    public void CaseNegotiation.setCaseAttemptedNegotiationAmount(Integer negotiationAmount) {
        this.caseAttemptedNegotiationAmount = negotiationAmount;
    }
    
    public String CaseNegotiation.getNegotiationMessage() {
        return negotiationMessage;
    }
    
    public void CaseNegotiation.setNegotiationMessage(String negotiationMessage) {
        this.negotiationMessage = negotiationMessage;
    }
    
    public String CaseNegotiation.getCaseDocumentUrl() {
        return caseDocumentUrl;
    }
    
    public void CaseNegotiation.setCaseDocumentUrl(String caseDocumentUrl) {
        this.caseDocumentUrl = caseDocumentUrl;
    }
    
    public Integer CaseNegotiation.getNegotiationCount() {
        return negotiationCount;
    }
    
    public void CaseNegotiation.setNegotiationCount(Integer negotiationCount) {
        this.negotiationCount = negotiationCount;
    }
    
    public Date CaseNegotiation.getAuditCreatedDtTime() {
        return auditCreatedDtTime;
    }
    
    public void CaseNegotiation.setAuditCreatedDtTime(Date auditCreatedDtTime) {
        this.auditCreatedDtTime = auditCreatedDtTime;
    }
    
}
