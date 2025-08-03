<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div id="header">
  <h1><a href="<%=request.getContextPath()%>/View/index.jsp">Forum JSP</a></h1>
  <h2>Diễn đàn JSP - Nhóm 18</h2>
</div>

<div id="menu">
  <ul>
    <li class="first"><a href="<%=request.getContextPath()%>/View/index.jsp">Trang chủ</a></li>
    <li><a href="<%=request.getContextPath()%>/View/login.jsp">Đăng nhập</a></li>
    <li><a href="<%=request.getContextPath()%>/View/register.jsp">Đăng ký</a></li>
    <li><a href="<%=request.getContextPath()%>/View/forum.jsp">Bài viết</a></li>
    <li><a href="#">Liên hệ</a></li>
  </ul>
</div>
