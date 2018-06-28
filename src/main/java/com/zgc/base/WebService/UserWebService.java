package com.zgc.base.WebService;

import com.zgc.model.User;

import javax.jws.WebService;
import javax.servlet.http.HttpServletResponse;

@WebService
public interface UserWebService {
    /**
     * 根据用户名给客户端或第三方返回用户的详细信息
     * @param username
     * @return
     */
    public String getUserInfo(String username);
}
