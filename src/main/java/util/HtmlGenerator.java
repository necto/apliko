package util;

/**
 * Created with IntelliJ IDEA.
 * User: estet
 * Date: 7/9/13
 * Time: 9:34 AM
 * To change this template use File | Settings | File Templates.
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
}
