<%@ page isErrorPage="true" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Lỗi hệ thống</title>
</head>
<body>
    <h2>Đã xảy ra lỗi!</h2>
    <p>Xin lỗi, hệ thống gặp sự cố. Vui lòng thử lại sau.</p>
    <%
        if (exception != null) {
            out.println("<pre>" + exception.getMessage() + "</pre>");
        }
    %>
    <a href="login.jsp">Quay về trang đăng nhập</a>
</body>
</html>
