package it.flame.coding.web.controller.component.session;

import it.flame.coding.domain.User;
import it.flame.coding.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.ObjectUtils;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created by dskim on 2016. 9. 25..
 */
@Component
public class SessionUtils {

    @Autowired
    private UserService userService;

    @Resource
    protected HttpServletRequest req;


    public String getSessionCurrentLogin() {

        HttpSession session = req.getSession(true);

        String currentLogin = "null";

        if (null != session.getAttribute("currentUser")) {
            String currentUser = session.getAttribute("currentUser").toString();

            if(ObjectUtils.isEmpty(currentUser) != true) {
                User userInfo = userService.getUserWithAuthoritiesByLogin(currentUser).get();
                currentLogin = userInfo.getLogin();
            }
        }

        return currentLogin;
    }

    public void sessionClear() {

        HttpSession session = req.getSession(true);

        session.invalidate();
    }
}
