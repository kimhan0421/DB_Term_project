<%@ page contentType="text/html; charset=utf-8" %>

<!DOCTYPE html>
<html>
  <head>
    <%@ include file="head.jsp" %>
  </head>
  <body>
    <div class="uk-container">
      <form method="post" action="userSearch.jsp">
        <fieldset class="uk-fieldset">
          <legend class="uk-legend">Search roomnumber for reservation</legend>

          <div class="uk-margin">
            <input class="uk-input" type="text" name="user_no" placeholder="userNumber">
          </div>

          <input class="uk-button uk-button-primary" type="submit" value="Submit">
        </fieldset>
      </form>
    </div>
  </body>
</html>