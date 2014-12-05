var xmlhttp = null;
function CheckEmailForRegistration(email) {
    xmlhttp = GetXMLHttpRequestObject();
    if (xmlhttp == null) {
        alert("Your Browser Doesnot support Ajax");
        return;
    }
    xmlhttp.open("GET", "CheckEmailRegister.aspx?email=" + email, true);
    xmlhttp.send(null);
    xmlhttp.onreadystatechange = function () {
        if (xmlhttp.readystate == 4 || xmlhttp.readystate == "complete") {
            if (xmlhttp.status == 200 || xmlhttp.statusText == "OK") {
                var result = xmlhttp.responseText;
                if (result != "") {
                    document.getElementById("ContentPlaceHolder1_lblError").innerHTML = result;
                    document.getElementById("ContentPlaceHolder1_txtEmail").focus();
                    document.getElementById("ContentPlaceHolder1_txtEmail").style.border = "1px solid red";
                    document.getElementById("ContentPlaceHolder1_txtEmail").style.color = "red";
                }
                else {
                    document.getElementById("ContentPlaceHolder1_lblError").innerHTML = "";
                    document.getElementById("ContentPlaceHolder1_txtEmail").style.color = "black";
                }
            }
        }
    }
}
