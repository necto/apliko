package base.entities;

import javax.persistence.*;

/**
 * User: estet
 * Date: 7/8/13
 * Time: 3:41 PM
 */
@javax.persistence.Table(name = "priorities", schema = "public", catalog = "bids")
@Entity
public class PrioritiesEntity {
    private int id;
    private String name;

    @javax.persistence.Column(name = "id")
    @SequenceGenerator(name="priorities_id_seq",
            sequenceName="priorities_id_seq",
            allocationSize=1)
    @GeneratedValue(strategy = GenerationType.SEQUENCE,
            generator="priorities_id_seq")
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

        PrioritiesEntity that = (PrioritiesEntity) o;

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
