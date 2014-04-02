<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html>
<head>
<title>Select cities for selected country</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />  
    <head>  
        <script language="javascript">  
            var counter = 0;  
            window.setInterval("refreshDiv()", 1000);  
            function refreshDiv(){  
                counter = counter + 1;  
                document.getElementById("test").innerHTML = "Testing " + counter;  
            }  
        </script>  
    </head>  
    <body>  
        <div id="test">  
            Testing  
        </div>  
        <div id="staticBlock">  
            This is a static block  
        </div>  
    </body>  
</html>  