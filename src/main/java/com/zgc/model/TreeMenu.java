package com.zgc.model;

/**
 * @program: HMSH
 * @description: 树形菜单。没有提供界面的菜单修改操作，若需修改，需要到数据库手动修改
 * @author: laoyangtou
 * @create: 2018-07-16 17:11
 **/
public class TreeMenu {
    private String F_ModuleId;
    private String F_ParentId;
    private String F_FullName;
    private String F_Icon;
    private String F_UrlAddress;
    private String F_Target;
    private Integer F_IsMenu;
    private Integer F_AllowExpand;

    public String getF_ModuleId() {
        return F_ModuleId;
    }

    public void setF_ModuleId(String f_ModuleId) {
        F_ModuleId = f_ModuleId;
    }

    public String getF_ParentId() {
        return F_ParentId;
    }

    public void setF_ParentId(String f_ParentId) {
        F_ParentId = f_ParentId;
    }

    public String getF_FullName() {
        return F_FullName;
    }

    public void setF_FullName(String f_FullName) {
        F_FullName = f_FullName;
    }

    public String getF_Icon() {
        return F_Icon;
    }

    public void setF_Icon(String f_Icon) {
        F_Icon = f_Icon;
    }

    public String getF_UrlAddress() {
        return F_UrlAddress;
    }

    public void setF_UrlAddress(String f_UrlAddress) {
        F_UrlAddress = f_UrlAddress;
    }

    public String getF_Target() {
        return F_Target;
    }

    public void setF_Target(String f_Target) {
        F_Target = f_Target;
    }

    public Integer getF_IsMenu() {
        return F_IsMenu;
    }

    public void setF_IsMenu(Integer f_IsMenu) {
        F_IsMenu = f_IsMenu;
    }

    public Integer getF_AllowExpand() {
        return F_AllowExpand;
    }

    public void setF_AllowExpand(Integer f_AllowExpand) {
        F_AllowExpand = f_AllowExpand;
    }
}
