package base;

import javax.persistence.Basic;
import javax.persistence.Entity;
import javax.persistence.Id;

/**
 * Created with IntelliJ IDEA.
 * User: estet
 * Date: 7/2/13
 * Time: 5:27 PM
 * To change this template use File | Settings | File Templates.
 */
@javax.persistence.Table(name = "claims", schema = "public", catalog = "bids")
@Entity
public class ClaimsEntity {
    private int id;
    private String name;

    public ClaimsEntity(){}

    public ClaimsEntity( int id, String name)
    {
        this.id = id;
        this.name = name;
    }

    @javax.persistence.Column(name = "id")
    @Id
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @javax.persistence.Column(name = "name")
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

        ClaimsEntity that = (ClaimsEntity) o;

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

    @Override
    public String toString() {
        return "{" + new Integer(id) + ":" + name + "}";
    }
}
