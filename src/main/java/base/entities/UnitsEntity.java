package base.entities;

import javax.persistence.*;
import java.util.List;

/**
 * User: estet
 * Date: 7/8/13
 * Time: 2:01 PM
 */
@Table(name = "units", schema = "public", catalog = "bids")
@Entity
public class UnitsEntity {
    private int id;
    private String name;
    private List<ClaimsEntity> claims;

    @OneToMany
    @JoinColumn(name="unit")
    public List<ClaimsEntity> getClaims() {
        return claims;
    }

    public void setClaims(List<ClaimsEntity> claims) {
        this.claims = claims;
    }


    @Column(name = "id")
    @SequenceGenerator(name="units_id_seq",
            sequenceName="units_id_seq",
            allocationSize=1)
    @GeneratedValue(strategy = GenerationType.SEQUENCE,
            generator="units_id_seq")
    @Id
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Column(name = "name")
    @Basic
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        UnitsEntity that = (UnitsEntity) o;

        if (id != that.id) return false;
        if (name != null ? !name.equals(that.name) : that.name != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        return result;
    }
}
