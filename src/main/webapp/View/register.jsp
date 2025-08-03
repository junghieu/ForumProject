<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <title>Đăng ký</title>
  <link rel="stylesheet" href="<%=request.getContextPath()%>/css/default.css" />
</head>
<body>
<div id="outer">

  <%@ include file="header.jsp" %>

  <div id="content">
    <div id="primaryContent">
      <h2>Đăng ký tài khoản</h2>
      <form method="post">
        <p>Họ tên: <input type="text" name="fullname" /></p>
        <p>Email: <input type="email" name="email" /></p>
        <p>Tên đăng nhập: <input type="text" name="username" /></p>
        <p>Mật khẩu: <input type="password" name="password" /></p>
        <p><input type="submit" value="Đăng ký" /></p>
        <p><a href="login.jsp">Đã có tài khoản? Đăng nhập</a></p>
      </form>
    </div>
  </div>

  <%@ include file="footer.jsp" %>

</div>
</body>
</html>
