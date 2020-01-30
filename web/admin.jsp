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
        <% if(session.getAttribute("role")== null){ %>
            <meta http-equiv="Refresh" content="0; url=./Login" />
        <% }else
            if(!session.getAttribute("role").equals("admin")){ %>
            <meta http-equiv="Refresh" content="0; url=./Forbid" />
            <% } %>
        <link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/stylize.css">
	<script src="js/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
        <title>Admin Inventory</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <header>
            <!--navbar-->
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark navbar-fixed-top">
                <a class="navbar-brand" href="#">BarterUP</a>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link active disabled" href="#">Manage Inventory</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="UserController?proses=logout">Logout</a>
                        </li>                        
                    </ul>
                </div>
            </nav>
            <!--navbar-->
        </header>
        <section style="padding:65px">
                
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
                            <th scope="col">Nama Penjual</th>
                            <th scope="col">Deskripsi</th>
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
                            %>
                            
                                        <tr>
                                            <th scope="row"><%=(i+1)%></th>
                                            <td><%=namaItem%></td>
                                            <td><%=namaPenjual%></td>
                                            <td><%=deskripsiSingkat%></td>
                                            <td>
                                                <div class="btn-group btn-block" role="group">
                                                    <a href="UserController?proses=adinv&action=approve&kode=<%=id%>" class="btn btn-success">
                                                        Approve
                                                    </a>
                                                    <a href="UserController?proses=adinv&action=decline&kode=<%=id%>" class="btn btn-danger">
                                                        Decline
                                                    </a>
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
