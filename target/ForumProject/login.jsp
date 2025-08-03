<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Đăng nhập</title>
</head>
<body>
    <h2>Đăng nhập</h2>
    <form action="login" method="post">
        Tên đăng nhập: <input type="text" name="username"><br>
        Mật khẩu: <input type="password" name="password"><br>
        <input type="submit" value="Đăng nhập">
    </form>
    <% if (request.getAttribute("error") != null) { %>
        <p style="color:red;"><%= request.getAttribute("error") %></p>
    <% } %>
</body>
</html>
