<%@ page contentType="text/html; charset=utf-8" %>

<!DOCTYPE html>
<html>
  <head>
    <%@ include file="head.jsp" %>
  </head>
  <body>
    <div class="uk-container">
      <form method="post" action="npSearch.jsp">
        <fieldset class="uk-fieldset">
          <legend class="uk-legend">Search Name, Phone</legend>

          <div class="uk-margin">
            <input class="uk-input" type="text" name="reser_date" placeholder="2020-01-01">
          </div>

          <input class="uk-button uk-button-primary" type="submit" value="Submit">
        </fieldset>
      </form>
    </div>
  </body>
</html>