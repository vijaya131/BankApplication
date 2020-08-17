<%@ page language="java" contentType="text/html; charset=ISO-8859-1" %>
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<%
String name=request.getParameter("name");
String account_number=request.getParameter("account_number");
String amount_transfer=request.getParameter("amount_transfer");
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/transaction", "root", "root");
Statement st=conn.createStatement();
st.executeUpdate("insert into account(transcation_details,account_number,amount_transfer)values('"+name+"','"+account_number+"','"+amount_transfer+"')");
}
catch(Exception e)
{
e.printStackTrace();
}
%>

