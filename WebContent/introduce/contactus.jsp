<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>    
	<meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    
    <title>CODE ONE :: CONTACT US</title>
    
    <link rel="stylesheet" type="text/css" href="../css/mycss.css" />
	<link rel="stylesheet" type="text/css" href="../css/foundation.css" />
    <link rel="stylesheet" type="text/css" href="../css/app.css" />
    <link rel="stylesheet" type="text/css" href="../resource/common/css/iubase.css">
    <link rel="stylesheet" type="text/css" href="../resource/common/css/iu.css">
    <link rel="stylesheet" type="text/css" href="../resource/css/pages/index.css">  
    <link rel="stylesheet" href="../css/mainMenuStyles.css">
    
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.js"></script>    
    <script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
    <script src="https://cdn.jsdelivr.net/velocity/1.2.2/velocity.min.js"></script>
    <script src="https://cdn.jsdelivr.net/velocity/1.2.2/velocity.ui.min.js"></script>
    <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
    <script src="../js/mainMenuScript.js"></script>  
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
	
	$(document).ready(function () {  
    	var top = $('#adside').offset().top - parseFloat($('#adside').css('marginTop').replace(/auto/, 0));
        $(window).scroll(function (event) {
        	var y = $(this).scrollTop();
  
 	 	    if (y >= top) {
        		$('#adside').addClass('fixed');
       		} else {
        		$('#adside').removeClass('fixed');
    	  	}
		});
	});
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
				   	<li class='active main has-sub'><a href='introduce.jsp'>회사소개</a>
				   		<ul>
				   			<li><a href='history.jsp'>주요연혁</a></li>
				   			<li><a href='employ.jsp'>채용정보</a></li>
				   			<li><a href='partner.jsp'>PARTNER</a></li>
				   			<li><a href='contactus.jsp'>CONTACT US</a></li>
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
				   	
				   	<li class='main has-sub'><a href='../community/community.jsp'>커뮤니티</a>
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
								<span>회사소개</span>
							</span>
						</strong>
					</h4>
						
					<li>
						<a href='history.jsp'>
							<span>주요연혁</span>
						</a>
					</li>
							
					<li>
						<a href='employ.jsp'>
							<span>채용정보</span>
						</a>
					</li>
						
					<li>
						<a href='partner.jsp'>
							<span>PARTNER</span>
						</a>
					</li>
							
					<li>
						<a href='contactus.jsp'>
							<span>CONTACT US</span>
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
					<a href='../home.jsp'>홈</a>><a href='introduce.jsp'>회사소개</a>><a href='contactus.jsp'>CONTACT US</a>
				</div>
				<div class='contentsTitle'>
					<h3>CONTACT US</h3>
				</div>
				<div class='contentsBox'>
					<span>주소 : 경기도 고양시 덕양구 충장로 2 (행신동), 센트럴빌딩 5층 507호 (우.412-220)</span>
					<img src='../img/map.png'/>
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