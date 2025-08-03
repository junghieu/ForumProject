<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <title>Đăng nhập</title>
  <link rel="stylesheet" href="<%=request.getContextPath()%>/css/default.css" />
</head>
<body>
<div id="outer">

  <%@ include file="header.jsp" %>

  <div id="content">
    <div id="primaryContent">
      <h2>Đăng nhập</h2>
      <!-- Khi nhấn Đăng nhập, chuyển thẳng đến home.jsp -->
      <form method="post" action="<%=request.getContextPath()%>/View/home.jsp">
        <p>Tên đăng nhập: <input type="text" name="username" /></p>
        <p>Mật khẩu: <input type="password" name="password" /></p>
        <p><input type="submit" value="Đăng nhập" /></p>
        <p><a href="register.jsp">Chưa có tài khoản? Đăng ký</a></p>
      </form>
    </div>
  </div>

  <%@ include file="footer.jsp" %>

</div>
</body>
</html>
