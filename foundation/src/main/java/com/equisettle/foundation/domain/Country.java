package com.equisettle.foundation.domain;
import java.util.List;

import javax.persistence.Column;

import org.springframework.roo.addon.dbre.RooDbManaged;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.roo.addon.json.RooJson;

@RooJavaBean
@RooJpaActiveRecord(versionField = "", table = "country")
@RooDbManaged(automaticallyDelete = true)
@RooToString(excludeFields = { "clients" })
@RooJson
public class Country {
	
	@Column(name = "COUNTRY_CODE", length = 255)
    private String countryCode;
	
	public static Country  findCountryByCode(String countryCode){
		List<Country> logins=entityManager().createQuery("SELECT sl FROM Country sl WHERE sl.countryCode='"+countryCode+"' "
				+ "   ").getResultList();
		if(logins.isEmpty()){
			return null;
		}else{
			return logins.get(0);
		}
	}
}
