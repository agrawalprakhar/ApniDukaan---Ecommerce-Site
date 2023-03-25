<%@page import="com.learn.mycart.entities.User"%>
<%
    User user1 = (User) session.getAttribute("current-user");


%>

<nav class="navbar navbar-expand-lg navbar-dark custom-bg  ">
    <div class="container">
        <a class="navbar-brand" href="index.jsp" style="color:aliceblue"><h2><i><u>ApniDukaan.com</u></i></h2></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
           
            <ul class="navbar-nav ml-auto">
              <li class="nav-item active">
                  <a class="nav-link" href="#!" data-toggle="modal" data-target="#cart"><i class='fa fa-cart-plus'style='font-size:20px'><span class="ml-0 cart-items"> ( 0 )  </span></i></a>
                </li>
                <%                    if (user1 == null) {
                %>
                <li class="nav-item active">
                    <a class="nav-link" href="login.jsp">Login</a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="register.jsp">Register</a>
                </li>
                <%
                } else {
                %>

                <li class="nav-item active">
                    <a class="nav-link" href="<%= user1.getUserType().equals("admin")?"admin.jsp":"normal.jsp"%>"  ><%= user1.getUserName()%></a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="LogOutServlet">LogOut</a>
                </li>
                <%
                    }
                %>

            </ul>
        </div>
    </div>
</nav>
