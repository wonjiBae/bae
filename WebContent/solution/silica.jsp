<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>    
	<meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    
    <title>CODE ONE :: SAFE CODE</title>
    
    <link rel="stylesheet" type="text/css" href="../css/mycss.css" />
	<link rel="stylesheet" type="text/css" href="../css/foundation.css" />
    <link rel="stylesheet" type="text/css" href="../css/app.css" />
    <link rel="stylesheet" type="text/css" href="../resource/common/css/iubase.css" />
    <link rel="stylesheet" type="text/css" href="../resource/common/css/iu.css" />
    <link rel="stylesheet" type="text/css" href="../resource/css/pages/index.css" />  
    <link rel="stylesheet" type="text/css" href="../css/mainMenuStyles.css" />
    <link rel="stylesheet" type="text/css" href="../css/solutionMenuStyles.css" />
    
    <script src="//code.jquery.com/jquery-1.10.2.js"></script>
 	<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>    
    <script src="https://cdn.jsdelivr.net/velocity/1.2.2/velocity.min.js"></script>
    <script src="https://cdn.jsdelivr.net/velocity/1.2.2/velocity.ui.min.js"></script>
    <script type="text/javascript" src="../js/mainMenuScript.js"></script>
    <script type="text/javascript" src="../js/solutionMenuScript.js"/>  
    <script type="text/javascript" src="../resource/common/iujs/iuframe.js"></script>
    <script type="text/javascript" src="../resource/common/iujs/iuevent.js"></script>
    <script type="text/javascript" src="../resource/common/iujs/iuboxes.js"></script>
    <script type="text/javascript" src="../resource/common/iujs/iucarousel.js"></script>
    <script type="text/javascript" src="../resource/common/iujs/iugooglemap.js"></script>
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
	
	function activeTab1(){
		$("#tab1").removeClass();
		$("#tab2").removeClass();
		$("#tab3").removeClass();
		$("#tab1").addClass('active');		
		$("#tab3").addClass('last');
	}
	
	function activeTab2(){
		$("#tab1").removeClass();
		$("#tab2").removeClass();
		$("#tab3").removeClass();
		$("#tab2").addClass('active');		
		$("#tab3").addClass('last');
	}

	function activeTab3(){
		$("#tab1").removeClass();
		$("#tab2").removeClass();
		$("#tab3").removeClass();
		$("#tab3").addClass('active');		
		$("#tab3").addClass('last');		
	}
	
	$(function() {
		$( "#tabmenu" ).tabs();
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
				   	<li class='main has-sub'><a href='../introduce/introduce.jsp'>회사소개</a>
				   		<ul>
				   			<li><a href='../introduce/history.jsp'>주요연혁</a></li>
				   			<li><a href='../introduce/employ.jsp'>채용정보</a></li>
				   			<li><a href='../introduce/partner.jsp'>PARTNER</a></li>
				   			<li><a href='../introduce/contactus.jsp'>CONTACT US</a></li>
				   		</ul>
				   	</li>
				   	
				   	<li class='main'><a href='service.jsp'>보안서비스</a></li>
				   	
				   	<li class='active main has-sub'><a href='solution.jsp'>보안솔루션</a>
				   		<ul>
				   			<li><a href='safecode.jsp'>SAFE CODE</a></li>
				   			<li class='has-sub'><a href='ibm_appscan.jsp'>IBM APPSCAN</a>
				   				<ul>
				   					<li><a href='appscan_std.jsp'>AppScan Standard</a></li>
				   					<li><a href='ppscan_src.jsp'>AppScan Source</a></li>
				   				</ul>
				   			</li>
				   			<li class='has-sub'><a href='immunity.jsp'>Immunity</a>
				   				<ul>
				   					<li><a href='canvas.jsp'>CANVAS</a></li>
				   					<li><a href='silica.jsp'>SILICA</a></li>
				   				</ul>
				   			</li>
				   			<li class='has-sub'><a href='microfocus.jsp'>MICROFOCUS</a>
				   				<ul>
				   					<li><a href='devpartner.jsp'>DEVPARTNER</a></li>
				   					<li><a href='devpartner_java.jsp'>DEVPARTNER Java Edition</a></li>
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
		
	<div style="width: 100%; height: 230px; background: #777777; padding: 20px; margin-bottom:-5px;">
		SAFE CODE
	</div>
	<div style="position:relative; height:200px;">
		<div id='tabmenu'>
			<ul>
		    	<li id='tab1' class='active'><a href='#tabmenu-1' onclick="activeTab1();"><span>제품소개</span></a></li>
		   		<li id='tab2'><a href='#tabmenu-2' onclick="activeTab2();"><span>설치환경</span></a></li>
		    	<li id='tab3' class='last'><a href='#tabmenu-3' onclick="activeTab3();"><span>trial</span></a></li>
			</ul>
			<div id='tabmenu-1' style="width: 600px; margin: 15px 30px 70px 30px; box-sizing:border-box; border: 1px solid #c7c7c7;">
				<div style="padding:20px;">
					contents1
				</div>
			</div>
			<div id='tabmenu-2' style="width: 600px; margin: 15px 30px 70px 30px; box-sizing:border-box; border: 1px solid #c7c7c7;">
				<div style="padding:20px;">
					contents2
				</div>
			</div>
			<div id='tabmenu-3' style="width: 600px; margin: 15px 30px 70px 30px; box-sizing:border-box; border: 1px solid #c7c7c7;">
				<div style="padding:20px;">
					contents3
				</div>
			</div>		
		</div>		
		<div style="top:45px; left:640px; width: 250px; position:absolute; padding: 20px; box-sizing:border-box; border: 1px solid #c7c7c7;">
			<h4>제품문의</h4>
			<h6>이메일</h6>
			<h6>000-000-0000</h6>
		</div>
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