package base;

import javax.persistence.*;

/**
 * User: estet
 * Date: 7/2/13
 * Time: 5:27 PM
 */
@javax.persistence.Table(name = "claims", schema = "public", catalog = "bids")
@Entity
public class ClaimsEntity {
    private int id;
    private String name;
    private String telephone;
    private String buildings_list;
    private String room;
    private String device_type;
    private String device_number;
    private String problem_description;
    private String priority;
    private String comment;

    public ClaimsEntity(){}

    public ClaimsEntity( String name)
    {
        this.name = name;
    }

    @javax.persistence.Column(name = "id")
    @SequenceGenerator(name="claims_id_seq",
            sequenceName="claims_id_seq",
            allocationSize=1)
    @GeneratedValue(strategy = GenerationType.SEQUENCE,
            generator="claims_id_seq")
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
        if(name==null)
            return "(пусто)";
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    
    @javax.persistence.Column(name = "telephone")
    @Basic
    public String getTelephone() {
        if(telephone==null)
            return "(пусто)";
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    @javax.persistence.Column(name = "buildings_list")
    @Basic
    public String getBuildings_list() {
        return buildings_list;
    }

    public void setBuildings_list(String buildings_list) {
        this.buildings_list = buildings_list;
    }

    @javax.persistence.Column(name = "room")
    @Basic
    public String getRoom() {
        if(room==null)
            return "(пусто)";
        return room;
    }

    public void setRoom(String room) {
        this.room = room;
    }

    @javax.persistence.Column(name = "device_type")
    @Basic
    public String getDevice_type() {
        if(device_type==null)
            return "(пусто)";
        return device_type;
    }

    public void setDevice_type(String device_type) {
        this.device_type = device_type;
    }

    @javax.persistence.Column(name = "device_number")
    @Basic
    public String getDevice_number() {
        if(device_number==null)
            return "(пусто)";
        return device_number;
    }

    public void setDevice_number(String device_number) {
        this.device_number = device_number;
    }

    @javax.persistence.Column(name = "problem_description")
    @Basic
    public String getProblem_description() {
        if(problem_description==null)
            return "(пусто)";
        return problem_description;
    }

    public void setProblem_description(String problem_description) {
        this.problem_description = problem_description;
    }

    @javax.persistence.Column(name = "priority")
    @Basic
    public String getPriority() {
        return priority;
    }

    public void setPriority(String priority) {
        this.priority = priority;
    }

    @javax.persistence.Column(name = "comment")
    @Basic
    public String getComment() {
        if(comment==null)
            return "(пусто)";
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
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
