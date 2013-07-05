package util;

import java.util.Map;

public class SortingGenerator {
    private String field;
    private String direction;
    private String var;

    public SortingGenerator( Map<String, String[]> params)
    {
        if (params.containsKey("sort"))
            field = params.get("sort")[0];
        if (params.containsKey("sort-dir"))
            direction = params.get("sort-dir")[0];
        else
            direction = "desc";
    }

    public SortingGenerator variable( String var)
    {
        this.var = var;
        return this;
    }

    public String generate()
    {
        if (field == null ||
                field == "")
            return "";
        return " order by " + var + "." + field + " " + direction;
    }
}
