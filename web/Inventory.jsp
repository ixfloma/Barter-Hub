<%-- 
    Document   : Inventory
    Created on : Nov 6, 2019, 9:13:27 AM
    Author     : pahla
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="java.util.List"%>
<%@page import ="java.util.ArrayList"%>
<%@page import ="com.application.model.*" %>
<% List<SearchModel> hasil = (ArrayList)request.getAttribute("hasil"); %>
<!DOCTYPE html>
<html>
    <head>
        <% if(session.getAttribute("role") == null){ %>
            <meta http-equiv="Refresh" content="0; url=./Login" />
        <% } %>
        <% if(hasil == null){ %>
            <meta http-equiv="Refresh" content="0; url=UserController?proses=inventory" />
        <% } %>
        <link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/stylize.css">
	<script src="js/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
        <title>Inventory</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
                            <a class="nav-link active disabled" href="#">Inventory</a>
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
        <section style="padding:65px">
            <div id="addbutton">
                <a href="UserController?proses=add" class="float">
                        <i class="fa fa-plus my-float"></i>

                </a>
                <div class="label-container">
                    <div class="label-text">Tambah Item Baru</div>
                    <i class="fa fa-play label-arrow"></i>
                </div>
            </div>
                
                <div>
                    <h1 class="bd-title">
                        Inventory
                    </h1>
                </div>
                <table class="table table-hover">
                        <thead class="thead-dark">
                          <tr>
                            <th scope="col">Nomor</th>
                            <th scope="col">Nama Barang</th>
                            <th scope="col">Deskripsi</th>
                            <th scope="col">Status</th>
                            <th scope="col">Opsi</th>
                          </tr>
                        </thead>
                        <tbody>
                            <%  if(hasil == null){ %>
                                    <tr>
                                        <td colspan="4" style="text-align: center">
                                            Data Tidak Ditemukan!
                                        </td> 
                                    </tr> 
                            <%  } else
                                    if(!hasil.isEmpty()){
                                        for(int i = 0; i < hasil.size(); i++){
                                        String id = hasil.get(i).getId();
                                        String namaItem = hasil.get(i).getNamaItem();
                                        String namaPenjual = hasil.get(i).getNamaPenjual();
                                        String lokasiGambar = hasil.get(i).getLokasiGambar();
                                        String deskripsiSingkat = hasil.get(i).getDeskripsiSingkat();
                                        String statusPublish = hasil.get(i).getStatusPublish();
                            %>
                            
                                        <tr>
                                            <th scope="row"><%=(i+1)%></th>
                                            <td><%=namaItem%></td>
                                            <td><%=deskripsiSingkat%></td>
                                            <td><%=statusPublish%></td>
                                            <td>
                                                <div class="btn-group btn-block" role="group">
                                                    <a href="UserController?proses=edit&action=<%=id%>" class="btn btn-success <% if(statusPublish.equals("decline")){%> col-md-4 <%} %>">
                                                        Edit
                                                    </a>
                                                    <a href="UserController?proses=deleteItem&action=<%=id%>" class="btn btn-danger <% if(statusPublish.equals("decline")){%> col-md-4 <%} %>">
                                                        Hapus
                                                    </a>
                                                    <% if(statusPublish.equals("decline")){%>
                                                    <a href="UserController?proses=republish&action=<%=id%>" class="btn btn-warning col-md-4">
                                                        RePublish
                                                    </a>
                                                    <%} %>
                                                    
                                                    
                                                </div>
                                            </td>
                                         </tr>
                          <%            }
                             } else {%>
                                <tr>
                                    <td colspan="4" style="text-align: center">
                                        Data Tidak Ditemukan!
                                    </td>
                                </tr>
                         <% } %>
                          
                        </tbody>
                      </table>
        </section>
        
        <footer>
            <div class="footer">
                <p>BarterUP the Online Trade Web Services</p>
            </div>
        </footer>
                         
                        
                        
        
    </body>
</html>
