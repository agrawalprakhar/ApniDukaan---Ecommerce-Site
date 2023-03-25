<%@page import="java.util.Map"%>

<%@page import="com.learn.mycart.helper.Helper"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.entities.Category"%>
<%@page import="com.learn.mycart.dao.CategoryDao"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page import="com.learn.mycart.entities.User"%>
<%
    User user = (User) session.getAttribute("current-user");
    if (user == null) {

        session.setAttribute("message", "You are not Logged In !! LoginFirst ");
        response.sendRedirect("login.jsp");
        return;
    } else {
        if (user.getUserType().equals("normal")) {
            session.setAttribute("message", "You are not Admin !!  ");
            response.sendRedirect("login.jsp");
            return;

        }
    }


%>

 <!--product category-->
                            <%
                               CategoryDao cdao= new CategoryDao(FactoryProvider.getFactory());
                               List<Category> list=cdao.getCategories();
//getting count
                      Map<String,Long> m=Helper.getCounts(FactoryProvider.getFactory());



                                %>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Panel</title>
        <%@include file= "components/common_css_js.jsp"%>
    </head>
    <style>
    body {
  background-image: url('img/andy-hermawan-uFdCDgnoNVI-unsplash.jpg');
  background-repeat: no-repeat;
  background-attachment: fixed;
  background-size: 100% 100%;
}
</style>
    <body >
        <%@include file="components/navbar.jsp" %>
        <div class="container admin ">
            <div class="container-fluid mt-3">
                <%@include file="components/message.jsp" %>
            </div>
            <div class="row mt-3">
                <div class="col-md-4">
                    <div class="card mt-2 " >
                        <div class="card-body text-center" >
                            <div class="container" >
                                <img style=" max-width: 125px;" class="img-fluid " src="img/teamwork.png" alt="user_icon"/>
                            </div>
                            <h1><%= m.get("userCount") %></h1>
                            <h1 class="text-uppercase text-muted">Users</h1>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card mt-2 ">
                         <div class="card-body text-center" s>
                            <div class="container">
                                <img style=" max-width: 125px;" class="img-fluid " src="img/friend.png" alt="user_icon"/>
                            </div>
                            <h1><%= list.size() %></h1>
                            <h1 class="text-uppercase text-muted">Categories</h1>
                        </div>
                    </div>

                </div>
                <div class="col-md-4">
                    <div class="card mt-2" >
                         <div class="card-body text-center" s>
                            <div class="container">
                                <img style=" max-width: 125px;" class="img-fluid rounded-circle" src="img/shipping.png" alt="user_icon"/>
                            </div>
                            <h1><%= m.get("productCount")%></h1>
                            <h1 class="text-uppercase text-muted">Products</h1>

                        </div>
                    </div>

                </div>
            </div>

            <div class="row mt-3">
                <div class="col-md-6">
                    <div class="card mt-2" data-toggle="modal" data-target="#add-category-modal" >
                         <div class="card-body text-center" s>
                            <div class="container">
                                <img style=" max-width: 125px;" class="img-fluid rounded-circle" src="img/plus.png" alt="user_icon"/>
                            </div>
                            <p class="mt-2">Click Here To Add New Category</p>
                            <h1 class="text-uppercase text-muted">Add Category</h1>

                        </div>
                    </div>
                </div>

                <div class="col md-6">
                    <div class="card mt-2 mb-4" data-toggle="modal" data-target="#add-product-modal">
                         <div class="card-body text-center" s>
                            <div class="container">
                                <img style=" max-width: 125px;" class="img-fluid rounded-circle" src="img/add-product.png" alt="user_icon"/>
                            </div>
                            <p class="mt-2">Click Here To Add New Products</p>
                            <h1 class="text-uppercase text-muted">ADD Products</h1>

                        </div>
                    </div>

                </div>
            </div>

        </div>
        <!--add category model-->


        <!-- Modal -->
        <div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header custom-bg text-white">
                        <h5 class="modal-title" id="exampleModalLabel">Fill Category Details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="ProductOperationServlet" method="post" >
                            <input type="hidden" name="operation" value="addcategory">
                            <div class="form-group">
                                <input type="text" class="form-control" name="catTitle" placeholder="Enter Category Title" required/>
                            </div>
                            <div class="form-group">
                                <textarea style="height:300px" class="form-control" name="catDescription" placeholder="Enter Category Description" required></textarea>
                            </div>
                            <div class="container text-center">
                                <button class="btn  btn-outline-success mr-4">Add Category</button>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            </div>
                        </form>
                    </div>

                </div>
            </div>
        </div>

        <!--End Add Category-->
        <!--add Product model-->


        <!-- Modal -->
        <div class="modal fade" id="add-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header custom-bg text-white">
                        <h5 class="modal-title" id="exampleModalLabel">Enter Product Details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="ProductOperationServlet" method="post"enctype="multipart/form-data" >
                            <input type="hidden" name="operation" value="addproduct">
                            <div class="form-group">
                                <input type="text" class="form-control" name="pName" placeholder="Enter  Title Of Product" required/>
                            </div>
                            <div class="form-group">
                                <textarea style="height:150px" class="form-control" name="pDesc" placeholder="Enter Product Description" required></textarea>
                            </div>
                            <div class="form-group">
                                <input type="number" class="form-control" name="pPrice" placeholder="Enter  Price Of  Product" required/>
                            </div>
                            <div class="form-group">
                                <input type="number" class="form-control" name="pDiscount" placeholder="Enter  Product Discount" required/>
                            </div>
                            <div class="form-group">
                                <input type="number" class="form-control" name="pQuantity" placeholder="Enter  Product Quantity" required/>
                            </div>

                           
                                <div class="form-group">
                                <select name="catId" id=""class="form-control">
                                    
                                    <%
                                        
                                    for (Category c : list){
                                        %>
                                        
                                        <option value="<%= c.getCategoryId() %>" > <%= c.getCategoryTitle()   %></option>
                                   <% } %>
                                    
                                   
                                </select>
                            </div>
                            <!--product file-->
                           
                            <div class="input-group mb-3">
                                <input type="file" class="form-control" name="pPic" id="pPic" required/>
<!--                                <label class="input-group-text" for="pPic">Upload</label>-->
                            </div>
                            <div class="container text-center">
                                <button class="btn  btn-outline-success mr-4">Add Product</button>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            </div>
                        </form>
                    </div>

                </div>
            </div>
        </div>
 <%@include file="components/common_modals.jsp" %>
        <!--End Add Product-->
    </body>
</html>
