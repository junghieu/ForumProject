<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <title>Trang người dùng</title>
  <link rel="stylesheet" href="<%=request.getContextPath()%>/css/default.css" />
</head>
<body>
<div id="outer">

  <%@ include file="headerUser.jsp" %>

  <div id="content">
    <div id="primaryContent">
      <h2>Xin chào, người dùng!</h2>
      <p>Chào mừng bạn quay trở lại diễn đàn. Bạn có thể:</p>
      <ul>
        <li><a href="post.jsp">Xem bài viết mới nhất</a></li>
        <li><a href="profile.jsp">Xem hồ sơ cá nhân</a></li>
        <li><a href="#">Tạo bài viết mới</a></li>
        <li><a href="logout.jsp">Đăng xuất</a></li>
      </ul>
    </div>
  </div>

  <%@ include file="footer.jsp" %>

</div>
</body>
</html>
