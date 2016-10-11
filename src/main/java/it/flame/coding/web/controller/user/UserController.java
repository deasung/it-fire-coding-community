package it.flame.coding.web.controller.user;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by dskim on 2016. 9. 30..
 */
@Controller
public class UserController {

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @RequestMapping(value = "/user/{id}", method = RequestMethod.GET)
    public String userInfo(@PathVariable Long id) {
        return null;
    }



}
