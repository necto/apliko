package util;

import java.util.HashMap;
import java.util.Map;

public class FilterGenerator {
    private Map<String, String> criteria;
    private String user;
    private String var;

    public FilterGenerator( Map<String, String[]> params)
    {
        criteria = new HashMap<String, String>();
        for( Map.Entry<String, String[]> param : params.entrySet())
            if ( param.getKey().startsWith("fltr-") &&
                 !param.getValue()[0].isEmpty())
            {
                criteria.put(param.getKey().substring( 5),
                             param.getValue()[0]);
                //TODO: check for special (e. g. Date > )
            }
    }

    public FilterGenerator user( String user)
    {
        this.user = user;
        return this;
    }

    public FilterGenerator variable( String var)
    {
        this.var = var;
        return this;
    }

    public String generate()
    {
        if ( criteria.isEmpty())
            return "";
        String ret = "";
        Boolean first = true;
        for (Map.Entry<String, String> criterion : criteria.entrySet())
        {
            String column = criterion.getKey();
            String value = criterion.getValue();
            if ( !value.isEmpty() &&
                 !value.equals("0") )
            {
                if ( first )
                    ret += " where ";
                else
                    ret += " and ";

                ret += var + "." + column;
                if ( column.equals("building") ||
                     column.equals("unit") ||
                     column.equals("priority") ||
                     column.equals("status"))
                {
                    ret += " = " + value + " ";
                }
                else
                {
                    ret += " like '%" + value + "%' ";
                }
                first = false;
            }
        }
        return ret;
    }
}
