// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.equisettle.foundation.domain;

import com.equisettle.foundation.domain.CaseNegotiation;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect CaseNegotiation_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager CaseNegotiation.entityManager;
    
    public static final List<String> CaseNegotiation.fieldNames4OrderClauseFilter = java.util.Arrays.asList("");
    
    public static final EntityManager CaseNegotiation.entityManager() {
        EntityManager em = new CaseNegotiation().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long CaseNegotiation.countCaseNegotiations() {
        return entityManager().createQuery("SELECT COUNT(o) FROM CaseNegotiation o", Long.class).getSingleResult();
    }
    
    public static List<CaseNegotiation> CaseNegotiation.findAllCaseNegotiations() {
        return entityManager().createQuery("SELECT o FROM CaseNegotiation o", CaseNegotiation.class).getResultList();
    }
    
    public static List<CaseNegotiation> CaseNegotiation.findAllCaseNegotiations(String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM CaseNegotiation o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, CaseNegotiation.class).getResultList();
    }
    
    public static CaseNegotiation CaseNegotiation.findCaseNegotiation(Integer caseNegotiationId) {
        if (caseNegotiationId == null) return null;
        return entityManager().find(CaseNegotiation.class, caseNegotiationId);
    }
    
    public static List<CaseNegotiation> CaseNegotiation.findCaseNegotiationEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM CaseNegotiation o", CaseNegotiation.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    public static List<CaseNegotiation> CaseNegotiation.findCaseNegotiationEntries(int firstResult, int maxResults, String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM CaseNegotiation o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, CaseNegotiation.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void CaseNegotiation.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void CaseNegotiation.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            CaseNegotiation attached = CaseNegotiation.findCaseNegotiation(this.caseNegotiationId);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void CaseNegotiation.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void CaseNegotiation.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public CaseNegotiation CaseNegotiation.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        CaseNegotiation merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
