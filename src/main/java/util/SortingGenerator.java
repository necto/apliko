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

    private String coverWithSortingFocusDiv( String text, String dbname, String dir)
    {
        if ( dbname.equals(field)
             && ("any".equals(dir)
                 || dir.equals(direction)) )
            return "<div class=\"sorting-focus\">" + text + "</div>";
        else
            return text;
    }

    public String makeColumnHeader( String label, String dbname)
    {
        String ret = coverWithSortingFocusDiv(label, dbname, "any");
        ret +=  " <a onclick='follow(insertParam(\"sort-dir\"," +
                " \"desc\", insertParam(\"sort\", \"" +
                dbname + "\")))'>" +
                coverWithSortingFocusDiv("&darr;", dbname, "desc") +
                "</a> <a onclick='follow(insertParam(\"sort-dir\", \"asc\"," +
                " insertParam(\"sort\", \"" + dbname + "\")))'>" +
                coverWithSortingFocusDiv("&uarr;", dbname, "asc") + "</a>";
        return ret;
    }
}
