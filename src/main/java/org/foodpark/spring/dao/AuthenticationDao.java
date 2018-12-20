package org.foodpark.spring.dao;

import org.foodpark.spring.model.Authentication;

public interface AuthenticationDao {

    public String saveAuthentication(Authentication auth);

    public Authentication validateToken(String token);

}
