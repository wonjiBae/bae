<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	
	request.setCharacterEncoding("UTF-8");

	Connection conn = null;
	PreparedStatement pstmt = null;
	
	String mode = request.getParameter("mode");
	String title = request.getParameter("title");
	String writer = request.getParameter("writer");
	String contents = request.getParameter("contents");
	String num = request.getParameter("num");
	String pageNum = request.getParameter("pageNum");
	String searchType = request.getParameter("searchType");
	String searchText = request.getParameter("searchText");
	String ip = request.getRemoteAddr();
	try {

		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/code1", "root", "lee4874");
		
		///////////////////////////////////////////////////////////////////////////////
		/********************************noticeboard**********************************/
		///////////////////////////////////////////////////////////////////////////////
		if ("noticeW".equals(mode)) {
			pstmt = conn.prepareStatement(
				"INSERT INTO noticeboard (TITLE, WRITER, CONTENTS, IP, HIT, REG_DATE, MOD_DATE, ISDELETE) "+
				"VALUES (?, ?, ?, ?, 0, NOW(), NOW(), 0)"
				);
			pstmt.setString(1, title);
			pstmt.setString(2, (session.getAttribute("userid")).toString()); //계정사용자 이름 넣을것
			pstmt.setString(3, contents);
			pstmt.setString(4, ip);
			pstmt.executeUpdate();
	
			response.sendRedirect("noticeboard.jsp");
		} else if ("noticeM".equals(mode)) {
			pstmt = conn.prepareStatement(
				"UPDATE noticeboard SET TITLE = ?, WRITER = ?, CONTENTS = ?, IP = ?, MOD_DATE = NOW() "+
				"WHERE NUM = ?");
			pstmt.setString(1, title);
			pstmt.setString(2, (session.getAttribute("userid")).toString());//계정사용자이름
			pstmt.setString(3, contents);
			pstmt.setString(4, ip);
			pstmt.setString(5, num);
			pstmt.executeUpdate();
			
			response.sendRedirect(
				"noticeboardView.jsp?num="+num+"&pageNum="+pageNum+"&searchType="+searchType+"&searchText="+searchText);
		} else if ("noticeD".equals(mode)) {
			pstmt = conn.prepareStatement("UPDATE noticeboard SET ISDELETE = 1 WHERE NUM = ?");
			pstmt.setString(1, num);
			pstmt.executeUpdate();
			
			response.sendRedirect(
				"noticeboard.jsp?pageNum="+pageNum+"&searchType="+searchType+"&searchText="+searchText);
		
		///////////////////////////////////////////////////////////////////////////////
		/*********************************newsboard***********************************/
		///////////////////////////////////////////////////////////////////////////////
		} else if ("newsW".equals(mode)) {
			pstmt = conn.prepareStatement(
				"INSERT INTO newsboard (TITLE, WRITER, CONTENTS, IP, HIT, REG_DATE, MOD_DATE, ISDELETE) "+
				"VALUES (?, ?, ?, ?, 0, NOW(), NOW(), 0)"
				);
			pstmt.setString(1, title);
			pstmt.setString(2, (session.getAttribute("userid")).toString()); //계정사용자 이름 넣을것
			pstmt.setString(3, contents);
			pstmt.setString(4, ip);
			pstmt.executeUpdate();
		
			response.sendRedirect("newsboard.jsp");
		} else if ("newsM".equals(mode)) {
			pstmt = conn.prepareStatement(
				"UPDATE newsboard SET TITLE = ?, WRITER = ?, CONTENTS = ?, IP = ?, MOD_DATE = NOW() "+
				"WHERE NUM = ?");
			pstmt.setString(1, title);
			pstmt.setString(2, (session.getAttribute("userid")).toString());//계정사용자이름
			pstmt.setString(3, contents);
			pstmt.setString(4, ip);
			pstmt.setString(5, num);
			pstmt.executeUpdate();
				
			response.sendRedirect(
				"newsboardView.jsp?num="+num+"&pageNum="+pageNum+"&searchType="+searchType+"&searchText="+searchText);
		} else if ("newsD".equals(mode)) {
			pstmt = conn.prepareStatement("UPDATE newsboard SET ISDELETE = 1 WHERE NUM = ?");
			pstmt.setString(1, num);
			pstmt.executeUpdate();
			
			response.sendRedirect(
				"newsboard.jsp?pageNum="+pageNum+"&searchType="+searchType+"&searchText="+searchText);
		
		///////////////////////////////////////////////////////////////////////////////
		/**********************************qnaboard***********************************/
		///////////////////////////////////////////////////////////////////////////////		
		} else if ("qnaW".equals(mode)) {
			pstmt = conn.prepareStatement(
				"INSERT INTO qnaboard (TITLE, WRITER, CONTENTS, IP, HIT, REG_DATE, MOD_DATE, ISDELETE) "+
				"VALUES (?, ?, ?, ?, 0, NOW(), NOW(), 0)"
				);
			pstmt.setString(1, title);
			pstmt.setString(2, "test"); //계정사용자 이름 넣을것
			pstmt.setString(3, contents);
			pstmt.setString(4, ip);
			pstmt.executeUpdate();
		
			response.sendRedirect("qnaboard.jsp");
		} else if ("qnaM".equals(mode)) {
			pstmt = conn.prepareStatement(
				"UPDATE qnaboard SET TITLE = ?, WRITER = ?, CONTENTS = ?, IP = ?, MOD_DATE = NOW() "+
				"WHERE NUM = ?");
			pstmt.setString(1, title);
			pstmt.setString(2, "test");//계정사용자이름
			pstmt.setString(3, contents);
			pstmt.setString(4, ip);
			pstmt.setString(5, num);
			pstmt.executeUpdate();
				
			response.sendRedirect(
				"qnaboardView.jsp?num="+num+"&pageNum="+pageNum+"&searchType="+searchType+"&searchText="+searchText);
		} else if ("qnaD".equals(mode)) {
			pstmt = conn.prepareStatement("UPDATE qnaboard SET ISDELETE = 1 WHERE NUM = ?");
			pstmt.setString(1, num);
			pstmt.executeUpdate();
			
			response.sendRedirect(
				"qnaboard.jsp?pageNum="+pageNum+"&searchType="+searchType+"&searchText="+searchText);
		
		///////////////////////////////////////////////////////////////////////////////
		/*********************************freeboard***********************************/
		///////////////////////////////////////////////////////////////////////////////	
		} else if ("freeW".equals(mode)) {
			pstmt = conn.prepareStatement(
				"INSERT INTO freeboard (TITLE, WRITER, CONTENTS, IP, HIT, REG_DATE, MOD_DATE, ISDELETE) "+
				"VALUES (?, ?, ?, ?, 0, NOW(), NOW(), 0)"
				);
			pstmt.setString(1, title);
			pstmt.setString(2, "test"); //계정사용자 이름 넣을것
			pstmt.setString(3, contents);
			pstmt.setString(4, ip);
			pstmt.executeUpdate();
				
			response.sendRedirect("freeboard.jsp");
		} else if ("freeM".equals(mode)) {
			pstmt = conn.prepareStatement(
				"UPDATE freeboard SET TITLE = ?, WRITER = ?, CONTENTS = ?, IP = ?, MOD_DATE = NOW() "+
				"WHERE NUM = ?");
			pstmt.setString(1, title);
			pstmt.setString(2, "test");//계정사용자이름
			pstmt.setString(3, contents);
			pstmt.setString(4, ip);
			pstmt.setString(5, num);
			pstmt.executeUpdate();
						
			response.sendRedirect(
				"freeboardView.jsp?num="+num+"&pageNum="+pageNum+"&searchType="+searchType+"&searchText="+searchText);
		} else if ("freeD".equals(mode)) {
			pstmt = conn.prepareStatement("UPDATE freeboard SET ISDELETE = 1 WHERE NUM = ?");
			pstmt.setString(1, num);
			pstmt.executeUpdate();
					
			response.sendRedirect(
				"freeboard.jsp?pageNum="+pageNum+"&searchType="+searchType+"&searchText="+searchText);
		} else {
			response.sendRedirect("community.jsp");
		}

	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		if (pstmt != null) pstmt.close();
		if (conn != null) conn.close();
	}
%>