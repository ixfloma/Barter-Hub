<%-- 
    Document   : EditAdd
    Created on : Dec 8, 2019, 5:04:09 AM
    Author     : pahla
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.application.model.SearchModel"%>
<%String saklar = (String)request.getAttribute("tipe"); %>

<!DOCTYPE html>
<html>
    <head>
        <% if(session.getAttribute("role") == null){ %>
            <meta http-equiv="Refresh" content="0; url=./Login" />
        <% } %>
        <% if(saklar == null){ saklar = "error";%>
            
            <meta http-equiv="Refresh" content="0; url=UserController?proses=inventory" />
        <% } %>
        <link rel="stylesheet" href="css/bootstrap.min.css">
		<link rel="stylesheet" href="css/stylize.css">
		<script src="js/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
        <script src="js/main.js"></script>
        <title>Home</title>
    </head>

    <body>
        <header>
            <!-- navbar -->
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
                    <a class="navbar-brand" href="#">BarterUP</a>
                    <div class="collapse navbar-collapse" id="navbarNav">
                        <ul class="navbar-nav">
                            <li class="nav-item active disabled">
                                <a class="nav-link" href="UserController?proses=home">Home</a>
                            </li>
                        </ul>
                    </div>
                    
                    <form action="UserController" class="form-inline navbar-nav">
                        <input type="hidden" name="proses" value="search">
                        <input class="input form-control mr-sm-2" id="squery" name="squery" placeholder="Search here" aria-label="Search" style="width:500px">                    
                        <button class="btn btn-danger my-2 my-sm-0" type="submit">Search</button>
                    </form>
    
                </nav>
            <!-- end of navbar-->
        </header>

        <section style="padding:65px">
            <div>
                <h1 class="bd-title">
                    Inventory > <%=(String)request.getAttribute("tipe")%> Item
                </h1>
            </div>
                    <%
                switch(saklar){
                case "Edit":%>
                <% SearchModel sm = (SearchModel)request.getAttribute("data"); %>
                <form action="UserController?proses=<%=((String)request.getAttribute("tipe")).toLowerCase()%>" method="POST">
                <div class="row">
                        <div class="form-group-row col-md-8">
                                <div class="row">
                                        <label for="namaItem" class="col-sm-2 col-form-label">Nama Item</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control margin-bawah" name="namaItem" id="namaItem" placeholder="Masukkan Nama Item Anda" value="<%=sm.getNamaItem()%>">
                                        </div>
                                        <label for="deskripsi" class="col-sm-2 col-form-label">Deskripsi</label>
                                        <div class="col-sm-10">
                                            <textarea class="form-control margin-bawah" name="deskripsi" id="deskripsi" rows="5" placeholder="Masukkan Deskripsi Barang Anda"><%=sm.getDeskripsiSingkat()%></textarea>
                                        </div>
                                        <input type="hidden" name="kode" value="<%=sm.getId()%>">
                                        <div class="col-md-4"></div>
                                        <div class="col-md-8 margin-bawah">
                                                <div class="btn-group btn-block" role="group">
                                                        <button type="reset" value="Reset" class="btn btn-danger">
                                                        Batal
                                                        </button>
                                                        <button type="submit" value="Submit" class="btn btn-success">
                                                        Simpan
                                                        </button>
                                                </div>
                                        </div>
                                </div>
                            </div>
                            <div class="form-group-row col-md-4">
                                    <div class="custom-file">
                                            <input type="file" name="img[]" class="file" accept="image/*">
                                            <div class="input-group margin-bawah">
                                              <input type="text" class="form-control" disabled placeholder="Unggah Foto Barang" id="file">
                                              <div class="input-group-append">
                                                <button type="button" class="browse btn btn-primary">Browse...</button>
                                              </div>
                                            </div>
                                    </div>
                                    <div class="text-center" style="margin-top:20px;">
                                            <img src="https://placehold.it/300x300" id="preview" class="rounded">
                                    </div>
            
                            </div>
                </div>

            </form>
                    <%break;
                case "Add" :%>
                <form action="UserController?proses=<%=((String)request.getAttribute("tipe")).toLowerCase()%>" method="POST">
                <div class="row">
                        <div class="form-group-row col-md-8">
                                <div class="row">
                                        <label for="namaItem" class="col-sm-2 col-form-label">Nama Item</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control margin-bawah" name="namaItem" id="namaItem" placeholder="Masukkan Nama Item Anda">
                                        </div>
                                        <label for="deskripsi" name="deskripsi" class="col-sm-2 col-form-label">Deskripsi</label>
                                        <div class="col-sm-10">
                                            <textarea class="form-control margin-bawah" id="deskripsi" name="deskripsi" rows="5" placeholder="Masukkan Deskripsi Barang Anda"></textarea>
                                        </div>
                                        <div class="col-md-4"></div>
                                        <div class="col-md-8 margin-bawah">
                                                <div class="btn-group btn-block" role="group">
                                                        <button type="reset" value="Reset" class="btn btn-danger">
                                                        Batal
                                                        </button>
                                                        <button type="submit" value="Submit" class="btn btn-success">
                                                        Simpan
                                                        </button>
                                                </div>
                                        </div>
                                </div>
                            </div>
                            <div class="form-group-row col-md-4">
                                    <div class="custom-file">
                                            <input type="file" name="img[]" class="file" accept="image/*">
                                            <div class="input-group margin-bawah">
                                              <input type="text" class="form-control" disabled placeholder="Unggah Foto Barang" id="file">
                                              <div class="input-group-append">
                                                <button type="button" class="browse btn btn-primary">Browse...</button>
                                              </div>
                                            </div>
                                    </div>
                                    <div class="text-center" style="margin-top:20px;">
                                            <img src="https://placehold.it/300x300" id="preview" class="rounded">
                                    </div>
            
                            </div>
                </div>

            </form>
                    <%break;
                case "error":%>
                <h1> Error </h1>
                <%
                    break;
            }%>
            
        </section>


    </body>
</html>
