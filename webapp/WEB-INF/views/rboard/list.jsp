<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/assets/css/mysite.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/board.css" rel="stylesheet" type="text/css">

</head>


<body>
	<div id="wrap">

		<c:import url="/WEB-INF/views/include/header.jsp"></c:import>
		<!-- //header -->
		<!-- //nav -->

		<div id="aside">
			<h2>게시판</h2>
			<ul>
				<li><a href="">일반게시판</a></li>
				<li><a href="${pageContext.request.contextPath}/rboard/list">댓글게시판</a></li>
			</ul>
		</div>
		<!-- //aside -->

		<div id="content">

			<div id="content-head">
				<h3>게시판</h3>
				<div id="location">
					<ul>
						<li>홈</li>
						<li>게시판</li>
						<li class="last">일반게시판</li>
					</ul>
				</div>
				<div class="clear"></div>
			</div>
			<!-- //content-head -->

			<div id="board">
				<div id="list">
					<form action="" method="">
						<div class="form-group text-right">
							<input type="text">
							<button type="submit" id=btn_search>검색</button>
						</div>
					</form>
					<table >
						<thead>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>글쓴이</th>
								<th>조회수</th>
								<th>작성일</th>
								<th>관리</th>
								<th>group_no</th>
								<th>order_no</th>
								<th>depth</th>
								
							</tr>
						</thead>
						<tbody>
							<!-- 반복문 처리  -->
						<c:forEach items="${rList}" var="vo">
							<tr>
								<td>${vo.no}</td>
								<td class="text-left">
									<a href="${pageContext.request.contextPath}/rboard/read?no=${vo.no}&userno=${vo.userno }">${vo.title}</a>									
								</td>
								<td>${vo.name}</td>
								<td>${vo.hit}</td>
								<td>${vo.regdate}</td>
								<td>
									<!-- 로그인시에만 보이도록 session에 올라가있는 authUser.no값과 vo.user_no비교-->
										<c:if test="${authUser.no == vo.userno}">
						                 	<a href="${pageContext.request.contextPath}/rboard/delete?no=${vo.no}">[삭제]</a>
										</c:if>
									
								</td>
								<td>${vo.groupno} </td>
								<td>${vo.orderno}</td>
								<td>${vo.depth}</td>
							</tr>
						</c:forEach>
						<!-- /반복문처리 -->
						</tbody>
					</table>
		
					<div id="paging">
						<ul>
							<li><a href="">◀</a></li>
							<li><a href="">1</a></li>
							<li><a href="">2</a></li>
							<li><a href="">3</a></li>
							<li><a href="">4</a></li>
							<li class="active"><a href="">5</a></li>
							<li><a href="">6</a></li>
							<li><a href="">7</a></li>
							<li><a href="">8</a></li>
							<li><a href="">9</a></li>
							<li><a href="">10</a></li>
							<li><a href="">▶</a></li>
						</ul>
						
						
						<div class="clear"></div>
					</div>
					<!-- 로그인 시에만 보이도록 -->
					<c:if test="${!empty sessionScope.authUser}">
						<a id="btn_write" href="${pageContext.request.contextPath}/rboard/writeForm">글쓰기</a>
					</c:if>
				</div>
				<!-- //list -->
			</div>
			<!-- //board -->
		</div>
		<!-- //content  -->
		<div class="clear"></div>

		<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>
		<!-- //footer -->
	</div>
	<!-- //wrap -->

</body>

</html>