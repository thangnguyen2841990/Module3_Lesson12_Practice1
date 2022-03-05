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
  <table border="1"cellpadding="5">
    <caption><h2>List of Users</h2></caption>
    <tr>
      <th>ID</th>
      <th>Name</th>
      <th>Email</th>
      <th>Country</th>
      <th>Actions</th>
    </tr>
    <c:forEach items="${requestScope['users']}" var="user">
      <tr>
        <td><c:out value="${user.getId()}"/></td>
        <td><c:out value="${user.getName()}"/></td>
        <td><c:out value="${user.getEmail()}"/></td>
        <td><c:out value="${user.getCountry()}"/></td>
        <td>
          <a href="/users?action=edit&id=${user.getId()}">Edit</a>
          <a href="/users?action=delete&id=${user.getId()}">Delete</a>
        </td>
      </tr>
    </c:forEach>
  </table>
</div>
  </body>
</html>
