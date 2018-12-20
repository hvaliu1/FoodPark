package org.foodpark.spring.service;

import org.foodpark.spring.model.Authentication;

public interface AuthenticationService {
	
	public String saveAuthentication(Authentication auth);

    public Authentication validateToken(String token);

}
