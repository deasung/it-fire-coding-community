package it.flame.coding.domain;

import com.fasterxml.jackson.annotation.JsonIgnore;


import it.flame.coding.config.Constants;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.validator.constraints.Email;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import java.io.Serializable;
import java.time.ZonedDateTime;
import java.util.*;

/**
 * A user.
 */
@Entity
@Getter
@Setter
@Table(name = "it_flame_study_user")
public class User extends AbstractAuditingEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @NotNull
    @Pattern(regexp = Constants.LOGIN_REGEX)
    @Size(min = 1, max = 50)
    @Column(length = 50, unique = true, nullable = false)
    private String login;

    @JsonIgnore
    @NotNull
    @Size(min = 60, max = 60)
    @Column(name = "password_hash",length = 60)
    private String password;

    //이름
    @Size(max = 50)
    @NotNull
    @Column(name = "user_name", length = 50)
    private String username;

    //이메일
    @Email
    @Size(max = 100)
    @Column(length = 100, unique = true)
    private String email;

    //성별
    @NotNull
    @Enumerated(EnumType.STRING)
    private SexType sexType;

    //핸드폰
    @NotNull
    private String phone;

    //계정활성화 상태
    @NotNull
    @Column(nullable = false)
    private boolean activated = false;

    @Size(min = 2, max = 5)
    @Column(name = "lang_key", length = 5)
    private String langKey;

    @Size(max = 20)
    @Column(name = "activation_key", length = 20)
    @JsonIgnore
    private String activationKey;

    @JsonIgnore
    @ManyToMany
    @JoinTable(
            name = "it_flame_study_user_authority",
            joinColumns = {@JoinColumn(name = "user_id", referencedColumnName = "id")},
            inverseJoinColumns = {@JoinColumn(name = "authority_name", referencedColumnName = "name")})
    private Set<Authority> authorities = new HashSet<>();


    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }

        User user = (User) o;

        if (!login.equals(user.login)) {
            return false;
        }

        return true;
    }


}
