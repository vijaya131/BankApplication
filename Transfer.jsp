<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String id = request.getParameter("userid");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "Bank";
String userid = "root";
String password = "root";
Connection con = null;
Statement stmt = null;
ResultSet rs = null;
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

%>
<html>
<BODY bgcolor="#FFFFF">

<h>Available Balance=5000</h>
<BR>
<br>
<table border="5"style="background-color: #FFFFF;" WIDTH="50%">
<tr>
<td>transaction_details</td>
<td>account number</td>
<td>amount transfer</td>
</tr>
<%
try{
con = DriverManager.getConnection(connectionUrl+database, userid, password);
stmt=con.createStatement();
String sql ="select * from account";
rs = stmt.executeQuery(sql);
while(rs.next()){
%>
<tr>
<td><%=rs.getString("transcation_details") %></td>
<td><%=rs.getString("account_number") %></td>
<td><%=rs.getString("amount_transfer") %></td>

</tr>
<%
}
con.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>

</body>
</html>