package it.flame.coding.service.dto;

import it.flame.coding.config.Constants;

import it.flame.coding.domain.Authority;
import it.flame.coding.domain.SexType;
import it.flame.coding.domain.User;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.validator.constraints.Email;

import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import java.util.Set;
import java.util.stream.Collectors;

/**
 * A DTO representing a user, with his authorities.
 */
@Getter
@Setter
public class UserDTO {

    @NotNull
    @Pattern(regexp = Constants.LOGIN_REGEX)
    @Size(min = 1, max = 50)
    private String login;

    private String username;

    @Email
    @Size(min = 5, max = 100)
    private String email;

    private boolean activated = false;

    //성별
    @NotNull
    @Enumerated(EnumType.STRING)
    private SexType sexType;

    //핸드폰
    @NotNull
    private String phone;

    @Size(min = 2, max = 5)
    private String langKey;

    private Set<String> authorities;

    public UserDTO() {

    }

    public UserDTO(User user) {
        this(user.getLogin(),
                user.getEmail(), user.isActivated(), user.getLangKey(),
                user.getAuthorities().stream().map(Authority::getName)
                        .collect(Collectors.toSet()));
    }

    public UserDTO(String login, String email, boolean activated, String langKey, Set<String> authorities) {

        this.login = login;
        this.email = email;
        this.activated = activated;
        this.langKey = langKey;
        this.authorities = authorities;
    }

}
