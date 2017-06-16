// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.equisettle.foundation.domain;

import com.equisettle.foundation.domain.Case;
import com.equisettle.foundation.domain.CaseDataOnDemand;
import com.equisettle.foundation.domain.CaseIntegrationTest;
import java.util.Iterator;
import java.util.List;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect CaseIntegrationTest_Roo_IntegrationTest {
    
    declare @type: CaseIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: CaseIntegrationTest: @ContextConfiguration(locations = "classpath*:/META-INF/spring/applicationContext*.xml");
    
    declare @type: CaseIntegrationTest: @Transactional;
    
    @Autowired
    CaseDataOnDemand CaseIntegrationTest.dod;
    
    @Test
    public void CaseIntegrationTest.testCountCases() {
        Assert.assertNotNull("Data on demand for 'Case' failed to initialize correctly", dod.getRandomCase());
        long count = Case.countCases();
        Assert.assertTrue("Counter for 'Case' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void CaseIntegrationTest.testFindCase() {
        Case obj = dod.getRandomCase();
        Assert.assertNotNull("Data on demand for 'Case' failed to initialize correctly", obj);
        Integer id = obj.getCaseId();
        Assert.assertNotNull("Data on demand for 'Case' failed to provide an identifier", id);
        obj = Case.findCase(id);
        Assert.assertNotNull("Find method for 'Case' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'Case' returned the incorrect identifier", id, obj.getCaseId());
    }
    
    @Test
    public void CaseIntegrationTest.testFindAllCases() {
        Assert.assertNotNull("Data on demand for 'Case' failed to initialize correctly", dod.getRandomCase());
        long count = Case.countCases();
        Assert.assertTrue("Too expensive to perform a find all test for 'Case', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<Case> result = Case.findAllCases();
        Assert.assertNotNull("Find all method for 'Case' illegally returned null", result);
        Assert.assertTrue("Find all method for 'Case' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void CaseIntegrationTest.testFindCaseEntries() {
        Assert.assertNotNull("Data on demand for 'Case' failed to initialize correctly", dod.getRandomCase());
        long count = Case.countCases();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<Case> result = Case.findCaseEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'Case' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'Case' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void CaseIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'Case' failed to initialize correctly", dod.getRandomCase());
        Case obj = dod.getNewTransientCase(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'Case' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'Case' identifier to be null", obj.getCaseId());
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
        Assert.assertNotNull("Expected 'Case' identifier to no longer be null", obj.getCaseId());
    }
    
    @Test
    public void CaseIntegrationTest.testRemove() {
        Case obj = dod.getRandomCase();
        Assert.assertNotNull("Data on demand for 'Case' failed to initialize correctly", obj);
        Integer id = obj.getCaseId();
        Assert.assertNotNull("Data on demand for 'Case' failed to provide an identifier", id);
        obj = Case.findCase(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'Case' with identifier '" + id + "'", Case.findCase(id));
    }
    
}