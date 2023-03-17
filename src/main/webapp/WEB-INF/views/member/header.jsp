<%@page import="com.travelez.app.member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% 
	MemberDto login = (MemberDto)session.getAttribute("login");
%>
<header>
    <div class="hTop">
        <h1><a href="home.do"><img src="../asset/images/logo.png" alt="여행이지"></a></h1>
        <div class="hTopRightMenu">
            <c:if test="${sessionScope.login.teId == null }">
	            <a href="login.do">로그인</a>
	            <a href="regi.do">회원가입</a>
            </c:if>
            <c:if test="${sessionScope.login.teId != null }">
				<a href ="mypage.do?teId=<%=login.getTeId() %>"><img src="<%= login.getTeProfile() %>"><span><%=login.getTeId() %></span>님</a>
	            <a href="logout.do">로그아웃</a>
            </c:if>
        </div>
    </div>
    <div class="hBottomBg">
        <a href="#none" class="hBtmLogo"><img src="../asset/images/logoW.png" alt="여행이지"></a>
        <nav class="hBottom">
            <a href="ta_detail.do">숙소</a>
            <a href="play.do">놀거리</a>
            <a href="plan.do">여행플랜</a>
        </nav>
        <div class="hBtmRightMenu">
            <c:if test="${sessionScope.login.teId == null }">
	            <a href="login.do" class="login">로그인</a>
	            <a href="regi.do" class="regi">회원가입</a>
            </c:if>
            <c:if test="${sessionScope.login.teId != null }">
				<a href ="mypage.do?teId=<%=login.getTeId() %>" class="mypage" id="mypage"><img src="<%= login.getTeProfile() %>"></a>
	            <a href="logout.do" class="logout" id="logout">로그아웃</a>
            </c:if>
        </div>
    </div>
</header>

<script>
    let hBottomBg = document.querySelectorAll(".hBottomBg")[0];
    let hBtmLogo = document.querySelectorAll(".hBtmLogo ")[0];
    let hBtmRightMenu = document.querySelectorAll(".hBtmRightMenu ")[0];

    console.log(hBottomBg);
    console.log(hBtmLogo);
    console.log(hBtmRightMenu);

    hBtmDefault()
    
        document.addEventListener('scroll', function(){
            if(window.pageYOffset > 100){
                hBottomBg.style.position = 'fixed'
                hBtmLogo.style.display = 'block'
                hBtmRightMenu.style.display = "flex"
                
            }else {
                hBtmDefault()
            }
        });

        function hBtmDefault(){
            hBottomBg.style.position = 'relative'
            hBtmLogo.style.display = 'none'
            hBtmRightMenu.style.display = "none"
        }
</script>
