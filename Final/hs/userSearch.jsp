<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
  <head>
    <%@ include file="head.jsp" %>
  </head>
  <body>
    <%
      request.setCharacterEncoding("utf-8");
      String user_no = request.getParameter("user_no");
    %>
    <div class="uk-container">
      <h2 class="uk-heading-line uk-text-center"><span><%= user_no %></span></h2>
      <table class="uk-table uk-table-hover uk-table-divider">
        <thead>
          <tr>           
            <th>User_Name</th>            
          </tr>
        </thead>
        <tbody>
          <%
            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;
          
            try {
              Class.forName("oracle.jdbc.driver.OracleDriver");
            } catch(ClassNotFoundException cnfe) {
              cnfe.printStackTrace();
              System.out.println("Driver Loading Failed.");
            }
            try {
              String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:xe";
              String userId = "class_a";
              String userPass = "practice";

              conn = DriverManager.getConnection(jdbcUrl, userId, userPass);

              String sql = "SELECT USER_NAME FROM us_er WHERE USER_NO > ";
              sql = sql.concat("'" + user_no + "'");
              
              pstmt = conn.prepareStatement(sql);

              rs = pstmt.executeQuery();
              while ( rs.next() ) {
                String user_name = rs.getString("USER_NAME");               
                %>
                <tr>
                  <td><%= user_name %></td>                                    
                </tr>
                <%
              }  
            } catch(SQLException e) {
              e.printStackTrace();

              if (rs != null) {
                try {
                  rs.close();
                } catch (SQLException sqle) {}
              }
              if (pstmt != null) {
                try {
                  pstmt.close();
                } catch (SQLException sqle) {}
              }
              if (conn != null) {
                try {
                  conn.close();
                } catch(SQLException sqle) {}
              }
            }
            %>
        </tbody>
      </table>
    </div>
  </body>
</html>