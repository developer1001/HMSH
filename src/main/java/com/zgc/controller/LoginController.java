package com.zgc.controller;

import com.zgc.base.controller.BaseController;
import com.zgc.base.model.Json;
import com.zgc.model.SysAuth;
import com.zgc.model.SysRoleAuth;
import com.zgc.model.SysUser;
import com.zgc.model.SysUserRole;
import com.zgc.service.ILoginService;
import com.zgc.service.ISysAuthService;
import com.zgc.service.ISysRoleAuthService;
import com.zgc.service.ISysUserRoleService;
import com.zgc.util.EncodeUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.*;

@Controller
@RequestMapping("/")
public class LoginController extends BaseController {

    @Autowired
    ILoginService loginService;
    @Autowired
    ISysUserRoleService sysUserRoleService;
    @Autowired
    ISysRoleAuthService sysRoleAuthService;
    @Autowired
    ISysAuthService sysAuthService;

    @RequestMapping("login")
    public ModelAndView login(String loginName, String password, HttpServletResponse response)throws Exception{
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("main");
        String encodePwd = EncodeUtil.toMD5(password.trim());
        SysUser sysUser = loginService.login(loginName.trim(),encodePwd);
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        if (sysUser != null && sysUser.getIsActive() == 1){
            HttpSession session = request.getSession();
            if (session.getAttribute("loginUser") != null)
                session.removeAttribute("loginUser");
            session.setAttribute("loginUser",sysUser);
//            List<SysAuth> sysAuths = getUserAuth(sysUser.getId());
//            Json json = new Json(true,sysUser);
//            request.getRequestDispatcher("/view/main.jsp").forward(request,response);
//            writeJson(json,response);
            Map<String,Object> map = new HashMap<>();
            map.put("loginUser",sysUser);
            modelAndView.addObject("loginUser",map);
            return modelAndView;
        }
        else{
            Json json = new Json(false,"用户信息错误，请重试");
            writeJson(json,response);
        }
        return null;
    }

    /**
     * 根据用户ID获取对应的菜单权限
     *1）：根据userId获得对应的一个或多个角色的 roleId;
     *2）：根据roleId获取对应的权限authId；这个过程要去重复的anthId。
     *3）：根据authId获取对应的多个权限菜单对象，即SysAuth
     */
    @RequestMapping("getAuth")
    public void getUserAuth(HttpServletResponse response){
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        HttpSession session = request.getSession();
        int userid = ((SysUser)session.getAttribute("loginUser")).getId();
        //根据用户查多个角色
        List<SysUserRole> list  = sysUserRoleService.getByUserId(userid);
        List<Integer> roleIdList = new ArrayList<>();
        for (SysUserRole item:list){
            roleIdList.add(item.getRoleId());
        }
        //根据多个角色查询权限id的集合,权限ID有重复，要去重
        List<SysRoleAuth> roleAuthList = sysRoleAuthService.getByRoleId(roleIdList);
        Set<Integer> authIdList = new HashSet<>();
        for (SysRoleAuth item:roleAuthList){
            authIdList.add(item.getAuthId());
        }

        //根据authId集合查询所有的权限项
        List<SysAuth> sysAuths = sysAuthService.getByRoleId(new ArrayList<Integer>(authIdList));
        writeJson(new Json(true,sysAuths.size(),sysAuths),response);
    }

    @RequestMapping("index")
    public void loginIndex(HttpServletResponse response)throws Exception{
//        response.sendRedirect("");
//        return "main";
    }

    @RequestMapping("logout")
    public String logout(){
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        HttpSession session = request.getSession();
        if (session.getAttribute("loginUser") != null){
            session.removeAttribute("loginUser");
            session.invalidate();
        }
        return "login";
    }
}
