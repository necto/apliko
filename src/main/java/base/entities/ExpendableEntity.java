package base.entities;

import javax.persistence.Basic;
import javax.persistence.Embeddable;
import javax.persistence.Entity;

/**
 * User: estet
 * Date: 7/10/13
 * Time: 4:32 PM
 */
@javax.persistence.Table(name = "expendable", schema = "public", catalog = "bids")
@Embeddable
public class ExpendableEntity {
    private String deviceType;

    @javax.persistence.Column(name = "device_type")
    @Basic
    public String getDeviceType() {
        return deviceType;
    }

    public void setDeviceType(String deviceType) {
        this.deviceType = deviceType;
    }

    private String model;

    @javax.persistence.Column(name = "model")
    @Basic
    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        ExpendableEntity that = (ExpendableEntity) o;

        if (deviceType != null ? !deviceType.equals(that.deviceType) : that.deviceType != null) return false;
        if (model != null ? !model.equals(that.model) : that.model != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = deviceType != null ? deviceType.hashCode() : 0;
        result = 31 * result + (model != null ? model.hashCode() : 0);
        return result;
    }
}
