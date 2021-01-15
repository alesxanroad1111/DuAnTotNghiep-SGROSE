/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

/**
 *
 * @author ducho
 */
public class RoleInterceptor extends HandlerInterceptorAdapter {
    @Override
    public boolean  preHandle(HttpServletRequest request,
            HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();
        String role =  session.getAttribute("rolestaff").toString();
        if (!role.equals("1")) {
            response.sendRedirect(request.getContextPath() + "/admin/Sos");        
            return false;
        }
        return true;
    }
    
}
