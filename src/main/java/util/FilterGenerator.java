package util;

import java.util.Map;

public class FilterGenerator {
    private String field;
    private String val;
    private String user;
    private String var;

    public FilterGenerator( Map<String, String[]> params)
    {
        if (params.containsKey("filter-field"))
            field = params.get("filter-field")[0];
        if (params.containsKey("filter-val"))
            val = params.get("filter-val")[0];
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
        if (field == null ||
            field == "")
            return "";
        return " where " + var + "." + field + " like '%" + val + "%'" + " ";
    }
}
