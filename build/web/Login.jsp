<%-- 
    Document   : Login
    Created on : Oct 7, 2019, 2:19:30 AM
    Author     : pahla
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% String alertjsp = ""; %>
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

                        <li class="nav-item active disabled">
                                <a class="nav-link" href="#">Login</a>
                        </li>

                    </ul>
                </div>
                
                <form action="UserController" class="form-inline navbar-nav">
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
                    <form action="UserController?proses=login" method="post">
                            <h2 class="text-center">Log in</h2>       
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Username" required="required" name="username">
                            </div>
                            <div class="form-group">
                                <input type="password" class="form-control" placeholder="Password" required="required" name="password">
                            </div>
                            <div class="form-group">
                                <button type="submit" class="btn-login btn-danger btn-block">Log In</button>                                
                            </div>  
                    </form>
                    <p class="text-center"><a href="UserController?proses=register">Create an Account</a></p>
            </div>
        </section>

        <footer class="footer">
            <p>BarterUP the Online Trade Web Services</p>
        </footer>
    </body>
</html>
