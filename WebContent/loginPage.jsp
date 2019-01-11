<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>    
	<meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    
    <title>CODE ONE :: 로그인</title>
    
    <link rel="stylesheet" type="text/css" href="css/mycss.css" />
	<link rel="stylesheet" type="text/css" href="css/foundation.css" />
    <link rel="stylesheet" type="text/css" href="css/app.css" />
    <link rel="stylesheet" type="text/css" href="resource/common/css/iubase.css" />
    <link rel="stylesheet" type="text/css" href="resource/common/css/iu.css" />
    <link rel="stylesheet" type="text/css" href="resource/css/pages/index.css" />  
    <link rel="stylesheet" type="text/css" href="css/mainMenuStyles.css" />
        
    <script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
    <script src="https://cdn.jsdelivr.net/velocity/1.2.2/velocity.min.js"></script>
    <script src="https://cdn.jsdelivr.net/velocity/1.2.2/velocity.ui.min.js"></script>
    <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="js/mainMenuScript.js"></script>  
    <script type="text/javascript" src="resource/common/iujs/iuframe.js"></script>
    <script type="text/javascript" src="resource/common/iujs/iuevent.js"></script>
    <script type="text/javascript" src="resource/common/iujs/iuboxes.js"></script>
    <script type="text/javascript" src="resource/common/iujs/iucarousel.js"></script>
    <script type="text/javascript" src="resource/common/iujs/iugooglemap.js"></script>
    <script type="text/javascript" src="resource/common/iujs/iu.js"></script>
    <script type="text/javascript" src="resource/common/plugin/jquery.event.swipe.js"></script>
    <script type="text/javascript" src="resource/common/plugin/jquery.event.move.js"></script>
    <script type="text/javascript" src="resource/common/plugin/jquery.scrollto.js"></script>
	
	
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
			<h5 id='header' class="topbar">
	    		<a href="login.jsp">LOGIN</a>&nbsp;/&nbsp;<a href="register.jsp">JOIN</a>
	    		&nbsp;&nbsp;
	    		<a href="sitemap.html">SITEMAP</a>
	    		&nbsp; 
	    	</h5>
		</header>
    </div>
    
	<div class="menuwrapper">
		<menubar>
			<div>
				<a href='home.jsp'><img class="menulogo" src='img/logo.png'/></a>
			</div>	
			<div id='mainmenu' style="position:relative; z-index:1;">
				<ul>   	
				   	<li class='main has-sub'><a href='introduce/introduce.jsp'>회사소개</a>
				   		<ul>
				   			<li><a href='introduce/history.jsp'>주요연혁</a></li>
				   			<li><a href='introduce/employ.jsp'>채용정보</a></li>
				   			<li><a href='introduce/partner.jsp'>PARTNER</a></li>
				   			<li><a href='introduce/contactus.jsp'>CONTACT US</a></li>
				   		</ul>
				   	</li>
				   	
				   	<li class='active main'><a href='service/service.jsp'>보안서비스</a></li>
				   	
				   	<li class='main has-sub'><a href='solution/solution.jsp'>보안솔루션</a>
				   		<ul>
				   			<li><a href='solution/safecode.jsp'>SAFE CODE</a></li>
				   			<li class='has-sub'><a href='solution/ibm_appscan.jsp'>IBM APPSCAN</a>
				   				<ul>
				   					<li><a href='solution/appscan_std.jsp'>AppScan Standard</a></li>
				   					<li><a href='solution/appscan_src.jsp'>AppScan Source</a></li>
				   				</ul>
				   			</li>
				   			<li class='has-sub'><a href='solution/immunity.jsp'>Immunity</a>
				   				<ul>
				   					<li><a href='solution/canvas.jsp'>CANVAS</a></li>
				   					<li><a href='solution/silica.jsp'>SILICA</a></li>
				   				</ul>
				   			</li>
				   			<li class='has-sub'><a href='solution/microfocus.jsp'>MICROFOCUS</a>
				   				<ul>
				   					<li><a href='solution/devpartner.jsp'>DEVPARTNER</a></li>
				   					<li><a href='solution/devpartner_java.jsp'>DEVPARTNER Java Edition</a></li>
				   				</ul>
				   			</li>
				   		</ul>
				   	</li>
				   	
				   	<li class='main has-sub'><a href='community/community.jsp'>커뮤니티</a>
				   		<ul>
				   			<li><a href='community/noticeboard.jsp'>공지사항</a></li>
				   			<li><a href='community/newsboard.jsp'>보안뉴스</a></li>
				   			<li><a href='#'>FAQ</a></li>
				   			<li><a href='community/qnaboard.jsp'>질문 / 답변</a></li>
				   			<li><a href='community/freeboard.jsp'>자유게시판</a></li>
				   		</ul>
				   	</li>
				</ul>
			</div>
		</menubar>
	</div>
	<div style="width:850px; margin: 50px; position:relative; float:left;">
		<form method="post" action="login.jsp">
			<div style="width: 770px; margin: 30px 40px; padding:10px; position:relative; float:left;">
				<div style="width: 300px; margin: 20px 10px; position:relative; float: left;">
					<img src="img/login.png"/>
				</div>
				<div style="width:390px; height:300px; margin: 20px 10px; position:relative; float: left; box-sizing:border-box; border:1px solid #c7c7c7;">
					<div style="width: 250px; height: 95px; padding:0px; margin: 102.5px 10px;position:relative; float:left;">
						<input type="text" name="uname" value="" placeholder="아이디" style="margin:5px 0px;"/>
						<input type="password" name="pass" value="" placeholder="비밀번호" style="margin:5px 0px;"/>
					</div>
					<div style="width:90px; height:58px; margin: 121px 10px; position:relative; float:left;">
						<input class="large secondary button" type="submit" value="Login"/>
					</div>
				</div>
			</div>
		</form>
	</div>
	<div>
		<footer>
			<div class='footerTotal'>
				<div >
					<img class='footlogo' src="img/footlogo.png"/>
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