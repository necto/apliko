package base.entities;

import javax.persistence.*;
import java.util.List;

/**
 * User: estet
 * Date: 7/3/13
 * Time: 5:52 PM
 */
@Table(name = "users", schema = "public", catalog = "bids_auth")
@Entity
public class UsersEntity {
    private String userName;
    private String userPass;
    private List<String> roles;

    @Column(name = "user_name")
    @Id
    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    @Column(name = "user_pass")
    @Basic
    public String getUserPass() {
        if(userPass==null)
            return "(пусто)";
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

    private String name;

    @Column(name = "name")
    @Basic
    public String getName() {
        if(name==null)
            return "(пусто)";
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    private String surname;

    @Column(name = "surname")
    @Basic
    public String getSurname() {
        if(surname==null)
            return "(пусто)";
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    private String middleName;

    @Column(name = "middle_name")
    @Basic
    public String getMiddleName() {
        if(middleName==null)
            return "(пусто)";
        return middleName;
    }

    public void setMiddleName(String middleName) {
        this.middleName = middleName;
    }

    private String building;

    @Column(name = "building")
    @Basic
    public String getBuilding() {
        if(building==null)
            return "(пусто)";
        return building;
    }

    public void setBuilding(String building) {
        this.building = building;
    }

    private String unit;

    @Column(name = "unit")
    @Basic
    public String getUnit() {
        if(unit==null)
            return "(пусто)";
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    private String telephone;

    @Column(name = "telephone")
    @Basic
    public String getTelephone() {
        if(telephone==null)
            return "(пусто)";
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }
}
