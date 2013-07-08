function insertParam(key, value, url)
{
    key = encodeURI(key); value = encodeURI(value);

    if ( typeof url != undefined )
        url = document.location.search.substr(1);

    var kvp = url.split('&');

    if ( kvp.length == 1 && kvp[0].length == 0)
    {
        kvp[0] = [key,value].join('=');
    }
    else
    {
        var i = kvp.length;
        var x;
        while(i--)
        {
            x = kvp[i].split('=');

            if (x[0] == key)
            {
                x[1] = value;
                kvp[i] = x.join('=');
                break;
            }
        }

        if(i<0) {kvp[kvp.length] = [key,value].join('=');}
    }
    return kvp.join('&');
}

function follow(lnk)
{
    //this will reload the page, it's likely better to store this until finished
    document.location.search = lnk;
}