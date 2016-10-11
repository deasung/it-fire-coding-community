package it.flame.coding.web.rest;


import com.codahale.metrics.annotation.Timed;
import it.flame.coding.config.Constants;
import it.flame.coding.domain.User;
import it.flame.coding.service.UserService;

import it.flame.coding.web.controller.component.session.SessionUtils;
import it.flame.coding.web.rest.dto.ResultDTO;
import it.flame.coding.web.rest.dto.ResultType;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.web.bind.annotation.*;
import it.flame.coding.web.rest.vm.ManagedUserVM;
/**
 * Created by dskim on 2016. 9. 21..
 */
@RestController
@RequestMapping("/api")
public class UserResource {

    private final Logger log = LoggerFactory.getLogger(UserResource.class);

    @Autowired
    AuthenticationManager authenticationManager;

    @Autowired
    private UserService userService;

    @Autowired
    private SessionUtils sessionUtils;


    @RequestMapping(value = "/user/logout",
            method = RequestMethod.GET,
            produces = MediaType.APPLICATION_JSON_VALUE)
    public ResultDTO logout() {
        sessionUtils.sessionClear();

        ResultDTO resultDTO = new ResultDTO();

        resultDTO.setResultType(ResultType.SUCCESS);

        return resultDTO;
    }


    @RequestMapping(value = "/user/create",
            method = RequestMethod.POST)
    public User create(@RequestBody ManagedUserVM user) {

        User manageUser = new User();

        BeanUtils.copyProperties(user,manageUser);

        User newUser = userService.createUser(manageUser);

        return newUser;
    }


    /**
     * GET  /users/:login : get the "login" user.
     *
     * @param login the login of the user to find
     * @return the ResponseEntity with status 200 (OK) and with body the "login" user, or with status 404 (Not Found)
     */
    @RequestMapping(value = "/users/{login:" + Constants.LOGIN_REGEX + "}",
            method = RequestMethod.GET,
            produces = MediaType.APPLICATION_JSON_VALUE)
    @Timed
    public ResponseEntity<ManagedUserVM> getUser(@PathVariable String login) {
        log.debug("REST request to get User : {}", login);
        return userService.getUserWithAuthoritiesByLogin(login)
                .map(ManagedUserVM::new)
                .map(managedUserVM -> new ResponseEntity<>(managedUserVM, HttpStatus.OK))
                .orElse(new ResponseEntity<>(HttpStatus.NOT_FOUND));
    }
}
