package it.flame.coding.service;

import it.flame.coding.config.AuthoritiesConstants;
import it.flame.coding.domain.Authority;
import it.flame.coding.domain.User;
import it.flame.coding.repository.AuthorityRepository;
import it.flame.coding.repository.UserRepository;
import it.flame.coding.service.util.RandomUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashSet;
import java.util.Optional;
import java.util.Set;

/**
 * Created by dskim on 2016. 9. 21..
 */
@Service
@Transactional
public class UserService {

    private final String CREATE_BY = "SYSTEM";

    private final Logger log = LoggerFactory.getLogger(UserService.class);

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private AuthorityRepository authorityRepository;

    public User existUser(String login) {

        User existingUser = userRepository.findOneByLogin(login).get();

        return existingUser;
    }

    public User createUser(User user) {

        User newUser = new User();
        newUser.setCreatedBy(CREATE_BY);
        Authority authority = authorityRepository.findOne(AuthoritiesConstants.USER);
        Set<Authority> authorities = new HashSet<>();


        String encryptedPassword = passwordEncoder.encode(user.getPassword());
        newUser.setLogin(user.getLogin());
        newUser.setUsername(user.getUsername());
        // new user gets initially a generated password
        newUser.setPassword(encryptedPassword);
        newUser.setEmail(user.getEmail());
        newUser.setSexType(user.getSexType());
        newUser.setPhone(user.getPhone());
        // new user is not active
        //newUser.setActivated(false);
        newUser.setActivated(true);
        // new user gets registration key
        newUser.setActivationKey(RandomUtil.generateActivationKey());
        authorities.add(authority);
        newUser.setAuthorities(authorities);
        userRepository.save(newUser);
        log.debug("Created Information for User: {}", newUser);
        return newUser;
    }


    @Transactional(readOnly = true)
    public Optional<User> getUserWithAuthoritiesByLogin(String login) {
        return userRepository.findOneByLogin(login).map(u -> {
            u.getAuthorities().size();
            return u;
        });
    }
}
