package com.equisettle.foundation.domain;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;

import org.springframework.roo.addon.dbre.RooDbManaged;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.roo.addon.json.RooJson;

@RooJavaBean
@RooJpaActiveRecord(versionField = "", table = "case_negotiation")
@RooDbManaged(automaticallyDelete = true)
@RooToString(excludeFields = { "caseAttemptedById", "caseResponseById", "caseId" })
@RooJson
public class CaseNegotiation {
	@Column(name = "RESPONDED_DT_TIME")
    private Date respondedDtTime;
	
	@Column(name = "CASE_RESPONSE_NEGOTIATION_AMOUNT")
    private Integer caseResponseNegotiationAmount;
	
	@Column(name = "NEGOTIATION_STATUS_ID")
    private Integer negotiationStatusId;
	
	@Column(name = "COUNTER_NEGOTIATION_MESSAGE")
    private String counterNegotiationMessage;
	
	@Column(name = "SETTLED_AMOUNT")
    private Integer settledAmount;
	

	public String getCounterNegotiationMessage() {
		return counterNegotiationMessage;
	}

	public void setCounterNegotiationMessage(String counterNegotiationMessage) {
		this.counterNegotiationMessage = counterNegotiationMessage;
	}

	public Integer getSettledAmount() {
		return settledAmount;
	}

	public void setSettledAmount(Integer settledAmount) {
		this.settledAmount = settledAmount;
	}

	public Integer getNegotiationStatusId() {
		return negotiationStatusId;
	}

	public void setNegotiationStatusId(Integer negotiationStatusId) {
		this.negotiationStatusId = negotiationStatusId;
	}

	public Integer getCaseResponseNegotiationAmount() {
		return caseResponseNegotiationAmount;
	}

	public void setCaseResponseNegotiationAmount(Integer caseResponseNegotiationAmount) {
		this.caseResponseNegotiationAmount = caseResponseNegotiationAmount;
	}

	public Date getRespondedDtTime() {
		return respondedDtTime;
	}

	public void setRespondedDtTime(Date respondedDtTime) {
		this.respondedDtTime = respondedDtTime;
	}
	
	
	public static List<CaseNegotiation>  findCaseNegoDetails(Integer caseId){
		List<CaseNegotiation> logins=entityManager().createQuery("SELECT sl FROM CaseNegotiation sl WHERE sl.caseId.caseId="+caseId+" "
				).getResultList();
	
			return logins;
	}
	
	
	
	
	
	
	
}
