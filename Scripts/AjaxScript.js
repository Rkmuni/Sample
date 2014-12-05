function GetXMLHttpRequestObject() {
    var objXmlHttp = null;
    if (window.XMLHttpRequest) {
        //create an  XMLHttpRequest Object for new Browser
        objXmlHttp = new XMLHttpRequest();
    }
    else if (window.ActiveXObject) {
        //create an XMLHttpRequest Object for older Browser(IE5,IE6)
        objXmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    return objXmlHttp;
}