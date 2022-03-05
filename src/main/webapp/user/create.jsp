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
        <caption><h2>Add new User</h2></caption>
        <tr>
            <td>Username</td>
            <td><input type="text" name="username" placeholder="Input username: "></td>
        </tr>
        <tr>
            <td>Email</td>
            <td><input type="text" name="email" placeholder="Input email: "></td>
        </tr>
        <tr>
            <td>Country</td>
            <td><input type="text" name="country" placeholder="Input country: "></td>
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
