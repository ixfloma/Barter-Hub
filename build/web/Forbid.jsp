<%-- 
    Document   : index
    Created on : Oct 7, 2019, 10:38:11 AM
    Author     : pahla
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="css/bootstrap.min.css">
		<link rel="stylesheet" href="css/stylize.css">
		<script src="js/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<title>403 FORBIDDEN</title>
    </head>
	<body>
            
        <header class="header">
            <!--navbar-->
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
                <a class="navbar-brand" href="#">BarterUP</a>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav">
                        <li class="nav-item active disabled">
                            <a class="nav-link" href="UserController?proses=home">Home</a>
                        </li>

                        <%if(session.getAttribute("role") == null){%>
                        <li class="nav-item">
                                <a class="nav-link" href="UserController?proses=login">Login</a>
                        </li>
                        <%} else if(((String)session.getAttribute("role")).equals("user")) {%>
                        <li class="nav-item">
                                <a class="nav-link" href="UserController?proses=logout">Logout</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="UserController?proses=inventory">Inventory</a>
                        </li>
                        <li class="nav-item">
                                <a class="nav-link" href="UserController?proses=user&action=edit">Akunku</a>
                        </li>
                        
                        <% } %>

                    </ul>
                </div>
                
                <form action="UserController" class="form-inline navbar-nav">
                    <input type="hidden" name="proses" value="search">
                    <input class="input form-control mr-sm-2" id="squery" name="squery" placeholder="Search here" aria-label="Search" style="width:500px">                    
                    <button class="btn btn-danger my-2 my-sm-0" type="submit">Search</button>
                </form>

            </nav>
            <!--navbar-->
        </header>

        <section class="section">
            <h1 style="text-align:center; margin: 20%">403 FORBIDDEN</h1>
			
        </section>

        <footer class="footer">
            <p>BarterUP the Online Trade Web Services</p>
        </footer>
	</body>
</html>