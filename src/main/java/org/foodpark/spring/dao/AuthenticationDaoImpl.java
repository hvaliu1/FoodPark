package org.foodpark.spring.dao;

import org.foodpark.spring.model.Authentication;
import org.hibernate.Criteria;
import org.hibernate.NonUniqueResultException;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.hibernate.exception.ConstraintViolationException;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Repository
public class AuthenticationDaoImpl extends AbstractDao implements AuthenticationDao {
    Session session = null;

    @Override
    public String saveAuthentication(Authentication auth) {
    	
    	if(validateToken(auth.getToken())!=null) {
    		return "Token already existed";
    	}else {

        session = getSession();
        	int i = (Integer) session.save(auth);
            if (i > 0) {
                return "Authentication details saved successfully.";

            } else {
                return "Unable to store the Authentication details. Please contact Admin.";
            }
    	}
    }

    @Override
    public Authentication validateToken(String token) {

        Criteria criteria = getSession().createCriteria(Authentication.class)
                .add(Restrictions.eq("token", token));

                Authentication auth = (Authentication) criteria.uniqueResult();

        return auth;
    }

}
