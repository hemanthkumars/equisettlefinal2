package com.equisettle.foundation.domain;
import org.springframework.roo.addon.dbre.RooDbManaged;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.roo.addon.json.RooJson;

@RooJavaBean
@RooJpaActiveRecord(versionField = "", table = "case")
@RooDbManaged(automaticallyDelete = true)
@RooToString(excludeFields = { "caseDocuments", "caseNegotiations", "caseTypeId", "caseInitiatedClientId", "caseOnClientId", "caseStatusId", "clientIdWhoVowsMoney", "clientIdWhoClaimsMoney", "mediatorId" })
@RooJson
public class Case {
}
