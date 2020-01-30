
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.application.model.SearchModel"%>
<% String alertjsp = ""; %>
<% SearchModel sm = (SearchModel)request.getAttribute("data"); %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <% if(sm == null){
        sm = new SearchModel();
        sm.setDeskripsiSingkat("");
        sm.setLokasiGambar("");
        sm.setNamaPenjual("");
        
        %>
            <meta http-equiv="Refresh" content="0; url=./Search" />
        <% } %>
        <link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/stylize.css">
        <script src="js/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <title>Detail</title>
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
                    <a href="" data-target="#profile" data-toggle="tab" class="nav-link active">Detail</a>
                </li>
            </ul>
            <div class="tab-content py-4">
                <div class="tab-pane active" id="profile">
                    <div class="form-group row">
                            <label class="col-lg-3 col-form-label form-control-label">Nama Barang</label>
                                        <div class="col-lg-9">
                                            <input class="form-control-plaintext" type="text" value='<%=sm.getNamaItem() %>' name="id" readonly>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-lg-3 col-form-label form-control-label">Deskripsi</label>
                                        <div class="col-lg-9">
                                            <input class="form-control-plaintext" readonly="" type="text" value='<%=sm.getDeskripsiSingkat() %>' name="nama" required>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-lg-3 col-form-label form-control-label">Nama Penjual</label>
                                        <div class="col-lg-9">
                                            <input class="form-control-plaintext" readonly="" type="text" value='<%=sm.getNamaPenjual() %>' name="email" required>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-lg-3 col-form-label form-control-label">Email Penjual</label>
                                        <div class="col-lg-9">
                                            <input class="form-control-plaintext" readonly="" type="email" value='<%= request.getAttribute("email")%>' name="email" required>
                                        </div>
                                    </div>
                    <!--/row-->
                </div>
            </div>
        </div>
        <div class="col-lg-4 order-lg-1 text-center">
            <img src="images\<%=sm.getLokasiGambar()%>" class="mx-auto img-fluid img-circle d-block" style="height: 400px; width : auto;" alt="avatar">
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