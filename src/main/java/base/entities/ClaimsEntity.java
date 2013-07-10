package base.entities;

import javax.persistence.*;
import java.util.Date;

/**
 * User: estet
 * Date: 7/2/13
 * Time: 5:27 PM
 */
@Table(name = "claims", schema = "public", catalog = "bids")
@Entity
public class ClaimsEntity {
    private int id;
    private String creatorLogin;
    private String name;
    private String middleName;
    private String surname;
    private String telephone;
    private BuildingsEntity building;
    private UnitsEntity unit;
    private String room;
    private String deviceType;
    private String deviceNumber;
    private String problemDescription;
    private PrioritiesEntity priority;
    private String comment;
    private String serviceNumber;
    private Date date;
    private StatusesEntity status;
    private ClaimTypeEntity type;

    @Column(name = "creator_login")
    @Basic
    public String getCreatorLogin() {
        return creatorLogin;
    }

    public void setCreatorLogin(String creatorLogin) {
        this.creatorLogin = creatorLogin;
    }

    @Column(name = "name")
    @Basic
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Column(name = "middle_name")
    @Basic
    public String getMiddleName() {
        return middleName;
    }

    public void setMiddleName(String middleName) {
        this.middleName = middleName;
    }

    @Column(name = "surname")
    @Basic
    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    @Column(name = "telephone")
    @Basic
    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    @JoinColumn(name = "building")
    @ManyToOne(targetEntity = BuildingsEntity.class)
    public BuildingsEntity getBuilding() {
        return building;
    }

    public void setBuilding(BuildingsEntity building) {
        this.building = building;
    }

    public String buildingName() {
        if ( building != null)
            return building.getName();
        return "(пусто)";
    }

    public String townName() {
        if ( building != null
             && building.getTown() != null)
            return building.getTown().getName();
        return "(пусто)";
    }

    @JoinColumn(name = "unit")
    @ManyToOne(targetEntity = UnitsEntity.class)
    public UnitsEntity getUnit() {
        return unit;
    }

    public void setUnit(UnitsEntity unit) {
        this.unit = unit;
    }

    public String unitName() {
            if ( unit != null)
                return unit.getName();
            return "(пусто)";
    }

    @Column(name = "room")
    @Basic
    public String getRoom() {
        return room;
    }

    public void setRoom(String room) {
        this.room = room;
    }

    @Column(name = "device_type")
    @Basic
    public String getDeviceType() {
        return deviceType;
    }

    public void setDeviceType(String deviceType) {
        this.deviceType = deviceType;
    }

    @Column(name = "device_number")
    @Basic
    public String getDeviceNumber() {
        return deviceNumber;
    }

    public void setDeviceNumber(String deviceNumber) {
        this.deviceNumber = deviceNumber;
    }

    @Column(name = "problem_description")
    @Basic
    public String getProblemDescription() {
        return problemDescription;
    }

    public void setProblemDescription(String problemDescription) {
        this.problemDescription = problemDescription;
    }

    @JoinColumn(name = "priority")
    @ManyToOne(targetEntity = PrioritiesEntity.class)
    public PrioritiesEntity getPriority() {
        return priority;
    }

    public void setPriority(PrioritiesEntity priority) {
        this.priority = priority;
    }

    public String priorityName() {
        if ( priority != null)
            return priority.getName();
        return "(пусто)";
    }

    @Column(name = "comment")
    @Basic
    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    @Column(name = "service_number")
    @Basic
    public String getServiceNumber() {
        return serviceNumber;
    }

    public void setServiceNumber(String serviceNumber) {
        this.serviceNumber = serviceNumber;
    }

    @Column(name = "date")
    @Basic
    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    @JoinColumn(name = "status")
    @ManyToOne(targetEntity = StatusesEntity.class)
    public StatusesEntity getStatus() {
        return status;
    }

    public void setStatus(StatusesEntity status) {
        this.status = status;
    }

    public String statusName() {
        if ( status != null)
            return status.getName();
        return "(пусто)";
    }

    @Column(name = "id")
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

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        ClaimsEntity that = (ClaimsEntity) o;

        if (id != that.id) return false;
        if (comment != null ? !comment.equals(that.comment) : that.comment != null) return false;
        if (creatorLogin != null ? !creatorLogin.equals(that.creatorLogin) : that.creatorLogin != null) return false;
        if (date != null ? !date.equals(that.date) : that.date != null) return false;
        if (deviceNumber != null ? !deviceNumber.equals(that.deviceNumber) : that.deviceNumber != null) return false;
        if (deviceType != null ? !deviceType.equals(that.deviceType) : that.deviceType != null) return false;
        if (middleName != null ? !middleName.equals(that.middleName) : that.middleName != null) return false;
        if (name != null ? !name.equals(that.name) : that.name != null) return false;
        if (priority != null ? !priority.equals(that.priority) : that.priority != null) return false;
        if (problemDescription != null ? !problemDescription.equals(that.problemDescription) : that.problemDescription != null)
            return false;
        if (room != null ? !room.equals(that.room) : that.room != null) return false;
        if (serviceNumber != null ? !serviceNumber.equals(that.serviceNumber) : that.serviceNumber != null)
            return false;
        if (status != null ? !status.equals(that.status) : that.status != null) return false;
        if (surname != null ? !surname.equals(that.surname) : that.surname != null) return false;
        if (telephone != null ? !telephone.equals(that.telephone) : that.telephone != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (creatorLogin != null ? creatorLogin.hashCode() : 0);
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (middleName != null ? middleName.hashCode() : 0);
        result = 31 * result + (surname != null ? surname.hashCode() : 0);
        result = 31 * result + (telephone != null ? telephone.hashCode() : 0);
        result = 31 * result + (room != null ? room.hashCode() : 0);
        result = 31 * result + (deviceType != null ? deviceType.hashCode() : 0);
        result = 31 * result + (deviceNumber != null ? deviceNumber.hashCode() : 0);
        result = 31 * result + (problemDescription != null ? problemDescription.hashCode() : 0);
        result = 31 * result + (priority != null ? priority.hashCode() : 0);
        result = 31 * result + (comment != null ? comment.hashCode() : 0);
        result = 31 * result + (serviceNumber != null ? serviceNumber.hashCode() : 0);
        result = 31 * result + (date != null ? date.hashCode() : 0);
        result = 31 * result + (status != null ? status.hashCode() : 0);
        return result;
    }


    @JoinColumn(name = "type")
    @ManyToOne(targetEntity = ClaimTypeEntity.class)
    public ClaimTypeEntity getType() {
        return type;
    }

    public void setType(ClaimTypeEntity type) {
        this.type = type;
    }

    public String typeName() {
        if ( type != null)
            return type.getName();
        return "(пусто)";
    }
}
