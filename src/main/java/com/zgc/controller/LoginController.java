package com.zgc.controller;

import com.sun.deploy.net.HttpRequest;
import com.sun.deploy.net.HttpResponse;
import com.zgc.base.controller.BaseController;
import com.zgc.base.model.Json;
import com.zgc.model.SysUser;
import com.zgc.service.ISysUserService;
import com.zgc.util.EncodeUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/login/")
public class LoginController extends BaseController {

    @Autowired
    ISysUserService sysUserService;

    @RequestMapping("login")
    public void  login(String loginName, String password, HttpServletResponse response){
        String encodePwd = EncodeUtil.toMD5(password.trim());
        SysUser sysUser = sysUserService.login(loginName.trim(),encodePwd);
        if (sysUser != null){
            HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
            HttpSession session = request.getSession();
            if (session.getAttribute("loginUser") != null)
                session.removeAttribute("loginUser");
            session.setAttribute("loginUser",sysUser);
            Json json = new Json(true,sysUser);
            writeJson(json,response);
//            return "view/main.jsp";
        }
        else{
            Json json = new Json(false,"用户名或密码错误，请重试");
            writeJson(json,response);
        }
    }

    @RequestMapping("index")
    public String loginIndex(){
        return "view/main.jsp";
    }

    @RequestMapping("logout")
    public String logout(){
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        HttpSession session = request.getSession();
        if (session.getAttribute("loginUser") != null){
            session.removeAttribute("loginUser");
            session.invalidate();
        }
        return "login.html";
    }
}
