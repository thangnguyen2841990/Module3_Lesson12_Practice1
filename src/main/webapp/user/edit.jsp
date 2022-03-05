<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>$Title$</title>
</head>
<body>
<center>
    <h1>User Management Application</h1>
    <h2><a href="/users?action=create">Add new user</a></h2>
</center>
<div align="center">
    <form method="post">
        <table border="1"cellpadding="5">
            <caption><h2>Edit information User</h2></caption>
            <tr>
                <td>Username</td>
                <td><input type="text" name="username" value="${requestScope['user'].getName()}"></td>
            </tr>
            <tr>
                <td>Email</td>
                <td><input type="text" name="email" value="${requestScope['user'].getEmail()}"></td>
            </tr>
            <tr>
                <td>Country</td>
                <td><input type="text" name="country" value="${requestScope['user'].getCountry()}"></td>
            </tr>
            <tr>
                <td colspan="2" align="center"></td>
                <td>
                    <button>Save</button></td>
            </tr>

        </table>
    </form>
    <p>
        <a href="/users">
            <button>Back to User List</button></a>
    </p>
</div>
</body>
</html>
