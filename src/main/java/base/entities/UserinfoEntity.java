package base.entities;

import javax.persistence.*;

/**
 * User: estet
 * Date: 7/9/13
 * Time: 10:38 AM
 */
@Table(name = "userinfo", schema = "public", catalog = "bids")
@Entity
public class UserinfoEntity {
    private String name;
    private String surname;
    private String middleName;
    private BuildingsEntity building;
    private UnitsEntity unit;
    private String telephone;
    private String userName;

    @Column(name = "name")
    @Basic
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Column(name = "surname")
    @Basic
    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    @Column(name = "middle_name")
    @Basic
    public String getMiddleName() {
        return middleName;
    }

    public void setMiddleName(String middleName) {
        this.middleName = middleName;
    }

    @JoinColumn(name = "building")
    @ManyToOne
    public BuildingsEntity getBuilding() {
        return building;
    }

    public void setBuilding(BuildingsEntity building) {
        this.building = building;
    }

    @JoinColumn(name = "unit")
    @ManyToOne
    public UnitsEntity getUnit() {
        return unit;
    }

    public void setUnit(UnitsEntity unit) {
        this.unit = unit;
    }

    @Column(name = "telephone")
    @Basic
    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        UserinfoEntity that = (UserinfoEntity) o;

        if (building != null ? !building.equals(that.building) : that.building != null) return false;
        if (middleName != null ? !middleName.equals(that.middleName) : that.middleName != null) return false;
        if (name != null ? !name.equals(that.name) : that.name != null) return false;
        if (surname != null ? !surname.equals(that.surname) : that.surname != null) return false;
        if (telephone != null ? !telephone.equals(that.telephone) : that.telephone != null) return false;
        if (unit != null ? !unit.equals(that.unit) : that.unit != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = name != null ? name.hashCode() : 0;
        result = 31 * result + (surname != null ? surname.hashCode() : 0);
        result = 31 * result + (middleName != null ? middleName.hashCode() : 0);
        result = 31 * result + (building != null ? building.hashCode() : 0);
        result = 31 * result + (unit != null ? unit.hashCode() : 0);
        result = 31 * result + (telephone != null ? telephone.hashCode() : 0);
        return result;
    }

    @Column(name = "user_name")
    @Id
    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }
}
