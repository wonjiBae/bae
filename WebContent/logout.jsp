<%
session.setAttribute("userid", null);
session.invalidate();
response.sendRedirect("home.jsp");
%>