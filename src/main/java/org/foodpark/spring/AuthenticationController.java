package org.foodpark.spring;

import java.io.IOException;

import org.foodpark.spring.model.Authentication;
import org.foodpark.spring.service.AuthenticationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/auth")
public class AuthenticationController {

    @Autowired
    private AuthenticationService authService;

    /**
     * This method registers the token
     * @param auth
     * @return This method will return the registered user.
     */
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    @ResponseBody
    public String registerUser(@RequestBody Authentication auth) {

        return authService.saveAuthentication(auth);
    }
    


    /**
     *  This method used to validate token
     * @param token
     * @return This method will return the Authentication object. if the authentication not existed returns null.
     * @throws IOException 
     */
    @RequestMapping(value = "/validate", method = RequestMethod.GET)
    @ResponseBody
    public Authentication validateToken(HttpServletRequest request, HttpServletResponse response, @RequestParam("token") String token) throws IOException {
        
    	Authentication auth = authService.validateToken(token);
        
        if(auth == null){
        	response.sendError(403, "Invalid Token.");
        }
        
        return auth;
    }

}
