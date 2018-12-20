package org.foodpark.spring.service;

import javax.transaction.Transactional;

import org.foodpark.spring.dao.AuthenticationDao;
import org.foodpark.spring.model.Authentication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@Transactional
public class AuthenticationServiceImpl implements AuthenticationService {

	@Autowired
	private AuthenticationDao authDao;
	
	@Override
	public String saveAuthentication(Authentication auth) {
		return authDao.saveAuthentication(auth);
	}

	@Override
	public Authentication validateToken(String token) {
		return authDao.validateToken(token);
	}

}
