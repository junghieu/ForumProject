<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <title>Diễn đàn</title>
  <link rel="stylesheet" href="<%=request.getContextPath()%>/css/default.css" />
</head>
<body>
<div id="outer">

  <%@ include file="header.jsp" %>

  <div id="content">
    <div id="primaryContent">
      <h2>Danh sách bài viết</h2>
      <table>
        <tr>
          <th>Tiêu đề</th>
          <th>Tác giả</th>
          <th>Ngày đăng</th>
        </tr>
        <tr class="rowA">
          <td><a href="post.jsp">Giới thiệu dự án Forum JSP</a></td>
          <td>Hiếu</td>
          <td>03/08/2025</td>
        </tr>
        <tr class="rowB">
          <td><a href="post.jsp">Hướng dẫn cấu trúc MVC</a></td>
          <td>Minh</td>
          <td>01/08/2025</td>
        </tr>
      </table>
    </div>
  </div>

  <%@ include file="footer.jsp" %>

</div>
</body>
</html>
