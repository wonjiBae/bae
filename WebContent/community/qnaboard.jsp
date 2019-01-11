<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	int pageNumTemp = 1;
	int listCount = 10;
	int pagePerBlock = 10;
	String whereSQL = "";
	
	String pageNum = request.getParameter("pageNum");
	String searchType = request.getParameter("searchType");
	String searchText = request.getParameter("searchText");
	
	if (searchText == null) {
		searchType = "";
		searchText = "";
	}
	if (pageNum != null) {
		pageNumTemp = Integer.parseInt(pageNum);
	}
	
	String searchTextUTF8 = new String(searchText.getBytes("ISO-8859-1"), "UTF-8");
	
	if (!"".equals(searchText)) {
		if ("ALL".equals(searchType)) {
			whereSQL = " AND TITLE LIKE CONCAT('%',?,'%') OR WRITER LIKE CONCAT('%',?,'%') OR CONTENTS LIKE CONCAT('%',?,'%') ";
		} else if ("TITLE".equals(searchType)) {
			whereSQL = " AND TITLE LIKE CONCAT('%',?,'%') ";
		} else if ("WRITER".equals(searchType)) {
			whereSQL = " AND WRITER LIKE CONCAT('%',?,'%') ";
		} else if ("CONTENTS".equals(searchType)) {
			whereSQL = " AND CONTENTS LIKE CONCAT('%',?,'%') ";
		}
	}
	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(
			"jdbc:mysql://127.0.0.1:3306/code1", "root", "lee4874");
		
		pstmt = conn.prepareStatement("SELECT COUNT(NUM) AS TOTAL FROM qnaboard WHERE ISDELETE != 1" + whereSQL);
		if (!"".equals(whereSQL)) {
			if ("ALL".equals(searchType)) {
				pstmt.setString(1, searchTextUTF8);
				pstmt.setString(2, searchTextUTF8);
				pstmt.setString(3, searchTextUTF8);
			} else {
				pstmt.setString(1, searchTextUTF8);
			}
		}
		rs = pstmt.executeQuery();
		rs.next();
		int totalCount = rs.getInt("TOTAL");
		
		pstmt = conn.prepareStatement("SELECT NUM, TITLE, WRITER, REG_DATE, HIT FROM qnaboard WHERE ISDELETE != 1"+whereSQL+" ORDER BY NUM DESC LIMIT ?, ?");
		if (!"".equals(whereSQL)) {
			
			if ("ALL".equals(searchType)) {
				pstmt.setString(1, searchTextUTF8);
				pstmt.setString(2, searchTextUTF8);
				pstmt.setString(3, searchTextUTF8);
				pstmt.setInt(4, listCount * (pageNumTemp-1));
				pstmt.setInt(5, listCount);			
			} else {
				pstmt.setString(1, searchTextUTF8);
				pstmt.setInt(2, listCount * (pageNumTemp-1));
				pstmt.setInt(3, listCount);			
			}
		} else {	
			pstmt.setInt(1, listCount * (pageNumTemp-1));
			pstmt.setInt(2, listCount);
		}
		rs = pstmt.executeQuery();
%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>    
	<meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    
    <title>CODE ONE :: 질문 및 답변</title>
    
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
	
	function searchCheck() {
		var form = document.searchForm;
		if (form.searchText.value == '') {
			alert('검색어를 입력하세요.');
			form.searchText.focus();
			return false;
		}
		return true;
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
					<a href='../home.jsp'>홈</a>><a href='community.jsp'>커뮤니티</a>><a href='qnaboard.jsp'>질문 및 답변</a>
				</div>
				<div class='contentsTitle'>
					<h3>공지사항</h3>
				</div>
				<div class='contentsBox'>
					<table border="1" summary="게시판 목록">
						<colgroup>
							<col width="56" />
				
							<col width="320" />
				 
							<col width="90" />
							<col width="70" />
							<col width="100" />
				
						</colgroup>
				
					 	<thead>
							<tr>
								<th style="text-align:center;">번호</th>
								<th style="text-align:center;">제목</th>
								<th style="text-align:center;">작성자</th>
								<th style="text-align:center;">조회수</th>
								<th style="text-align:center;">작성일</th>
							</tr>
						</thead>
				
						<tbody>
							<%
							if (totalCount == 0) {
							%>
							<tr>
								<td align="center" colspan="5">등록된 게시물이 없습니다.</td>
							</tr>
							<%
							} else {
								int i = 0;
								while (rs.next()) {
									i++;
							%>
							<tr>
				 			<td align="center"><%=totalCount - i + 1 - (pageNumTemp - 1) * listCount %></td>
								<td style="text-indent:5px;"><a href="qnaboardView.jsp?num=<%=rs.getInt("NUM")%>&amp;pageNum=<%=pageNumTemp%>&amp;searchType=<%=searchType%>&amp;searchText=<%=searchText%>"><%=rs.getString("TITLE") %></a></td>
							<td align="center"><%=rs.getString("WRITER") %></td>
								<td align="center"><%=rs.getInt("HIT") %></td>
								<td align="center"><%=rs.getString("REG_DATE").substring(0, 10) %></td>
							</tr>
							<%
								}
							}
							%>
						</tbody>
				
					</table>
					
					<p  align="right">
						<input type="button" class='small secondary button'value="글쓰기" onclick="goUrl('qnaboardWriteForm.jsp');" />
					</p>
	
					<table class='search-page-box'>
					<tr>
						<td style="text-align:center; background:#ffffff;">
							<%
										if(totalCount > 0) {
											int totalNumOfPage = (totalCount % listCount == 0) ? 
													totalCount / listCount :
													totalCount / listCount + 1;
											
											int totalNumOfBlock = (totalNumOfPage % pagePerBlock == 0) ?
													totalNumOfPage / pagePerBlock :
													totalNumOfPage / pagePerBlock + 1;
											
											int currentBlock = (pageNumTemp % pagePerBlock == 0) ? 
													pageNumTemp / pagePerBlock :
													pageNumTemp / pagePerBlock + 1;
											
											int startPage = (currentBlock - 1) * pagePerBlock + 1;
											int endPage = startPage + pagePerBlock - 1;
											
											if(endPage > totalNumOfPage)
												endPage = totalNumOfPage;
											boolean isNext = false;
											boolean isPrev = false;
											if(currentBlock < totalNumOfBlock)
												isNext = true;
											if(currentBlock > 1)
												isPrev = true;
											if(totalNumOfBlock == 1){
												isNext = false;
												isPrev = false;
											}
											StringBuffer sb = new StringBuffer();
											if(pageNumTemp > 1){
												sb.append("<a href=\"").append("qnaboard.jsp?pageNum=1&amp;searchType="+searchType+"&amp;searchText="+searchText);
												sb.append("\" title=\"<<\"><<</a>&nbsp;");
											}
											if (isPrev) {
												int goPrevPage = startPage - pagePerBlock;			
												sb.append("&nbsp;&nbsp;<a href=\"").append("qnaboard.jsp?pageNum="+goPrevPage+"&amp;searchType="+searchType+"&amp;searchText="+searchText);
												sb.append("\" title=\"<\"><</a>");
											} else {
												
											}
											for (int i = startPage; i <= endPage; i++) {
												if (i == pageNumTemp) {
													sb.append("<a href=\"#\"><strong>").append(i).append("</strong></a>&nbsp;&nbsp;");
												} else {
													sb.append("<a href=\"").append("qnaboard.jsp?pageNum="+i+"&amp;searchType="+searchType+"&amp;searchText="+searchText);
													sb.append("\" title=\""+i+"\">").append(i).append("</a>&nbsp;&nbsp;");
												}
											}
											if (isNext) {
												int goNextPage = startPage + pagePerBlock;
							
												sb.append("<a href=\"").append("qnaboard.jsp?pageNum="+goNextPage+"&amp;searchType="+searchType+"&amp;searchText="+searchText);
												sb.append("\" title=\">\">></a>");
											} else {
												
											}
											if(totalNumOfPage > pageNumTemp){
												sb.append("&nbsp;&nbsp;<a href=\"").append("qnaboard.jsp?pageNum="+totalNumOfPage+"&amp;searchType="+searchType+"&amp;searchText="+searchText);
												sb.append("\" title=\">>\">>></a>");
											}
											out.print(sb.toString());
										}
										%>
						</td>
					</tr>
					<tr>
						<td style="background:#ffffff; ">
							<form name="searchForm" action="qnaboard.jsp" method="get" onsubmit="return searchCheck();">
							<div class='searchBarFrame'>
								<div class='searchBar'>
									<select class='bind' name="searchType">
										<option value="ALL" selected="selected">전체검색</option>
										<option value="TITLE" <%if ("TITLE".equals(searchType)) out.print("selected=\"selected\""); %>>제목</option>
										<option value="WRITER" <%if ("WRITER".equals(searchType)) out.print("selected=\"selected\""); %>>작성자</option>
										<option value="CONTENTS" <%if ("CONTENTS".equals(searchType)) out.print("selected=\"selected\""); %>>내용</option>
									</select>
								</div>
								<div class='searchBar'>
									<input type="text" class='bind' name="searchText" value="<%=searchTextUTF8%>" />
								</div>
								<div class='searchBar'>
									<input type="submit" class='small secondary bind button' value="검색" />
								</div>
							</div>
							</form>
						</td>
					</tr>
					</table>
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