package it.flame.coding.web.rest.vm;

import it.flame.coding.domain.Authority;
import lombok.Getter;
import lombok.Setter;

import java.util.Collection;

/**
 * Created by dskim on 2016. 9. 22..
 */
@Getter
@Setter
public class AuthenticationTokenVM {


    private String login;
    private Collection<? extends Authority> authorities;
    private String token;

}


