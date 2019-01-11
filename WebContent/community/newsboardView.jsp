<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	String num = request.getParameter("num");
	String pageNum = request.getParameter("pageNum");
	String searchType = request.getParameter("searchType");
	String searchText = request.getParameter("searchText");
	try {

		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(
			"jdbc:mysql://127.0.0.1:3306/code1", "root", "lee4874");

		pstmt = conn.prepareStatement("UPDATE newsboard SET HIT = HIT + 1 WHERE NUM = ?");
		pstmt.setString(1, num);
		pstmt.executeUpdate();

		pstmt = conn.prepareStatement(
			"SELECT NUM, TITLE, CONTENTS, WRITER, HIT, REG_DATE FROM newsboard "+ 
			"WHERE NUM = ?");
		pstmt.setString(1, num);
		rs = pstmt.executeQuery();
		rs.next();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>    
	<meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    
    <title>CODE ONE :: 보안뉴스</title>
    
    <link rel="stylesheet" type="text/css" href="../css/mycss.css" />
	<link rel="stylesheet" type="text/css" href="../css/foundation.css" />
    <link rel="stylesheet" type="text/css" href="../css/app.css" />
    <link rel="stylesheet" type="text/css" href="../resource/common/css/iubase.css" />
    <link rel="stylesheet" type="text/css" href="../resource/common/css/iu.css" />
    <link rel="stylesheet" type="text/css" href="../resource/css/pages/index.css" />  
    <link rel="stylesheet" type="text/css" href="../css/mainMenuStyles.css" />
        
    <script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
    <script src="https://cdn.jsdelivr.net/velocity/1.2.2/velocity.min.js"></script>
    <script src="https://cdn.jsdelivr.net/velocity/1.2.2/velocity.ui.min.js"></script>
    <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="../js/mainMenuScript.js"></script>  
    <script type="text/javascript" src="../resource/common/iujs/iuframe.js"></script>
    <script type="text/javascript" src="../resource/common/iujs/iuevent.js"></script>
    <script type="text/javascript" src="../resource/common/iujs/iuboxes.js"></script>
    <script type="text/javascript" src="../resource/common/iujs/iucarousel.js"></script>
    <script type="text/javascript" src="../resource/common/iujs/iugooglemap.js"></script>
    <script type="text/javascript" src="../resource/common/iujs/iu.js"></script>
    <script type="text/javascript" src="../resource/common/plugin/jquery.event.swipe.js"></script>
    <script type="text/javascript" src="../resource/common/plugin/jquery.event.move.js"></script>
    <script type="text/javascript" src="../resource/common/plugin/jquery.scrollto.js"></script>
	
	
	<script type="text/javascript">
	function goUrl(url) {
		location.href=url;
	}

	function deleteCheck(url) {
		if (confirm('정말 삭제하시겠어요?')) {
			location.href=url;
		}
	}
	</script>
</head>
<body>
	<div>
		<header>
			<%
  			if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
			%>
			<h5 id='header' class="topbar">
	    		<a href="../loginPage.jsp">LOGIN</a>&nbsp;/&nbsp;<a href="../register.jsp">JOIN</a>
	    		&nbsp;&nbsp;
	    		<a href="../sitemap.html">SITEMAP</a>
	    		&nbsp; 
	    	</h5>
	    	<%
  			} else {
	    	%>
	    	<h5 id='header' class="topbar">
	    		<%=session.getAttribute("userid")%>
	    		&nbsp;&nbsp;
	    		<a href='../logout.jsp'>Logout</a>
	    		&nbsp;&nbsp;
	    		<a href="../sitemap.html">SITEMAP</a>
	    		&nbsp;    		
	    	</h5>
	    	<%
    		}
			%>	
		</header>
    </div>
    
	<div class="menuwrapper">
		<menubar>
			<div>
				<a href='../home.jsp'><img class="menulogo" src='../img/logo.png'/></a>
			</div>	
			<div id='mainmenu' style="position:relative; z-index:1;">
				<ul>   	
				   	<li class='main has-sub'><a href='../introduce/introduce.jsp'>회사소개</a>
				   		<ul>
				   			<li><a href='../introduce/history.jsp'>주요연혁</a></li>
				   			<li><a href='../introduce/employ.jsp'>채용정보</a></li>
				   			<li><a href='../introduce/partner.jsp'>PARTNER</a></li>
				   			<li><a href='../introduce/contactus.jsp'>CONTACT US</a></li>
				   		</ul>
				   	</li>
				   	
				   	<li class='main'><a href='../service/service.jsp'>보안서비스</a></li>
				   	
				   	<li class='main has-sub'><a href='../solution/solution.jsp'>보안솔루션</a>
				   		<ul>
				   			<li><a href='../solution/safecode.jsp'>SAFE CODE</a></li>
				   			<li class='has-sub'><a href='../solution/ibm_appscan.jsp'>IBM APPSCAN</a>
				   				<ul>
				   					<li><a href='../solution/appscan_std.jsp'>AppScan Standard</a></li>
				   					<li><a href='../solution/appscan_src.jsp'>AppScan Source</a></li>
				   				</ul>
				   			</li>
				   			<li class='has-sub'><a href='../solution/immunity.jsp'>Immunity</a>
				   				<ul>
				   					<li><a href='../solution/canvas.jsp'>CANVAS</a></li>
				   					<li><a href='../solution/silica.jsp'>SILICA</a></li>
				   				</ul>
				   			</li>
				   			<li class='has-sub'><a href='../solution/microfocus.jsp'>MICROFOCUS</a>
				   				<ul>
				   					<li><a href='../solution/devpartner.jsp'>DEVPARTNER</a></li>
				   					<li><a href='../solution/devpartner_java.jsp'>DEVPARTNER Java Edition</a></li>
				   				</ul>
				   			</li>
				   		</ul>
				   	</li>
				   	
					<li class='active main has-sub'><a href='community.jsp'>커뮤니티</a>
				   		<ul>
				   			<li><a href='noticeboard.jsp'>공지사항</a></li>
				   			<li><a href='newsboard.jsp'>보안뉴스</a></li>
				   			<li><a href='#'>FAQ</a></li>
				   			<li><a href='qnaboard.jsp'>질문 / 답변</a></li>
				   			<li><a href='freeboard.jsp'>자유게시판</a></li>
				   		</ul>
				   	</li>
				</ul>
			</div>
		</menubar>
	</div>

	<div class='sidebarTotal'>
		<sidebar>
			<div id='sidebar' class='sidebarBody'>
				<ul class='sidebarBox'>
					<h4 class='sidebarTitle'>
						<strong>
							<span>
								<span>커뮤니티</span>
							</span>
						</strong>
					</h4>
					
					<li>
						<a href='noticeboard.jsp' >
							<span>공지사항</span>
						</a>
					</li>
						
					<li>
						<a href='newsboard.jsp'>
							<span>보안뉴스</span>
						</a>
					</li>
					
					<li>
						<a href='#'>
							<span>FAQ</span>
						</a>
					</li>
						
					<li>
						<a href='qnaboard.jsp'>
							<span>질문 / 답변</span>
						</a>
					</li>
					
					<li>
						<a href='freeboard.jsp'>
							<span>자유게시판</span>
						</a>
					</li>
				</ul>
			</div>
		</sidebar>
	</div>
	<div>		
		<contents>
			<div class='contentsTotal'>
				<div class='contentsLink'>
					<a href='../home.jsp'>홈</a>><a href='community.jsp'>커뮤니티</a>><a href='newsboard.jsp'>보안뉴스</a>
				</div>
				<div class='contentsTitle'>
					<h3>공지사항</h3>
				</div>
				<div class='contentsBox'>
					<%=searchText%>
					<table border="1" summary="게시글 보기">
						<colgroup>
							<col width="137" />
							<col width="500" />
						</colgroup>
						<tbody>
							<tr>
								<th align="center">제목</th>
								<td><%=rs.getString("TITLE") %></td>
							</tr>
							<tr>
								<th align="center">작성자</th>
								<td><%=rs.getString("WRITER") %></td>
							</tr>
							<tr>
								<th align="center">등록 일시</th>
								<td><%=rs.getString("REG_DATE") %></td>
							</tr>
							<tr>
								<td colspan="2"><%=rs.getString("CONTENTS") %></td>
							</tr>
						</tbody>
					</table>
					<p class="btn_align" align="right">
						<input type="button" class='small secondary button' value="목록" onclick="goUrl('newsboard.jsp?pageNum=<%=pageNum%>&amp;searchType=<%=searchType%>&amp;searchText=<%=searchText%>');" />
						<%
			  			if ((session.getAttribute("userid")).equals(rs.getString("WRITER"))) {
						%>
						<input type="button" class='small secondary button' value="수정" onclick="goUrl('newsboardModifyForm.jsp?num=<%=num%>&amp;pageNum=<%=pageNum%>&amp;searchType=<%=searchType%>&amp;searchText=<%=searchText%>');" />
						<input type="button" class='small secondary button' value="삭제" onclick="deleteCheck('boardProcess.jsp?mode=newsD&amp;num=<%=num%>&amp;pageNum=<%=pageNum%>&amp;searchType=<%=searchType%>&amp;searchText=<%=searchText%>');" />
						<%
			  			}
						%>
					</p>
				</div>
			</div>
		</contents>
	</div>
	
	<div>
		<footer>
			<div class='footerTotal'>
				<div >
					<img class='footlogo' src="../img/footlogo.png"/>
				</div>
				<div class='footerBox'>
					본사 : 경기도 고양시 덕양구 충장로 2 (행신동), 센트럴빌딩 5층 507호 (우.412-220) / Tel. 031-970-4874 / Fax. 031-970-4854<br><br>
					COPYRIGHT 2006 CODEONE. ALL RIGHTS RESERVED.
				</div>
			</div>
		</footer>
	</div>

</body>
</html>
<%
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		if (rs != null) rs.close();
		if (pstmt != null) pstmt.close();
		if (conn != null) conn.close();
	}
%>