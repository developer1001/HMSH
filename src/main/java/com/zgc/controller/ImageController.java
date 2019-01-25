package com.zgc.controller;

import com.zgc.util.ImageUtil;
import com.zgc.util.ImageUtil2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@Controller
@RequestMapping("/")
public class ImageController {
    @RequestMapping(value = "/code")
    public String getCode(HttpServletRequest request, HttpServletResponse response) throws Exception{
        response.setContentType("image/jpeg");
        //禁止图像缓存
        response.setHeader("Pragma","no-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", 0);
        HttpSession session = request.getSession();
        ImageUtil imageUtil = new ImageUtil(100, 30, 5,30);
        session.setAttribute("verificationCode", imageUtil.getCode());
        imageUtil.write(response.getOutputStream());
        return null;
    }

    @RequestMapping(value = "/code/contrastCode")
    public String checkCode(HttpServletRequest request,HttpSession session)throws Exception{
        String checkCode=request.getParameter("checkCode");
        if (checkCode.equalsIgnoreCase((String)session.getAttribute("randCheckCode"))) {
            return "验证通过";
        } else {
            return "输入的验证码有误";
        }
    }

    @RequestMapping(value = "/code2")
    public String getCode2(HttpServletRequest request, HttpServletResponse response) throws Exception{
        HttpSession session = request.getSession();
        ImageUtil2 imageUtil2 = new ImageUtil2();
        imageUtil2.verificationCode(request,response,4);
        return null;
    }
}
