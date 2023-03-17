<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>마이페이지 | 여행이지</title>
	    <link rel="stylesheet" href="../asset/css/reset.css">
	    <link rel="stylesheet" href="../asset/css/common.css">
	    <link rel="stylesheet" href="../asset/css/mypage.css">
	    <link rel="stylesheet" href="../asset/css/addClass.css">
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
</head>
<body>

	<jsp:include page="/WEB-INF/views/member/header.jsp"/>
	<main>
	    <jsp:include page="/WEB-INF/views/member/mypageLeftMenu.jsp"/>
	    <jsp:include page="/WEB-INF/views/member/mypageRight.jsp"/>
    </main>
    <jsp:include page="/WEB-INF/views/member/footer.jsp"/>
</body>
</html>