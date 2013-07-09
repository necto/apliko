package util;

import base.DataBase;
import base.entities.BuildingsEntity;
import base.entities.TownsEntity;
import base.entities.UnitsEntity;
import base.entities.UsersEntity;

import java.util.List;

/**
 * User: estet
 * Date: 7/9/13
 * Time: 9:34 AM
 */
public class HtmlGenerator {
    static public String generateDelBtn( String name, Integer value)
    {
        return "<form class=\"delForm\"> <input type=\"hidden\"" +
                " name=\"" + name + "\" value=\"" +
                value + "\"/>" +
                "<input type=\"submit\"" +
                " class=\"delBtn\"/></form>";
    }

    static public String generateBuildingSelectList(BuildingsEntity def)
    {
        String ret = "";
        ret += "<select name=\"building\">";
        for ( TownsEntity town : DataBase.listTowns())
        {
            ret += "<option disabled>" + town.getName() + "</option>";
            for (BuildingsEntity building : town.getBuildings())
            {
                ret += "<option ";
                if ( def != null && def.getId() == building.getId())
                    ret += " selected ";
                ret += "value=\"" + building.getId() +
                        "\">" + building.getName() + "</option>";
            }
        }
        ret += "</select>";
        return ret;
    }

    static public String generateUnitSelectList(UnitsEntity def)
    {
        String ret = "";
        ret += "<select name=\"unit\">";
        for (UnitsEntity unit: DataBase.listUnits())
        {
            ret += "<option ";
            if ( def != null && def.getId() == unit.getId())
                ret += " selected ";
            ret += "value=\"" + unit.getId() +
                    "\">" + unit.getName() + "</option>";
        }
        ret += "</select>";
        return ret;
    }

    static public String generateRolesList( UsersEntity user)
    {
        List<String> roles = user.getRoles();
        String ret = "";
        if (roles.contains("manager"))
            ret += "администратор";

        if (roles.contains("performer"))
        {
            if ( !ret.isEmpty())
                ret += ", ";
            ret += "сотрудник тех. поддержки";
        }
        return ret;
    }
}
