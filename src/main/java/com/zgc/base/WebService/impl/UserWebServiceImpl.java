package com.zgc.base.WebService.impl;

import com.zgc.base.WebService.UserWebService;
import com.zgc.controller.UserController;
import com.zgc.model.User;

import javax.jws.WebService;
import javax.servlet.http.HttpServletResponse;

@WebService(endpointInterface = "com.zgc.base.WebService.UserWebService")
public class UserWebServiceImpl implements UserWebService {
    @Override
    public String getUserInfo(String username) {
        //new UserController().getUser(username,response);
        return "hi "+username+", I am the WebService provider!";
    }
}
