<%-- 
    Document   : Register
    Created on : Oct 7, 2019, 11:41:13 PM
    Author     : pahla
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% String alertjsp=""; %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                        <% if(session.getAttribute("role") != null){ %>
            <meta http-equiv="Refresh" content="0; url=./" />
            <% } %>
        <link rel="stylesheet" href="css/bootstrap.min.css">
		<link rel="stylesheet" href="css/stylize.css">
		<script src="js/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
        <title>Login</title>
    </head>
    <body>
                <header class="header">
            <!--navbar-->
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
                <a class="navbar-brand" href="#">BarterUP</a>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="UserController?proses=home">Home</a>
                        </li>
                        <%if(session.getAttribute("role") == null){%>
                        <li class="nav-item">
                                <a class="nav-link" href="UserController?proses=login">Login</a>
                        </li>
                        <%} else {%>
                        <li class="nav-item">
                                <a class="nav-link" href="UserController?proses=logout">Logout</a>
                        </li>

                        <li class="nav-item">
                                <a class="nav-link" href="UserController?proses=user&action=edit">Akunku</a>
                        </li>
                        
                        <% } %>

                    </ul>
                </div>
                
                <form action="UserController"class="form-inline navbar-nav">
                    <input type="hidden" name="proses" value="search">
                    <<input class="input form-control mr-sm-2" id="squery" name="squery" placeholder="Search here" aria-label="Search" style="width:500px">
                    <button class="btn btn-danger my-2 my-sm-0" type="submit">Search</button>
                </form>

            </nav>
            <!--navbar-->
        </header>

        <section class="section">
            <% if((String)request.getAttribute("alert") != null) alertjsp = (String)request.getAttribute("alert"); %>
            <%=alertjsp %>
            <div class="login-form">
                    <form action="UserController?proses=register" method="post">
                            <h2 class="text-center">Register</h2>       
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Nama" required="required" name="nama">
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="username" required="required" name="username">
                            </div>
                            <div class="form-group">
                                    <input type="email" class="form-control" placeholder="Email" required="required" name="email">
                                </div>
                                <div class="form-group">
                                    <input type="password" class="form-control" placeholder="Password" required="required" name="password">
                                </div>
                            <div class="form-group">
                                <button type="submit" class="btn-login btn-danger btn-block">Register</button>
                            </div>  
                        </form>
                        <p class="text-center"><a href="UserController?proses=login">Have an Account? Login Here</a></p>
                </div>
        </section>

        <footer class="footer">
            <p>BarterUP the Online Trade Web Services</p>
        </footer>
    </body>
</html>
