// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.equisettle.foundation.domain;

import com.equisettle.foundation.domain.Client;
import com.equisettle.foundation.domain.ClientDataOnDemand;
import com.equisettle.foundation.domain.CountryDataOnDemand;
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

privileged aspect ClientDataOnDemand_Roo_DataOnDemand {
    
    declare @type: ClientDataOnDemand: @Component;
    
    private Random ClientDataOnDemand.rnd = new SecureRandom();
    
    private List<Client> ClientDataOnDemand.data;
    
    @Autowired
    CountryDataOnDemand ClientDataOnDemand.countryDataOnDemand;
    
    public Client ClientDataOnDemand.getNewTransientClient(int index) {
        Client obj = new Client();
        setAddress(obj, index);
        setAuditCreatedDtTime(obj, index);
        setCity(obj, index);
        setEmail(obj, index);
        setFirstName(obj, index);
        setLastLoggedIn(obj, index);
        setLastName(obj, index);
        setPassword(obj, index);
        setUserName(obj, index);
        return obj;
    }
    
    public void ClientDataOnDemand.setAddress(Client obj, int index) {
        String address = "address_" + index;
        if (address.length() > 500) {
            address = address.substring(0, 500);
        }
        obj.setAddress(address);
    }
    
    public void ClientDataOnDemand.setAuditCreatedDtTime(Client obj, int index) {
        Calendar auditCreatedDtTime = Calendar.getInstance();
     //   obj.setAuditCreatedDtTime(auditCreatedDtTime);
    }
    
    public void ClientDataOnDemand.setCity(Client obj, int index) {
        String city = "city_" + index;
        if (city.length() > 255) {
            city = city.substring(0, 255);
        }
        obj.setCity(city);
    }
    
    public void ClientDataOnDemand.setEmail(Client obj, int index) {
        String email = "foo" + index + "@bar.com";
        if (email.length() > 255) {
            email = email.substring(0, 255);
        }
        obj.setEmail(email);
    }
    
    public void ClientDataOnDemand.setFirstName(Client obj, int index) {
        String firstName = "firstName_" + index;
        if (firstName.length() > 255) {
            firstName = firstName.substring(0, 255);
        }
        obj.setFirstName(firstName);
    }
    
    public void ClientDataOnDemand.setLastLoggedIn(Client obj, int index) {
        Calendar lastLoggedIn = Calendar.getInstance();
 //       obj.setLastLoggedIn(lastLoggedIn);
    }
    
    public void ClientDataOnDemand.setLastName(Client obj, int index) {
        String lastName = "lastName_" + index;
        if (lastName.length() > 255) {
            lastName = lastName.substring(0, 255);
        }
        obj.setLastName(lastName);
    }
    
    public void ClientDataOnDemand.setPassword(Client obj, int index) {
        String password = "password_" + index;
        if (password.length() > 500) {
            password = password.substring(0, 500);
        }
        obj.setPassword(password);
    }
    
    public void ClientDataOnDemand.setUserName(Client obj, int index) {
        String userName = "userName_" + index;
        if (userName.length() > 255) {
            userName = userName.substring(0, 255);
        }
        obj.setUserName(userName);
    }
    
    public Client ClientDataOnDemand.getSpecificClient(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Client obj = data.get(index);
        Integer id = obj.getClientId();
        return Client.findClient(id);
    }
    
    public Client ClientDataOnDemand.getRandomClient() {
        init();
        Client obj = data.get(rnd.nextInt(data.size()));
        Integer id = obj.getClientId();
        return Client.findClient(id);
    }
    
    public boolean ClientDataOnDemand.modifyClient(Client obj) {
        return false;
    }
    
    public void ClientDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = Client.findClientEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Client' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Client>();
        for (int i = 0; i < 10; i++) {
            Client obj = getNewTransientClient(i);
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
