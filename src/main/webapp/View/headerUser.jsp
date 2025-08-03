<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div id="header">
  <h1><a href="<%=request.getContextPath()%>/View/home.jsp">Forum JSP</a></h1>
  <h2>Chào mừng trở lại, [Tên người dùng]</h2>
</div>

<div id="menu">
  <ul>
    <li class="first"><a href="<%=request.getContextPath()%>/View/home.jsp">Trang chủ</a></li>
    <li><a href="<%=request.getContextPath()%>/View/forum.jsp">Bài viết</a></li>
    <li><a href="<%=request.getContextPath()%>/View/profile.jsp">Hồ sơ</a></li>
    <li><a href="<%=request.getContextPath()%>/View/logout.jsp">Đăng xuất</a></li>
  </ul>
</div>
