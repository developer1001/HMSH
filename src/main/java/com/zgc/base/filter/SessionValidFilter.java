package com.zgc.base.filter;

import com.zgc.model.SysUser;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class SessionValidFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain filterChain) throws IOException, ServletException {
        HttpSession sess = ((HttpServletRequest)request).getSession();
        SysUser loginUser = (SysUser) sess.getAttribute("loginUser");
        if(loginUser == null ){
            ((HttpServletResponse)response).sendRedirect(((HttpServletRequest)request).getContextPath()+"/view/login.jsp");
        }else{
            filterChain.doFilter(request, response);
        }
    }

    @Override
    public void destroy() {

    }
}
