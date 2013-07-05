package base.entities;

import javax.persistence.*;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: estet
 * Date: 7/3/13
 * Time: 5:52 PM
 * To change this template use File | Settings | File Templates.
 */
@javax.persistence.Table(name = "users", schema = "public", catalog = "bids_auth")
@Entity
public class UsersEntity {
    private String userName;
    private String userPass;
    private List<String> roles;

    @javax.persistence.Column(name = "user_name")
    @Id
    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    @javax.persistence.Column(name = "user_pass")
    @Basic
    public String getUserPass() {
        return userPass;
    }

    public void setUserPass(String userPass) {
        this.userPass = userPass;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        UsersEntity that = (UsersEntity) o;

        if (userName != null ? !userName.equals(that.userName) : that.userName != null) return false;
        if (userPass != null ? !userPass.equals(that.userPass) : that.userPass != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = userName != null ? userName.hashCode() : 0;
        result = 31 * result + (userPass != null ? userPass.hashCode() : 0);
        return result;
    }

    @ElementCollection
    @CollectionTable(
            name="user_roles",
            joinColumns=@JoinColumn(name="user_name")
    )
    @Column(name = "role_name")
    public List<String> getRoles() {
        return roles;
    }

    public void setRoles(List<String> roles) {
        this.roles = roles;
    }
}
