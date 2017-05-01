<%--
  Created by IntelliJ IDEA.
  User: alexey
  Date: 01.05.17
  Time: 18:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>

<!DOCTYPE html>
<head>
    <title>Tasks Data</title>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="../../resources/css/todolist.css">
</head>

<body>
<h1>Task Details</h1>
<table class="tg">
    <tr>
        <th width="80">ID</th>
        <th width="120">Title</th>
        <th width="120">Author</th>
        <th width="120">Price</th>
    </tr>
    <tr>
        <td>${task.id}</td>
        <td>${task.date}</td>
        <td>${task.description}</td>
        <td>${task.hasDone}</td>
    </tr>
</table>
</body>
</html>
