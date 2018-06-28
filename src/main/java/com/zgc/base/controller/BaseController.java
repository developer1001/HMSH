package com.zgc.base.controller;

import com.alibaba.fastjson.JSONObject;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.Writer;

/**
 *
 */
public class BaseController {
    /**
     * 对象转json
     * @param object
     * @param response
     */
    public void writeJson(Object object, HttpServletResponse response){
        String json = JSONObject.toJSONString(object);
        System.out.print(json);
        response.setContentType("text/html;charset=UTF-8");
        try {
            Writer writer = response.getWriter();
            writer.write(json);
            writer.flush();
            writer.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
