package util;

import base.DataBase;
import base.entities.*;

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
        return ret;
    }

    static public String generateUnitSelectList(UnitsEntity def)
    {
        String ret = "";
        for (UnitsEntity unit: DataBase.listUnits())
        {
            ret += "<option ";
            if ( def != null && def.getId() == unit.getId())
                ret += " selected ";
            ret += "value=\"" + unit.getId() +
                    "\">" + unit.getName() + "</option>";
        }
        return ret;
    }

    static public String generatePrioritySelectList()
    {
        String ret = "";
        for (PrioritiesEntity pr: DataBase.listPriorities())
        {
            ret += "<option value=\"" + pr.getId() +
                    "\">" + pr.getName() + "</option>";
        }
        return ret;
    }

    static public String generateStatusSelectList()
    {
        String ret = "";
        for (StatusesEntity st: DataBase.listStatuses())
        {
            ret += "<option value=\"" + st.getId() +
                    "\">" + st.getName() + "</option>";
        }
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
