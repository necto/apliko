package base.entities;

import javax.persistence.Column;
import javax.persistence.Id;
import java.io.Serializable;

/**
 * Created with IntelliJ IDEA.
 * User: estet
 * Date: 7/3/13
 * Time: 5:52 PM
 * To change this template use File | Settings | File Templates.
 */
public class UserRolesEntityPK implements Serializable {
    private String userName;
    private String roleName;

@Id@Column(name = "user_name")
public String getUserName() {
    return userName;
}

    public void setUserName(String userName) {
        this.userName = userName;
    }

    @Id@Column(name = "role_name")
    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        UserRolesEntityPK that = (UserRolesEntityPK) o;

        if (roleName != null ? !roleName.equals(that.roleName) : that.roleName != null) return false;
        if (userName != null ? !userName.equals(that.userName) : that.userName != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = userName != null ? userName.hashCode() : 0;
        result = 31 * result + (roleName != null ? roleName.hashCode() : 0);
        return result;
}}
