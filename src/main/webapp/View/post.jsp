<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <title>Xem bài viết</title>
  <link rel="stylesheet" href="<%=request.getContextPath()%>/css/default.css" />
</head>
<body>
<div id="outer">

  <%@ include file="header.jsp" %>

  <div id="content">
    <div id="primaryContent">
      <h2>Giới thiệu dự án Forum JSP</h2>
      <p><strong>Người đăng:</strong> Hiếu | <strong>Ngày:</strong> 03/08/2025</p>
      <p>Đây là bài viết giới thiệu về dự án forum theo mô hình JSP/Servlet MVC, với các chức năng cơ bản như đăng nhập, đăng ký, tạo bài viết, trả lời bài viết...</p>

      <h3>Bình luận (giả lập)</h3>
      <ul>
        <li><strong>Minh:</strong> Dự án này nhìn dễ hiểu quá!</li>
        <li><strong>Lan:</strong> Giao diện sạch sẽ 👍</li>
      </ul>
    </div>
  </div>

  <%@ include file="footer.jsp" %>

</div>
</body>
</html>
