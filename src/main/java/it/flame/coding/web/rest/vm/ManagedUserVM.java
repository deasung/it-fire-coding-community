package it.flame.coding.web.rest.vm;


import it.flame.coding.domain.User;
import it.flame.coding.service.dto.UserDTO;
import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.time.ZonedDateTime;
import java.util.Set;


/**
 * View Model extending the UserDTO, which is meant to be used in the user management UI.
 */
@Getter
@Setter
public class ManagedUserVM extends UserDTO {

    public static final int PASSWORD_MIN_LENGTH = 4;
    public static final int PASSWORD_MAX_LENGTH = 100;

    private Long id;

    private ZonedDateTime createdDate;

    private String lastModifiedBy;

    private ZonedDateTime lastModifiedDate;

    @NotNull
    @Size(min = PASSWORD_MIN_LENGTH, max = PASSWORD_MAX_LENGTH)
    private String password;


    public ManagedUserVM() {
    }

    public ManagedUserVM(User user) {
        super(user);
        this.id = user.getId();
        this.createdDate = user.getCreatedDate();
        this.lastModifiedBy = user.getLastModifiedBy();
        this.lastModifiedDate = user.getLastModifiedDate();
        this.password = null;
    }

    public ManagedUserVM(Long id, String login, String password,
                         String email, boolean activated, String langKey, Set<String> authorities , ZonedDateTime createdDate, String lastModifiedBy, ZonedDateTime lastModifiedDate ) {
        super(login, email, activated, langKey, authorities);
        this.id = id;
        this.createdDate = createdDate;
        this.lastModifiedBy = lastModifiedBy;
        this.lastModifiedDate = lastModifiedDate;
        this.password = password;
    }
}
