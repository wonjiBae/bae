<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>    
	<meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    
    <title>CODE ONE :: 회사소개</title>
    
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
					<a href='../home.jsp'>홈</a>><a href='introduce.jsp'>회사소개</a>
				</div>
				<div class='contentsTitle'>
					<h3>회사소개</h3>
				</div>
				<div class='intro contentsBox'>
					안녕하십니까.<br/><br/>
					저희 (주)코드원에 관심을 가져 주신데 대하여 깊은 감사를 드립니다.<br/>
					저희 코드원은 웹 보안 에 관련 통합보안 회사를 지향하며 가장 근본적인 보안, 가장 안전한 보안을 위해 솔루션을 개발, 판매하고 있는 회사입니다.<br/>
					보안제품은 당연히 보안성이 가장 우선시 되어야 합니다만 점점 더 복잡해져 가는 IT환경에서 적절한 보안 기능을 확보한다는 것은 비용이 많이 들고 어려운 기술이 필요한 일입니다.<br/><br/>
					많은 웹 개발자들은 홈페이지를 구축할 때 효율성 및 편의성에 치중하여 설계 구축 단계에서 정보보호를 고려하지 못하고 있습니다.<br/>
					이로 인하여 홈페이지(Web Application 및 Server)는 많은 취약점을 가지고 있으며, 일반 침입차단시스템에 의해서도 보호 받지 못하고있어 최근 많은 해킹사고가 발생되고 있습니다.<br/>
					또한, 웹의 경우 홈페이지 변경 등이 지속적으로 일어나는 특징이 있어 연간 계획을 통한 주기적 진단 체계와 지속적 관리의 필요성이 절대적입니다.<br/><br/>
					보안 코딩 시 많이 사용되는 핵심 보안 프로세스를 국가정보원 및 한국정보보호진흥원(KISA)에서 권고하는 보안코딩 권고안을 준수하며 Compact-Module화 하여 개발자 별, 언어별 구현 방식을 통일화함으로써 최소한의 프로그램 수정 만으로도 일관된 보안 프로세스의 유지, 업데이트 및 기능추가 , 유지보수 등을 용이하게 하며 비 인가자의 실수 및 고의로 인한 보안 프로세스의 위,변조를 원천 차단 하는 SafeCode 패키지를 개발하였습니다.<br/><br/>
					앞으로 고객들이 편하게 접할수 있는 보안회사로 나아갈 것을 약속드립니다.<br/><br/>
					감사합니다.
				</div>
				<div class='introboxContainer'>
					<div class='introbox'>A</div>
					<div class='introbox'>B</div>
					<div class='introbox'>C</div>
					<div class='introbox'>D</div>
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