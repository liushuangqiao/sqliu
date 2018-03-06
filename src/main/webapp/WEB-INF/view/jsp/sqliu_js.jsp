<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <script src="http://ajax.microsoft.com/ajax/jQuery/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="${getPageHost}/js/tablesorter.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script>
        function setUrlSession(){
            var url =  window.location.href;
            $.ajax({
                type : 'POST',
                url : '${getPageHost}/setUrlSession',
                data : {
                    url : url,
                },
                success : function(data) {
                    window.location.href = '${getPageHost}/to_login';
                },
                error : function() {
                    console.log("错了");
                }
            })
        }
        function userLogout(){
            var thisUrl = window.location.href;
            $.ajax({
                type : 'POST',
                url : '${getPageHost}/userLogout',
                success : function(data) {
                        window.location.href = thisUrl;
                },
                error : function() {
                    console.log("错了");
                }
            })
        }
    </script>
</head>
</html>