<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Viết bài mới</title>
</head>
<body>
    <h2>Viết bài mới</h2>
    <form method="post" action="post">
        <label>Tiêu đề:</label><br>
        <input type="text" name="title" required><br><br>

        <label>Nội dung:</label><br>
        <textarea name="content" rows="10" cols="50" required></textarea><br><br>

        <input type="submit" value="Đăng bài">
    </form>
    <br>
    <a href="home.jsp">Quay lại</a>
</body>
</html>
