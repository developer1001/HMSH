package com.zgc.util;

import java.io.Serializable;

public class PPXHttpJsonResult <T> implements Serializable {
    private static final long serialVersionUID = -8637111820477625638L;

    public static final String ERR_MSG1 = "operation failed";

    public static final String ERR_MSG2 = "data exception";

    private Integer code = BusinessCode.CODE_200;

    private String msg;

    private T data;

    private Integer total;


    public PPXHttpJsonResult() {

    }

    public PPXHttpJsonResult(String errMsg) {
        this.msg = errMsg;
        this.code = BusinessCode.CODE_500;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public void setParaErrMsg(String parameter) {//ps add
        setCode(BusinessCode.CODE_400);
        setMsg(parameter + ", Invalid request parameters");
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getMsg() {
        return msg == null ? "" : msg;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }

    public Integer getTotal() {
        return total;
    }

    public void setTotal(Integer total) {
        this.total = total;
    }

}
