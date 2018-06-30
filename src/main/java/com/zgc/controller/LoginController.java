package com.zgc.controller;

import com.zgc.base.controller.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
@RequestMapping("/login/")
public class LoginController extends BaseController {

    @RequestMapping("login")
    public void  login(String loginName,String password){

    }

    @RequestMapping("index")
    public String loginIndex(){
        return "index";
    }
}
