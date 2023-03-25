<%-- 
    Document   : register
    Created on : 14-Mar-2023, 1:58:34 am
    Author     : pranj
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New User</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
       <style>
    body {
  background-image: url('img/andy-hermawan-uFdCDgnoNVI-unsplash.jpg');
  background-repeat: no-repeat;
  background-attachment: fixed;
  background-size: 100% 100%;
}
</style>
    <body>
        <%@include file="components/navbar.jsp" %>

        <div class="row mt-2">
            <div class="col-md-4 offset-md-4">
                <div class="card">
                    <%@include  file="components/message.jsp" %>
                    <div class="card-body px-5" style="background-color:aliceblue">
                        <div class="container text-center">
                            <img src="img/add-friend.png" style="max-width: 80px;"  class="img-fluid" alt="alt"/>
                        </div>
                        <h4 class="text-center my-2">Sign Up !!</h4>
                        <form action="RegisterServlets" method="post">
                            <div class="form-group">
                                <label for="name">User Name</label>
                                <input type="text" name="user_name" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter Here">  
                            </div>

                            <div class="form-group">
                                <label for="email">Email Address</label>
                                <input type="email" name="user_email" class="form-control" id="email" aria-describedby="emailHelp" placeholder="Enter Here">  
                            </div>

                            <div class="form-group">
                                <label for="password">Password</label>
                                <input type="password"name="user_password" class="form-control" id="password" aria-describedby="emailHelp" placeholder="Enter Here">  
                            </div>

                            <div class="form-group">
                                <label for="phone">Phone Number</label>
                                <input type="number" name="user_phone"class="form-control" id="phone" aria-describedby="emailHelp" placeholder="Enter Here">  
                            </div>

                            <div class="form-group">
                                <label for="address">Address</label>
                                <textarea class="form-control"name="user_address" placeholder="Enter Your Address" rows="2" cols="10"></textarea>
                            </div>

                            <div class="container text-center">
                                <button style="margin-right: 40px" class="btn btn-outline-success">Register</button>

                                <button type="reset" class="btn btn-outline-warning">Reset</button>
                            </div>   
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
