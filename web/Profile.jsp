<%-- 
    Document   : Profile
    Created on : Oct 7, 2019, 8:11:46 PM
    Author     : pahla
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% String alertjsp = ""; %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <% if(session.getAttribute("role") == null){ %>
            <meta http-equiv="Refresh" content="0; url=./Login" />
        <% } %>
        <% if((String)request.getAttribute("nama") == null){ %>
            <meta http-equiv="Refresh" content="0; url=./UserController?proses=user&action=edit" />
        <% } %>
        <link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/stylize.css">
        <script src="js/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <title><%=(String)request.getAttribute("nama") %>'s profile</title>
    </head>
    <body>
        <header>
            <!--navbar-->
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark navbar-fixed-top">
                <a class="navbar-brand" href="#">BarterUP</a>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="UserController?proses=home">Home</a>
                        </li>
                        <% if(session.getAttribute("role") == null){ %>
                        <li class="nav-item">
                                <a class="nav-link" href="UserController?proses=login">Login</a>
                        </li>
                        <%} else {%>
                        <li class="nav-item">
                                <a class="nav-link" href="UserController?proses=logout">Logout</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="UserController?proses=inventory">Inventory</a>
                        </li>
                        
                        <li class="nav-item">
                                <a class="nav-link disabled active" href="#">Akunku</a>
                        </li>

                        <% } %>
                        
                    </ul>
                </div>
                
                <form action="UserController" class="form-inline navbar-nav">
                    <input type="hidden" name="proses" value="search">
                    <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" style="width:500px">
                    <button class="btn btn-danger my-2 my-sm-0" type="submit">Search</button>
                </form>

            </nav>
            <!--navbar-->
        </header>

        <section style="margin-top:30px">
            <% if((String)request.getAttribute("alert") != null) alertjsp = (String)request.getAttribute("alert"); %>
            <%=alertjsp %>
<div class="container">
    <div class="row my-2">
        <div class="col-lg-8 order-lg-2">
            <ul class="nav nav-tabs">
                <li class="nav-item">
                    <a href="" data-target="#profile" data-toggle="tab" class="nav-link active">Profile</a>
                </li>
                <li class="nav-item">
                    <a href="" data-target="#edit" data-toggle="tab" class="nav-link">Edit</a>
                </li>
            </ul>
            <div class="tab-content py-4">
                <div class="tab-pane active" id="profile">
                    <h5 class="mb-3">User Profile</h5>
                    <div class="row">
                        <div class="col-md-6">
                            <h6><b>Name</b></h6>
                                <%=(String)request.getAttribute("nama") %>
                                        
                                <h6><b>Email Address</b></h6>
                                <%=(String)request.getAttribute("email") %>
                                        
                                <h6><b>Your BarterUp ID</b></h6>
                                <%=(String)request.getAttribute("id") %>
                        </div>
                        
                    </div>
                    <!--/row-->
                </div>

                <div class="tab-pane" id="edit">
                    <form role="form" action="UserController?proses=user&data=edit" method="post">
                                    <div class="form-group row">
                            <label class="col-lg-3 col-form-label form-control-label">ID</label>
                                        <div class="col-lg-9">
                                            <input class="form-control" type="text" value='<%=(String)request.getAttribute("id") %>' name="id" readonly>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-lg-3 col-form-label form-control-label">Nama</label>
                                        <div class="col-lg-9">
                                            <input class="form-control" type="text" value='<%=(String)request.getAttribute("nama") %>' name="nama" required>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-lg-3 col-form-label form-control-label">Email</label>
                                        <div class="col-lg-9">
                                            <input class="form-control" type="email" value='<%=(String)request.getAttribute("email") %>' name="email" required>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-lg-3 col-form-label form-control-label">New Password</label>
                                        <div class="col-lg-9">
                                            <input class="form-control" type="password" value="" placeholder="type new password here" name="passwordnew">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-lg-3 col-form-label form-control-label">Current Password</label>
                                        <div class="col-lg-9">
                                            <input class="form-control" type="password" value="" placeholder="type your current password" name="passwordold" required>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-lg-3 col-form-label form-control-label"></label>
                                        <div class="col-lg-9">
                                            <input type="reset" class="btn btn-secondary" value="Cancel">
                                            <input type="submit" class="btn btn-danger" value="Save Changes">                                            
                                        </div>
                                    </div>
                                        <div class="form-group row">
                                            <label class="col-lg-3 col-form-label form-control-label"></label>
                                            <div class="col-lg-9">
                                                <a class="btn btn-primary" style="color:white" href="UserController?proses=user&action=delete"> Delete this account. </a>
                                                
                                            </div>
                                            
                                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="col-lg-4 order-lg-1 text-center">
            <img src="images/noImage.png" class="mx-auto img-fluid img-circle d-block" style="max-height: 150px; max-height: 150px" alt="avatar">
            <h6 class="mt-2">Upload a different photo</h6>
            <label class="custom-file">
                <input type="file" id="file" class="custom-file-input">
                <span class="custom-file-control">Choose file</span>
            </label>
        </div>
    </div>
        </div>
        </section>

        <footer>
            <div class="footer">
                <p>BarterUP the Online Trade Web Services</p>
            </div>
        </footer>
        
    </body>
</html>
