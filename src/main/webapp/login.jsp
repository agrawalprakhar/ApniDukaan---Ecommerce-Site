
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Login - My Cart</title>
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
        <div class="container">
            <div class="row">
                <div class="col-md-6 offset-md-3">
                    <div class="card mt-5">

                        <div class="card-header custom-bg text-white">
                            <h4 class="text-center ">Login Here</h4>
                        </div>
                        <div class="card-body" style="background-color: #c8e9eb">
                            <%@include file="components/message.jsp" %>
                            <form action="LoginServlet" method="post">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input style="border-radius: 50px" name = "email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input style="border-radius: 50px"name="password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                </div>
                                <div class="container text-center " >
                                    <a href="register.jsp" style="color:red"><i>If Not Registered Click here!!</i></a>
                                    <br>
                                    <button type="submit" class="btn btn-primary custom-bg px-3 mt-4 mr-4 border-0">Submit</button>
                                    <button type="reset" class="btn btn-primary custom-bg px-3 mt-4 border-0">Reset</button>
                                </div>
                            </form>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
