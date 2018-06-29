package com.zgc.base.WebService.impl;

import com.zgc.base.WebService.UserWebService;
import com.zgc.controller.UserController;
import com.zgc.model.User;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Component;

import javax.jws.WebParam;
import javax.jws.WebService;
import javax.servlet.http.HttpServletResponse;
@Component
@WebService(endpointInterface = "com.zgc.base.WebService.UserWebService")
public class UserWebServiceImpl implements UserWebService {
    @Override
    public String getUserInfo(@WebParam(name="usernaem") String username) {
        //new UserController().getUser(username,response);
        return "hi "+username+", I am the WebService provider!";
    }
}
