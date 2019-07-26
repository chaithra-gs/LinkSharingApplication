var Matchpassword=function () {
    var password = document.getElementById("password").value;
    var confirmPassword =document.getElementById("confirmpassword").value;

    if(password!=confirmPassword){
        document.getElementById("matching").innerHTML="Not Match!!!"

    }
    else
    {
        document.getElementById("matching").innerHTML="Match!!!"
    }

}