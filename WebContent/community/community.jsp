<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%

	Connection conn = null;
	PreparedStatement noticePstmt = null;
	PreparedStatement newsPstmt = null;
	PreparedStatement freePstmt = null;
	PreparedStatement qnaPstmt = null;
	ResultSet noticeRs = null;
	ResultSet newsRs = null;
	ResultSet freeRs = null;
	ResultSet qnaRs = null;
	
	int noticePageNumTemp = 1;
	int newsPageNumTemp = 1;
	int freePageNumTemp = 1;
	int qnaPageNumTemp = 1;
	int listCount = 10;
	int pagePerBlock = 10;
	String whereNoticeSQL = "";
	String whereNewsSQL = "";
	String whereFreeSQL = "";
	String whereQnaSQL = "";
	
	String noticePageNum = request.getParameter("noticePageNum");
	String noticeSearchType = request.getParameter("noticeSearchType");
	String noticeSearchText = request.getParameter("noticeSearchText");
	
	String newsPageNum = request.getParameter("newsPageNum");
	String newsSearchType = request.getParameter("newsSearchType");
	String newsSearchText = request.getParameter("newsSearchText");

	String freePageNum = request.getParameter("freePageNum");
	String freeSearchType = request.getParameter("freeSearchType");
	String freeSearchText = request.getParameter("freeSearchText");

	String qnaPageNum = request.getParameter("qnaPageNum");
	String qnaSearchType = request.getParameter("qnaSearchType");
	String qnaSearchText = request.getParameter("qnaSearchText");

	if (noticeSearchText == null) {
		noticeSearchType = "";
		noticeSearchText = "";
	}
	if (noticePageNum != null) {
		noticePageNumTemp = Integer.parseInt(noticePageNum);
	}
	
	if (newsSearchText == null) {
		newsSearchType = "";
		newsSearchText = "";
	}
	if (newsPageNum != null) {
		newsPageNumTemp = Integer.parseInt(newsPageNum);
	}

	if (freeSearchText == null) {
		freeSearchType = "";
		freeSearchText = "";
	}
	if (freePageNum != null) {
		freePageNumTemp = Integer.parseInt(freePageNum);
	}

	if (qnaSearchText == null) {
		qnaSearchType = "";
		qnaSearchText = "";
	}
	if (qnaPageNum != null) {
		qnaPageNumTemp = Integer.parseInt(qnaPageNum);
	}

	String noticeSearchTextUTF8 = new String(noticeSearchText.getBytes("ISO-8859-1"), "UTF-8");
	String newsSearchTextUTF8 = new String(newsSearchText.getBytes("ISO-8859-1"), "UTF-8");
	String freeSearchTextUTF8 = new String(freeSearchText.getBytes("ISO-8859-1"), "UTF-8");
	String qnaSearchTextUTF8 = new String(qnaSearchText.getBytes("ISO-8859-1"), "UTF-8");

	if (!"".equals(noticeSearchText)) {
		if ("ALL".equals(noticeSearchType)) {
			whereNoticeSQL = " AND TITLE LIKE CONCAT('%',?,'%') OR WRITER LIKE CONCAT('%',?,'%') OR CONTENTS LIKE CONCAT('%',?,'%') ";
		} else if ("TITLE".equals(noticeSearchType)) {
			whereNoticeSQL = " AND TITLE LIKE CONCAT('%',?,'%') ";
		} else if ("WRITER".equals(noticeSearchType)) {
			whereNoticeSQL = " AND WRITER LIKE CONCAT('%',?,'%') ";
		} else if ("CONTENTS".equals(noticeSearchType)) {
			whereNoticeSQL = " AND CONTENTS LIKE CONCAT('%',?,'%') ";
		}
	}
	
	if (!"".equals(newsSearchText)) {
		if ("ALL".equals(newsSearchType)) {
			whereNewsSQL = " AND TITLE LIKE CONCAT('%',?,'%') OR WRITER LIKE CONCAT('%',?,'%') OR CONTENTS LIKE CONCAT('%',?,'%') ";
		} else if ("TITLE".equals(newsSearchType)) {
			whereNewsSQL = " AND TITLE LIKE CONCAT('%',?,'%') ";
		} else if ("WRITER".equals(newsSearchType)) {
			whereNewsSQL = " AND WRITER LIKE CONCAT('%',?,'%') ";
		} else if ("CONTENTS".equals(newsSearchType)) {
			whereNewsSQL = " AND CONTENTS LIKE CONCAT('%',?,'%') ";
		}
	}

	if (!"".equals(freeSearchText)) {
		if ("ALL".equals(freeSearchType)) {
			whereFreeSQL = " AND TITLE LIKE CONCAT('%',?,'%') OR WRITER LIKE CONCAT('%',?,'%') OR CONTENTS LIKE CONCAT('%',?,'%') ";
		} else if ("TITLE".equals(freeSearchType)) {
			whereFreeSQL = " AND TITLE LIKE CONCAT('%',?,'%') ";
		} else if ("WRITER".equals(freeSearchType)) {
			whereFreeSQL = " AND WRITER LIKE CONCAT('%',?,'%') ";
		} else if ("CONTENTS".equals(freeSearchType)) {
			whereFreeSQL = " AND CONTENTS LIKE CONCAT('%',?,'%') ";
		}
	}

	if (!"".equals(qnaSearchText)) {
		if ("ALL".equals(qnaSearchType)) {
			whereQnaSQL = " AND TITLE LIKE CONCAT('%',?,'%') OR WRITER LIKE CONCAT('%',?,'%') OR CONTENTS LIKE CONCAT('%',?,'%') ";
		} else if ("TITLE".equals(qnaSearchType)) {
			whereQnaSQL = " AND TITLE LIKE CONCAT('%',?,'%') ";
		} else if ("WRITER".equals(qnaSearchType)) {
			whereQnaSQL = " AND WRITER LIKE CONCAT('%',?,'%') ";
		} else if ("CONTENTS".equals(qnaSearchType)) {
			whereQnaSQL = " AND CONTENTS LIKE CONCAT('%',?,'%') ";
		}
	}
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(
			"jdbc:mysql://127.0.0.1:3306/code1", "root", "lee4874");
		
		noticePstmt = conn.prepareStatement("SELECT COUNT(NUM) AS TOTAL FROM noticeboard WHERE ISDELETE != 1" + whereNoticeSQL);
		
		if (!"".equals(whereNoticeSQL)) {
			if ("ALL".equals(noticeSearchType)) {
				noticePstmt.setString(1, noticeSearchTextUTF8);
				noticePstmt.setString(2, noticeSearchTextUTF8);
				noticePstmt.setString(3, noticeSearchTextUTF8);
			} else {
				noticePstmt.setString(1, noticeSearchTextUTF8);
			}
		}
		noticeRs = noticePstmt.executeQuery();
		noticeRs.next();
		int noticeTotalCount = noticeRs.getInt("TOTAL");
		
		newsPstmt = conn.prepareStatement("SELECT COUNT(NUM) AS TOTAL FROM newsboard WHERE ISDELETE != 1" + whereNewsSQL);

		if (!"".equals(whereNewsSQL)) {
			if ("ALL".equals(newsSearchType)) {
				newsPstmt.setString(1, newsSearchTextUTF8);
				newsPstmt.setString(2, newsSearchTextUTF8);
				newsPstmt.setString(3, newsSearchTextUTF8);
			} else {
				newsPstmt.setString(1, newsSearchTextUTF8);
			}
		}
		newsRs = newsPstmt.executeQuery();
		newsRs.next();
		int newsTotalCount = newsRs.getInt("TOTAL");

		freePstmt = conn.prepareStatement("SELECT COUNT(NUM) AS TOTAL FROM freeboard WHERE ISDELETE != 1" + whereFreeSQL);

		if (!"".equals(whereFreeSQL)) {
			if ("ALL".equals(freeSearchType)) {
				freePstmt.setString(1, freeSearchTextUTF8);
				freePstmt.setString(2, freeSearchTextUTF8);
				freePstmt.setString(3, freeSearchTextUTF8);
			} else {
				freePstmt.setString(1, freeSearchTextUTF8);
			}
		}
		freeRs = freePstmt.executeQuery();
		freeRs.next();
		int freeTotalCount = freeRs.getInt("TOTAL");

		qnaPstmt = conn.prepareStatement("SELECT COUNT(NUM) AS TOTAL FROM qnaboard WHERE ISDELETE != 1" + whereQnaSQL);

		if (!"".equals(whereQnaSQL)) {
			if ("ALL".equals(qnaSearchType)) {
				qnaPstmt.setString(1, qnaSearchTextUTF8);
				qnaPstmt.setString(2, qnaSearchTextUTF8);
				qnaPstmt.setString(3, qnaSearchTextUTF8);
			} else {
				qnaPstmt.setString(1, qnaSearchTextUTF8);
			}
		}
		qnaRs = qnaPstmt.executeQuery();
		qnaRs.next();
		int qnaTotalCount = qnaRs.getInt("TOTAL");
		
		noticePstmt = conn.prepareStatement("SELECT NUM, TITLE, WRITER, REG_DATE, HIT FROM noticeboard WHERE ISDELETE != 1"+whereNoticeSQL+" ORDER BY NUM DESC LIMIT ?, ?");
		if (!"".equals(whereNoticeSQL)) {
			
			if ("ALL".equals(noticeSearchType)) {
				noticePstmt.setString(1, noticeSearchTextUTF8);
				noticePstmt.setString(2, noticeSearchTextUTF8);
				noticePstmt.setString(3, noticeSearchTextUTF8);
				noticePstmt.setInt(4, listCount * (noticePageNumTemp-1));
				noticePstmt.setInt(5, listCount);			
			} else {
				noticePstmt.setString(1, noticeSearchTextUTF8);
				noticePstmt.setInt(2, listCount * (noticePageNumTemp-1));
				noticePstmt.setInt(3, listCount);			
			}
		} else {	
			noticePstmt.setInt(1, listCount * (noticePageNumTemp-1));
			noticePstmt.setInt(2, listCount);
		}
		noticeRs = noticePstmt.executeQuery();

		newsPstmt = conn.prepareStatement("SELECT NUM, TITLE, WRITER, REG_DATE, HIT FROM newsboard WHERE ISDELETE != 1"+whereNewsSQL+" ORDER BY NUM DESC LIMIT ?, ?");
		if (!"".equals(whereNewsSQL)) {
			
			if ("ALL".equals(newsSearchType)) {
				newsPstmt.setString(1, newsSearchTextUTF8);
				newsPstmt.setString(2, newsSearchTextUTF8);
				newsPstmt.setString(3, newsSearchTextUTF8);
				newsPstmt.setInt(4, listCount * (newsPageNumTemp-1));
				newsPstmt.setInt(5, listCount);			
			} else {
				newsPstmt.setString(1, newsSearchTextUTF8);
				newsPstmt.setInt(2, listCount * (newsPageNumTemp-1));
				newsPstmt.setInt(3, listCount);			
			}
		} else {	
			newsPstmt.setInt(1, listCount * (newsPageNumTemp-1));
			newsPstmt.setInt(2, listCount);
		}
		newsRs = newsPstmt.executeQuery();

		freePstmt = conn.prepareStatement("SELECT NUM, TITLE, WRITER, REG_DATE, HIT FROM freeboard WHERE ISDELETE != 1"+whereFreeSQL+" ORDER BY NUM DESC LIMIT ?, ?");
		if (!"".equals(whereFreeSQL)) {
			
			if ("ALL".equals(freeSearchType)) {
				freePstmt.setString(1, freeSearchTextUTF8);
				freePstmt.setString(2, freeSearchTextUTF8);
				freePstmt.setString(3, freeSearchTextUTF8);
				freePstmt.setInt(4, listCount * (freePageNumTemp-1));
				freePstmt.setInt(5, listCount);			
			} else {
				freePstmt.setString(1, freeSearchTextUTF8);
				freePstmt.setInt(2, listCount * (freePageNumTemp-1));
				freePstmt.setInt(3, listCount);			
			}
		} else {	
			freePstmt.setInt(1, listCount * (freePageNumTemp-1));
			freePstmt.setInt(2, listCount);
		}
		freeRs = freePstmt.executeQuery();

		qnaPstmt = conn.prepareStatement("SELECT NUM, TITLE, WRITER, REG_DATE, HIT FROM qnaboard WHERE ISDELETE != 1"+whereQnaSQL+" ORDER BY NUM DESC LIMIT ?, ?");
		if (!"".equals(whereQnaSQL)) {
			
			if ("ALL".equals(qnaSearchType)) {
				qnaPstmt.setString(1, qnaSearchTextUTF8);
				qnaPstmt.setString(2, qnaSearchTextUTF8);
				qnaPstmt.setString(3, qnaSearchTextUTF8);
				qnaPstmt.setInt(4, listCount * (qnaPageNumTemp-1));
				qnaPstmt.setInt(5, listCount);			
			} else {
				qnaPstmt.setString(1, qnaSearchTextUTF8);
				qnaPstmt.setInt(2, listCount * (qnaPageNumTemp-1));
				qnaPstmt.setInt(3, listCount);			
			}
		} else {	
			qnaPstmt.setInt(1, listCount * (qnaPageNumTemp-1));
			qnaPstmt.setInt(2, listCount);
		}
		qnaRs = qnaPstmt.executeQuery();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>    
	<meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    
    <title>CODE ONE :: 보안서비스</title>
    
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
				   	
				   	<li class='main'><a href='service.jsp'>보안서비스</a></li>
				   	
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
				   	
				   	<li class='active main has-sub'><a href='../community/community.jsp'>커뮤니티</a>
				   		<ul>
				   			<li><a href='../community/noticeboard.jsp'>공지사항</a></li>
				   			<li><a href='../community/newsboard.jsp'>보안뉴스</a></li>
				   			<li><a href='#'>FAQ</a></li>
				   			<li><a href='../community/qnaboard.jsp'>질문 / 답변</a></li>
				   			<li><a href='../community/freeboard.jsp'>자유게시판</a></li>
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
					<a href='../home.jsp'>홈</a>><a href='community.jsp'>커뮤니티</a>
				</div>
				<div class='contentsTitle'>
					<h3>커뮤니티</h3>
				</div>
				<div class='contentsBox'>
					<div>
						
					</div>
					<div class="community-columns">    	
			            <div class="community-column">
			                <div class="box">
			                    <div class="box-top">
			                    	<a href='noticeboard.jsp'>공지사항</a>
			                    </div>
			                    
			                    <div class="box-content">
			                        <table class="board-1" border="1">
			                            <%
			                            if (noticeTotalCount == 0) {
			                            %>
			                            <tr>
			                                <td align="center">등록된 게시물이 없습니다.</td>
			                            </tr>
			                            <%
			                            } else {
			                    			int i = 0;
			                    			while (noticeRs.next()&&i<=4) {
			                    				i++;   
			                            %>
			                            <tr>
			                                <td style="text-indent:5px;"><a href="noticeboardView.jsp?num=<%=noticeRs.getInt("NUM")%>&amp;pageNum=<%=noticePageNumTemp%>&amp;searchType=<%=noticeSearchType%>&amp;searchText=<%=noticeSearchText%>"><%=noticeRs.getString("TITLE") %></a></td>
			                            </tr>
			                            <%
			                                }
			                            }
			                            %>
			                        </table>
			                	</div>
			                </div>		
			            </div>
			                        
			            <div class="community-column">
			                <div class="box">
			                    <div class="box-top">
			                    	<a href='newsboard.jsp'>보안뉴스</a>
			                    </div>
			                    
			                    <div class="box-content">
			                        <table class="board-2" border="1">
			                        	<%
			                            if (newsTotalCount == 0) {
			                            %>
			                            <tr>
			                                <td align="center">등록된 게시물이 없습니다.</td>
			                            </tr>
			                            <%
			                            } else {
			                    			int i = 0;
			                    			while (newsRs.next()&&i<=4) {
			                    				i++;   
			                            %>
			                            <tr>
			                                <td style="text-indent:5px;"><a href="newsboardView.jsp?num=<%=newsRs.getInt("NUM")%>&amp;pageNum=<%=newsPageNumTemp%>&amp;searchType=<%=newsSearchType%>&amp;searchText=<%=newsSearchText%>"><%=newsRs.getString("TITLE") %></a></td>
			                            </tr>
			                            <%
			                                }
			                            }
			                            %>
			                        </table>
			                	</div>
			                </div>		
			            </div>
					</div>
					
					<div style="padding:20px;">
						<div>
							<h5><a href="qnaboard.jsp">질문 및 답변</a></h5>
						</div>
						<div class="box-content">
			            	<table class="board-4" border="1">
			                    <%
			                    if (qnaTotalCount == 0) {
			                    %>
			                    	<tr>
			                        	<td align="center">등록된 게시물이 없습니다.</td>
			                    	</tr>
			                    <%
			                    } else {
			                    	int i = 0;
			                    	while (qnaRs.next()&&i<=4) {
			                    		i++;   
			                    %>
			                    <tr>
			                    	<td style="text-indent:5px;"><a href="qnaboardView.jsp?num=<%=qnaRs.getInt("NUM")%>&amp;pageNum=<%=qnaPageNumTemp%>&amp;searchType=<%=qnaSearchType%>&amp;searchText=<%=qnaSearchText%>"><%=qnaRs.getString("TITLE") %></a></td>
			                    </tr>
			                    <%
			                    	}
			                    }
			                	%>
			            	</table>
			        	</div>
					</div>
					
					<div style="padding:20px; position:relative; float:left; width: 100%;">
						<div>
							<div>
								<h5><a href="#">FAQ</a></h5>
							</div>
							<div style="position: relative; float:left; width: 282px; height:200px; margin-right:10px; margin-left:5px;">
								<div style="position: relative; margin:4px 0px;">
									<a href="#"><img src="../img/arrow.png"></img>&nbsp;&nbsp;질문1</a>
								</div>
								<div style="position: relative; margin:4px 0px;">
									<a href="#"><img src="../img/arrow.png"></img>&nbsp;&nbsp;질문2</a>
								</div>
								<div style="position: relative; margin:4px 0px;">
									<a href="#"><img src="../img/arrow.png"></img>&nbsp;&nbsp;질문3</a>
								</div>
								<div style="position: relative; margin:4px 0px;">
									<a href="#"><img src="../img/arrow.png"></img>&nbsp;&nbsp;질문4</a>
								</div>
							</div>
						</div>
						<div style="background-image:url('../img/#'); text-align:right; font-size:18px; margin-right:5px; margin-left:10px; padding: 20px; padding-top:120px; position: relative; float: left; height:200px; width: 282px;">
							문의전화<br/> 031 - 970 - 4874
						</div>
					</div>
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
		if (noticeRs != null) noticeRs.close();
		if (noticePstmt != null) noticePstmt.close();
		if (newsRs != null) newsRs.close();
		if (newsPstmt != null) newsPstmt.close();
		if (freeRs != null) freeRs.close();
		if (freePstmt != null) freePstmt.close();
		if (qnaRs != null) qnaRs.close();
		if (qnaPstmt != null) qnaPstmt.close();
		if (conn != null) conn.close();
	}
%>