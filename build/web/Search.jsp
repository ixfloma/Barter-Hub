<%-- 
    Document   : Search
    Created on : Sep 29, 2019, 8:53:20 PM
    Author     : pahla
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="java.util.List"%>
<%@page import ="java.util.ArrayList"%>
<%@page import ="com.application.model.*" %>
<% List<SearchModel> hasil = (ArrayList)request.getAttribute("hasil"); %>
<% String squery = (String)request.getAttribute("squery"); %>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="css/bootstrap.min.css">
		<link rel="stylesheet" href="css/stylize.css">
		<script src="js/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<title>Search Result: <% if(squery != null) out.print(squery);%></title>
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
                    <input class="input form-control mr-sm-2" id="squery" name="squery" placeholder="Search here" aria-label="Search" style="width:500px" value='<%if(squery != null) out.print(squery);%>'>
                    <button class="btn btn-danger my-2 my-sm-0" type="submit">Search</button>
		</form>
        </nav>
			<!--end of navbar-->
		</header>

		<section class="section">
				<div class="container">
					<div class="row">
						<div class="py-5">
						<div class="container">
											<div class="row hidden-md-up">
												
														<%  if(hasil == null){ %>
                                                                                                                    <h1> Silahkan masukkan input </h1>
                                                                                                                <% } else
                                                                                                                    if(!hasil.isEmpty()){
                                                                                                                        for(int i = 0; i < hasil.size(); i++){
                                                                                                                            String id = hasil.get(i).getId();
                                                                                                                            String namaItem = hasil.get(i).getNamaItem();
                                                                                                                            String namaPenjual = hasil.get(i).getNamaPenjual();
                                                                                                                            String lokasiGambar = hasil.get(i).getLokasiGambar();
                                                                                                                            String deskripsiSingkat = hasil.get(i).getDeskripsiSingkat();
                                                                                                                        
                                                           
														 %>
												   <div class="col-md-4" style="max-width: 100%">
														<div class="card" style="width: 15rem; margin-top:10px; margin-bottom:10px;">
                                                                                                                    <img src="images\<%=lokasiGambar%>" class="card-img-top" alt="...">
                                                                                                                    <div class="card-body">
                                                                                                                        <a href="UserController?proses=detail&kode=<%= id %>" class="card-title"><h5><%=namaItem%></h5></a>
                                                                                                                        <a href="#" class="card-subtitle mb-2"><h6 class="text-muted"><%=namaPenjual%></h6></a>
                                                                                                                        <p class="card-text"><%=deskripsiSingkat%></p>
                                                                                                                    </div>
														</div>
													</div>
															<% }
                                                                                                                                    } else {%>
                                                                                                                                    <h1> Hasil tidak ditemukan </h1>
                                                                                                                                    <% } %>
                                                                                                                                    
													
											</div>
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

