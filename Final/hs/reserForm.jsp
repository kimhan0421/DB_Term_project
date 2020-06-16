<%@ page contentType="text/html; charset=utf-8" %>

<!DOCTYPE html>
<html>
  <head>
    <%@ include file="head.jsp" %>
  </head>
  <body>
    <div class="uk-container">
      <form method="post" action="reserSearch.jsp">
        <fieldset class="uk-fieldset">
          <legend class="uk-legend">Search roomnumber for reservation</legend>

          <div class="uk-margin">
            <input class="uk-input" type="text" name="room_no" placeholder="ROOM_NUMBER">
          </div>

          <input class="uk-button uk-button-primary" type="submit" value="Submit">
        </fieldset>
      </form>
    </div>
  </body>
</html>