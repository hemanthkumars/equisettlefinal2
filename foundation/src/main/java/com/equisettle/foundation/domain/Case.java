package com.equisettle.foundation.domain;
import java.util.Date;

import javax.persistence.Column;

import org.springframework.roo.addon.dbre.RooDbManaged;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.json.RooJson;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooJpaActiveRecord(versionField = "", table = "case")
@RooDbManaged(automaticallyDelete = true)
@RooToString(excludeFields = { "caseDocuments", "caseNegotiations", "caseTypeId", "caseInitiatedClientId", "caseOnClientId", "caseStatusId", "clientIdWhoVowsMoney", "clientIdWhoClaimsMoney", "mediatorId" })
@RooJson
public class Case {
	@Column(name = "AUDIT_CREATED_DT_TIME")
    private Date auditCreatedDtTime;

	public Date getAuditCreatedDtTime() {
		return auditCreatedDtTime;
	}

	public void setAuditCreatedDtTime(Date auditCreatedDtTime) {
		this.auditCreatedDtTime = auditCreatedDtTime;
	}
	
	
	
	
	
}
