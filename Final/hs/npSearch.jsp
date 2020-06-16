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
      String reser_date = request.getParameter("reser_date");
    %>
    <div class="uk-container">
      <h2 class="uk-heading-line uk-text-center"><span><%= reser_date %></span></h2>
      <table class="uk-table uk-table-hover uk-table-divider">
        <thead>
          <tr>            
            <th>USER_NAME</th> 
            <th>PHONE</th>
            <th>Reser_da</th>                    
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

              String sql = "SELECT r.Reser_Date, u.USER_NAME, u.PHONE FROM RESERVATION r, US_ER u WHERE r.USER_NO = u.User_No AND r.Reser_Date= ";
              sql = sql.concat("'" + reser_date + "'");
              
              pstmt = conn.prepareStatement(sql);

              rs = pstmt.executeQuery();
              while ( rs.next() ) {       
                String USER_NAME = rs.getString("USER_NAME");
                String PHONE = rs.getString("PHONE");  
                String[] Reser_da = rs.getString("Reser_Date").split(" ");             
                %>
                <tr>                  
                  <td><%= USER_NAME %></td> 
                  <td><%= PHONE %></td>
                  <td><%= Reser_da[0] %></td>                                     
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