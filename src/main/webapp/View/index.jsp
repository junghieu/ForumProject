<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <title>Forum Nhóm JSP</title>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <link href="<%=request.getContextPath()%>/css/default.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="outer">

  <%@ include file="header.jsp" %>

  <div id="content">
    <div id="primaryContentContainer">
      <div id="primaryContent">
        <h2>Chào mừng đến với diễn đàn nhóm JSP!</h2>
        <p>Đây là một dự án mô phỏng forum sử dụng mô hình JSP/Servlet theo MVC. Phần giao diện được thiết kế tĩnh, chưa có xử lý logic.</p>
        
        <h3>Danh sách bài viết mới</h3>
        <table>
          <tr>
            <th>Ngày</th>
            <th>Tiêu đề</th>
            <th>Mô tả</th>
          </tr>
          <tr class="rowA">
            <td>03/08/2025</td>
            <td>Giới thiệu dự án</td>
            <td>Dự án xây dựng diễn đàn sử dụng mô hình MVC với JSP/Servlet.</td>
          </tr>
          <tr class="rowB">
            <td>01/08/2025</td>
            <td>Thành viên nhóm</td>
            <td>Danh sách thành viên tham gia thiết kế và phát triển hệ thống.</td>
          </tr>
        </table>
      </div>
    </div>

    <div id="secondaryContent">
      <h3>Chức năng sắp có</h3>
      <ul>
        <li>Đăng nhập/Đăng ký</li>
        <li>Gửi bài viết mới</li>
        <li>Chỉnh sửa hồ sơ</li>
        <li>Trả lời bài viết</li>
      </ul>
    </div>

    <div class="clear"></div>
  </div>

  <%@ include file="footer.jsp" %>

</div>
</body>
</html>
