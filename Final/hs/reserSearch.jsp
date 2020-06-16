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
      String room_no = request.getParameter("room_no");
    %>
    <div class="uk-container">
      <h2 class="uk-heading-line uk-text-center"><span><%= room_no %></span></h2>
      <table class="uk-table uk-table-hover uk-table-divider">
        <thead>
          <tr>
            <th>Room_number</th> 
            <th>User_number</th>
            <th>Reser_Date</th> 
            <th>Start_time</th>
            <th>End_time</th>
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

              String sql = "SELECT * FROM reservation h WHERE room_no = ";
              sql = sql.concat("'" + room_no + "'");
              
              pstmt = conn.prepareStatement(sql);

              rs = pstmt.executeQuery();
              while ( rs.next() ) {
                String ro_num = rs.getString("room_no");
                String user_num = rs.getString("user_no");
                String[] reser_da = rs.getString("Reser_date").split(" ");
                String star_t = rs.getString("Start_time");
                String end_t = rs.getString("end_time");
                %>
                <tr>
                  <td><%= ro_num %></td> 
                  <td><%= user_num %></td> 
                  <td><%= reser_da[0] %></td> 
                  <td><%= star_t %></td> 
                  <td><%= end_t %></td>                        
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