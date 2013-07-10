package base.entities;

import javax.persistence.*;
import java.util.List;

/**
 * User: estet
 * Date: 7/10/13
 * Time: 4:32 PM
 */
@javax.persistence.Table(name = "claim_type", schema = "public", catalog = "bids")
@Entity
public class ClaimTypeEntity {
    private int id;
    private List<ClaimsEntity> claims;

    @javax.persistence.Column(name = "id")
    @SequenceGenerator(name="claim_type_id_seq",
            sequenceName="claim_type_id_seq",
            allocationSize=1)
    @GeneratedValue(strategy = GenerationType.SEQUENCE,
            generator="claim_type_id_seq")
    @Id
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }    private String name;

    @javax.persistence.Column(name = "name")
    @Basic
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @OneToMany
    @JoinColumn(name="type")
    public List<ClaimsEntity> getClaims() {
        return claims;
    }

    public void setClaims(List<ClaimsEntity> claims) {
        this.claims = claims;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        ClaimTypeEntity that = (ClaimTypeEntity) o;

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
