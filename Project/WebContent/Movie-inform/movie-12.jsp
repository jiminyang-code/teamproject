<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Reply.ReplyDao"%>
<%@ page import="Reply.ReplyDTO"%>
<%@ page import="Reply.ReplyUserDTO"%>
<jsp:useBean id="dto" class="Reply.ReplyDTO" scope="page"></jsp:useBean>
<jsp:useBean id="dto2" class="Reply.ReplyUserDTO" scope="page"></jsp:useBean>
<jsp:useBean id="userDTO" class="Movie.UserDTO" scope="page"></jsp:useBean>


<%
	request.setCharacterEncoding("UTF-8");

String userID = null;
if (session.getAttribute("userID") != null) {
	userID = (String) session.getAttribute("userID");
}

ReplyDao dao = ReplyDao.getInstance();

/*게시물 ID번호 세팅*/
dto.setBoardID(12);
dto2.setBoardID(12);

int boardID = dto2.getBoardID();
int boardID2 = dto.getBoardID();
int number = 0; //비회원 댓글삭제 인덱스넘버링 변수
/* response.sendRedirect("replyAction.jsp?boardID="+boardID); */
/* request.setAttribute("boardID", boardID); */
/* request.getRequestDispatcher("replyAction.jsp").forward(request, response); */
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="../css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/jquery-2.1.3.min.js">
    </script>
<script src="../js/jquery.scrollTo.min.js"></script>
<script src="./script.js"></script>
</head>

<style>
.carousel-control {
	width: 0%;
}
</style>
<body>
	<section id="2"></section>
	<div id="header">
		<!-- 네비게이션 -->
		<%
			if (userID != null) {
		%>
		<nav class="clearfix">
			<ul class="clearfix">
				<li onclick="location.href='../ViewPage/main.jsp'"><a href="#">HOME</a></li>
				<li onclick="location.href='../Movie/logoutAction.jsp'"><a
					href="#">로그아웃</a></li>
				<li onclick="location.href='../Movie/memberJoin.jsp'"><a
					href="#">회원가입</a></li>
				<li onclick="location.href='../ViewPage/movie.jsp'"><a href="#">MOVIE</a></li>
				<li onclick="location.href='../Music/ost-search.jsp'"><a
					href="#">OST</a></li>
				<li><a href="#">LOCATION</a></li>
			</ul>
			<a href="" id="trigger"></a>
		</nav>
		<%
			} else {
		%>
		<nav class="clearfix">
			<ul class="clearfix">
				<li onclick="location.href='../ViewPage/main.jsp'"><a href="#">HOME</a></li>
				<li onclick="location.href='../Movie/login.jsp'"><a href="#">로그인</a></li>
				<li onclick="location.href='../Movie/memberJoin.jsp'"><a
					href="#">회원가입</a></li>
				<li onclick="location.href='../ViewPage/movie.jsp'"><a href="#">MOVIE</a></li>
				<li onclick="location.href='../Music/ost-search.jsp'"><a
					href="#">OST</a></li>
				<li><a href="#">LOCATION</a></li>

			</ul>
			<a href="" id="trigger"></a>
		</nav>

		<%
			}
		%>
	</div>
	<div id="container">
		<div id="contents">
			<div id="select_main">
				<div class="heading-wrap" style="margin-top: 50px;">
					<h2 style="font-weight: bold;">영화상세페이지</h2>
				</div>
				<div class="movie-sector">
					<div class="box-image">
						<span class="thumb-image"> <img src="./images/Gsc.jpg">
							<!--포스터-->
						</span>
					</div>
					<!--박스콘텐츠-->
					<div class="box-contents">
    <div class="title">
        <strong>기생충</strong>
        <p style="margin-top: 10px;">PARASITE</p>
    </div>
    <div class="spec" style="margin-top: 5px;">
        <dl>
            <dt>감독 : 봉준호</dt>
            <dt>배우 : 장혜진, 조여정, 최우식, 이선균, 송강호, 박소담... </dt>
            <dt>장르 : 드라마</dt>
            <dt>개봉 : 2019</dt>
        </dl>
    </div>
    <div id="like" class="like" style="margin-top: 48px;">
        <img src="./images/stillcut.png" onclick="location.href='./UIcard/card-12.jsp'">
        <img src="./images/music.png" style="margin-left:-6px;" onclick="location.href='../Music/ost-search.jsp'">
        <a href="#1"><img id="reply" src="./images/reply.png" style="margin-left:-3px;"></a>
    </div>
</div>
</div>
</div>
​
<!--스토리 글-->
<br>
<h4 style="font-weight: bold; padding-top: 15px;">줄거리</h4>
<div class="story">전원백수로 살 길 막막하지만 사이는 좋은 기택(송강호) 가족.
<br>장남 기우(최우식)에게 명문대생 친구가 연결시켜 준 고액 과외 자리는
모처럼 싹튼 고정수입의 희망이다. 온 가족의 도움과 기대 속에 박사장(이선균) 집으로 향하는 기우.
글로벌 IT기업 CEO인 박사장의 저택에 도착하자
젊고 아름다운 사모님 연교(조여정)가 기우를 맞이한다.
<br> 그러나 이렇게 시작된 두 가족의 만남 뒤로, 걷잡을 수 없는 사건이 기다리고 있었으니… <br><br><br><br>
</div>



			<div class="slide">
				<div id="myCarousel" class="carousel slide" data-ride="carousel">
					<ol class="carousel-indicators">

						<%
							for (int i = 0; i < 4; i++) {
						%>
						<li data-target="#myCarousel" data-slide-to="<%=i%>"
							class="active"></li>
						<%
							}
						%>
					</ol>
					<div class="carousel-inner">

						<div class="item active">
							<img src="./images/Gsc1.jpg">
							<!--이미지1-->
						</div>
						<%
							for (int i = 6; i < 10; i++) {
						%>
						<div class="item">
							<img src="./images/Gsc<%=i%>.jpg" style="margin: 0 auto;">
						</div>
						<!--나머지 이미지-->
						<%
							}
						%>
					</div>
					<a class="left carousel-control" href="#myCarousel"
						data-slide="prev"> <span
						class="glyphicon glyphicon-chevron-left"></span>
					</a> <a class="right carousel-control" href="#myCarousel"
						data-slide="next"> <span
						class="glyphicon glyphicon-chevron-right"></span>
					</a>
				</div>
			</div>

			<!--댓글-->
			<label style="margin-top: 15px;">전체 리플</label>
			<hr style="border: 1.5px solid gray;">
			<%
				ArrayList<ReplyUserDTO> check = dao.replyList2(boardID);
			ArrayList<Object> list = dao.replyList3(boardID2);
			for (int i = 0; i < list.size(); i++) {
				dto = (ReplyDTO) list.get(i);
				String id = dto.getUserID();
				String reply = dto.getReplyContent();
			%>

			<table>
				<tr>
					<%-- <%if(userID == null) id = "***"; %> --%>

					<td style="font-weight: bold;"><%=id%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td style="color: gray;"><%=reply%></td>
				</tr>
				<hr>
				<%
					/*비회원 리스트를 가져와서 조인 테이블 리스트의 ID값과 비교해서 비회원 댓글만 삭제창이 나오도록함*/
				for (int j = 0; j < check.size(); j++) {
					dto2 = check.get(j);
					String checkId = dto2.getUserID();
					if (checkId.equals(id)) {
				%>
				<div class="cmt_mdf_del" data-type="cmt" style="float: right">
					<button type="button" class="btn_cmt_delete" id="btn_cmt_delete"
						onclick="dis(<%=number%>)">삭제</button>
					<div id="cmt_delpw_box" class="cmt_delpw_box" data-type="cmt"
						style="margin: -16px 0 0 -242px">
						<input type="hidden" value="<%=checkId%>" name="cmt_ID"
							id="cmt_ID" class="cmt_ID"> <input type="password"
							title="비밀번호" placeholder="비밀번호" id="cmt_password"
							name="cmt_password" class="cmt_delpw">
						<button type="button" id="btn_ok" class="btn_ok"
							onclick="deleteReply(<%=number%>)">확인</button>
						<!-- 매개변수를 j로 했을때 동일아이디를 같은 숫자로 인식하는 문제 발생, number 인트 변수를 따로 설정해서 1씩 증가하도록 해서 해결-->
						<button type="button" class="btn_cmtpw_close" id="btn_cmtpw_close"
							onclick="appear(<%=number%>)">
							<span class="blind">닫기</span> <em class="sp_img icon_cmtpw_close"></em>
						</button>
					</div>
				</div>
				<%
					number += 1; /*넘버값 0부터 1씩 증가하도록 선처리 후증가로 */
				break;
				}
				}
				%>
			</table>

			<%
				}
			%>
			<hr>
			<%-- <% 
			ArrayList<ReplyUserDTO> list2 = dao.replyList2(1);
			for(ReplyUserDTO reply : list2) {
				String noneId = reply.getUserID();
				String noneReply = reply.getReplyContent();
				
			%>
			<table>
				<tr>
					<td style="font-weight: bold;"><%=noneId%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td><%=noneReply%></td>
				</tr>
			</table>
			
			<% } %>
			 --%>

			<!--회원댓글작성-->
			<%
				if (session.getAttribute("userID") != null) {
				userID = (String) session.getAttribute("userID");
			%>
			<section ID="1" class="container">
				<form action="replyAction.jsp" name="Form" id="Form"
					class="form-horizontal" method="post">
					<div class="form-group">
						<label>댓글</label> <input type="hidden" value=<%=boardID2%>
							name="boardID">
						<!--히든값 게시물 아이디-->

						<textarea style="margin: 0px; width: 972px; height: 35px;"
							class="form-control" name="replyContent" id="replyContent"
							cols="45" rows="5" placeholder="댓글입력하기"></textarea>

						<br>
						<button type="submit" class="btn pull-right">등록</button>
					</div>
				</form>
				<hr>

			</section>
			<%
				} else {
			%>
			<!--비회원댓글작성-->
			<section ID="1" style="width: 980px;" class="container">
				<form action="replyAction.jsp" id="Form" class="form-horizontal"
					method="post">
					<div class="form-group">
						<label>댓글작성&nbsp;</label>
						<div>
							<input type="text" name="userID" placeholder="닉네임"> <input
								type="password" name="userPW" placeholder="비밀번호"> <input
								type="hidden" value=<%=boardID%> name="boardID">
							<!--히든값 게시물 아이디-->
						</div>
						<textarea style="margin-top: 5px; width: 972px; height: 35px;"
							class="form-control" name="replyContent" id="replyContent"
							cols="45" rows="3" placeholder="댓글입력하기"></textarea>
						<br>
						<button type="submit" class="btn pull-right">등록</button>
					</div>
				</form>
				<hr>
			</section>

			<%
				}
			%>
			<!--댓글 끝-->

			<a href="#2" class="btn_gotop" id="btn_gotop"> <img
				src="../images/topbutton.png" style="position: fixed; width: 80px;">
				<span class="glyphicon glyphicon-chevron-up"> </span>
			</a>
		</div>
	</div>
	<script type="text/javascript">
	 
	 var deleteReply = function(i) {
		 location.href = 'replyDelete.jsp?cmt_ID=' +replyID[i].value + '&cmt_password=' + replyPW[i].value +'&boardID='+<%=boardID%>;
	 }
	 
	 
	    
    
</script>
</body>
</html>