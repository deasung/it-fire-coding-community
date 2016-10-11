package it.flame.coding.web.controller.login;

import it.flame.coding.web.controller.component.session.SessionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


/**
 * Created by dskim on 2016. 9. 21..
 */
@Controller
public class LoginController {

    @Autowired
    private SessionUtils sessionUtils;

    @RequestMapping("/login")
    public String login(Model model) {

        model.addAttribute("login",sessionUtils.getSessionCurrentLogin());

        return "view/login/login";
    }

    @RequestMapping("/login/create")
    public String create(Model model) {

        model.addAttribute("login",sessionUtils.getSessionCurrentLogin());

        return "view/login/create";
    }
}
