package base.entities;

import javax.persistence.*;
import java.util.List;

/**
 * User: estet
 * Date: 7/8/13
 * Time: 2:01 PM
 */
@Table(name = "towns", schema = "public", catalog = "bids")
@Entity
public class TownsEntity {
    private int id;
    private String name;
    private List<BuildingsEntity> buildings;

    @Column(name = "id")
    @SequenceGenerator(name="towns_id_seq",
            sequenceName="towns_id_seq",
            allocationSize=1)
    @GeneratedValue(strategy = GenerationType.SEQUENCE,
            generator="towns_id_seq")
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

    @OneToMany
    @JoinColumn(name="town")
    public List<BuildingsEntity> getBuildings() {
        return buildings;
    }

    public void setBuildings(List<BuildingsEntity> buildings) {
        this.buildings = buildings;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        TownsEntity that = (TownsEntity) o;

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
