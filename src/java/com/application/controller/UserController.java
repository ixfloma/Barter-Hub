/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.application.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.application.model.*;
import com.application.app.AeSimpleMD5;
import javax.servlet.http.HttpSession;

/**
 *
 * @author pahla
 */
public class UserController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UserController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UserController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            String proses = request.getParameter("proses");
            String action = request.getParameter("action");
            String kodeid = request.getParameter("kode");
            
            if(proses.equals("login")){
                response.sendRedirect("./Login");
            } else
            if(proses.equals("register")){
                response.sendRedirect("./Register");
            } else
            if(proses.equals("add")){
                request.setAttribute("tipe","Add");
                request.getRequestDispatcher("./Add").forward(request,response);
            } else
            if(proses.equals("edit")){
                int iId = Integer.valueOf(action);
                SearchModel sm = new SearchModel();
                sm = sm.edit(iId);
                request.setAttribute("tipe","Edit");
                request.setAttribute("data",sm);
                request.getRequestDispatcher("./Edit").forward(request,response);
            } else if(proses.equals("deleteItem")){
                int kode = Integer.valueOf(action);
                SearchModel sm = new SearchModel();
                sm.delete(kode);
                response.sendRedirect("UserController?proses=inventory");
            } else
            if(proses.equals("home")){
                response.sendRedirect("./");
            }  else
            if(proses.equals("user")){
                HttpSession session = request.getSession();  
                if(session.getAttribute("user") == null){
                    response.sendRedirect("./Login");
                } else {
                    if(action.equals("edit")){
                        UserModel um = new UserModel();
                        um.setById((String)session.getAttribute("user"));
                        request.setAttribute("nama",um.getNama());
                        request.setAttribute("email",um.getEmail());
                        request.setAttribute("id", um.getId());
                        request.getRequestDispatcher("./Profile").forward(request,response);
                    } else if(action.equals("delete")){
                            UserModel um = new UserModel();
                            String id = (String)session.getAttribute("user");
                            um.setId(id);
                            um.hapus();
                            session.removeAttribute("user");  
                            session.removeAttribute("role");
                            session.invalidate();
                            request.getRequestDispatcher("./").forward(request,response);  
                        }
                }
                
            } else
            if(proses.equals("logout")){
                HttpSession session = request.getSession();         
                if (session.getAttribute("user") != null){
                    session.removeAttribute("user");  
                    session.removeAttribute("role");
                    session.invalidate();                 
                }
            request.getRequestDispatcher("./").forward(request,response);
            
            } else
            if(proses.equals("search")){
                SearchModel sm = new SearchModel();
                sm.setQuery(request.getParameter("squery"));
                String cquery = sm.getQuery();
                request.setAttribute("hasil",sm.hasilCari());
                request.setAttribute("squery",cquery);
                request.getRequestDispatcher("./Search").forward(request,response);
            }  else
            if(proses.equals("inventory")){
                String username;
                HttpSession session = request.getSession(); 
                if(session.getAttribute("user") != null){
                    username = (String)session.getAttribute("user");
                    SearchModel sm = new SearchModel();
                    //sm.setQuery(request.getParameter("squery"));
                    //String cquery = sm.getQuery();
                    request.setAttribute("hasil",sm.hasilInventory(username));
                    //request.setAttribute("squery",cquery);
                    request.getRequestDispatcher("./Inventory").forward(request,response);
                } else {
                    String alert = "<div class='alert alert-warning alert-dismissible fade show' style='max-width:80%; margin-left:10%; margin-right:10%; margin-top:5%' role='alert'>Silahkan Login terlebih dahulu<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button></div>";
                    request.setAttribute(alert,"alert");
                    request.getRequestDispatcher("./Login").forward(request, response);
                }
            } else
            if(proses.equals("admin")){
                HttpSession session = request.getSession(); 
                 String username;
                username = (String)session.getAttribute("role");
                if(username.equals("admin")){
                    
                    SearchModel sm = new SearchModel();
                    //sm.setQuery(request.getParameter("squery"));
                    //String cquery = sm.getQuery();
                    request.setAttribute("hasil",sm.hasilInventoryAdmin());
                    //request.setAttribute("squery",cquery);
                    request.getRequestDispatcher("./Admin").forward(request,response);
                } else {
                    String alert = "<div class='alert alert-warning alert-dismissible fade show' style='max-width:80%; margin-left:10%; margin-right:10%; margin-top:5%' role='alert'>Silahkan Login sebagai terlebih dahulu<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button></div>";
                    request.setAttribute(alert,"alert");
                    request.getRequestDispatcher("./Login").forward(request, response);
                }
            } else
            if(proses.equals("adinv")){
                SearchModel sm = new SearchModel();
                if(action.equals("approve")){
                    sm.approve(Integer.valueOf(kodeid));
                    response.sendRedirect("UserController?proses=admin");
                } else
                if(action.equals("decline")){
                    sm.decline(Integer.valueOf(kodeid));
                    response.sendRedirect("UserController?proses=admin");
                }
                               
            } else
            if(proses.equals("republish")){
                SearchModel sm = new SearchModel();
                sm.republish(Integer.valueOf(action));
                response.sendRedirect("UserController?proses=inventory");
            }else
             if(proses.equals("detail")){
                 SearchModel sm = new SearchModel();
                 sm = sm.edit(Integer.valueOf(kodeid));
                 UserModel um = new UserModel();
                 request.setAttribute("email", um.getGueryEmail(sm.getNamaPenjual()));
                 request.setAttribute("data", sm);
                 request.getRequestDispatcher("./Detail/"+kodeid).forward(request,response);
             }
    }
    

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String alert = "";
        String data = request.getParameter("data");
        String proses = request.getParameter("proses");

         
            if(proses.equals("login")){
                HttpSession session = request.getSession();  
                UserModel um = new UserModel();
                um.setId(request.getParameter("username"));
                //AeSimpleMD5 hash = new AeSimpleMD5();
                um.setPassword(AeSimpleMD5.getHashed(request.getParameter("password")));
                if(validasi(um.getPassword(),um.login())){
                    session.setAttribute("user",um.getId()); 
                    session.setAttribute("role",um.getRole());
                    request.setAttribute("session",session);
                    if(session.getAttribute("role").equals("admin")){
                    response.sendRedirect("UserController?proses=admin");
                    }else{
                        response.sendRedirect("./");    
                    }
                } else {
                    alert = "<div class='alert alert-warning alert-dismissible fade show' style='max-width:80%; margin-left:10%; margin-right:10%; margin-top:5%' role='alert'>Gagal Login! Password Atau Username Salah<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button></div>";
                    request.setAttribute("alert",alert); 
                    request.getRequestDispatcher("./Login").forward(request,response);
                }
            } else
            if(proses.equals("register")){
                UserModel um = new UserModel();
                um.setId(request.getParameter("username"));
                if(!um.cekID(um.getId())){
                    //AeSimpleMD5 hash = new AeSimpleMD5();
                    String password = AeSimpleMD5.getHashed(request.getParameter("password"));
                    um.setPassword(password);
                    um.setEmail(request.getParameter("email"));
                    um.setNama(request.getParameter("nama"));
                    um.simpan();
                    alert = "<div class='alert alert-success alert-dismissible fade show' style='max-width:80%; margin-left:10%; margin-right:10%; margin-top:5%' role='alert'>Sukses Mendaftar! Silahkan Login<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button></div>";
                    request.setAttribute("alert",alert);                    
                } else {
                    alert = "<div class='alert alert-warning alert-dismissible fade show' style='max-width:80%; margin-left:10%; margin-right:10%; margin-top:5%' role='alert'>Gagal Mendaftar! Username Sudah Dipakai<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button></div>";
                    request.setAttribute("alert",alert);
                }
                request.getRequestDispatcher("./Register").forward(request,response);
            } else
            if(proses.equals("user")){
                HttpSession session = request.getSession();  
                if(session.getAttribute("user") == null){
                    alert = "<div class='alert alert-warning alert-dismissible fade show' style='max-width:80%; margin-left:10%; margin-right:10%; margin-top:5%' role='alert'>Anda Harus Login Terlebih Dahulu!<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button></div>";
                    request.setAttribute("alert",alert);
                    request.getRequestDispatcher("./Login").forward(request,response);
                } else{
                    if(data.equals("edit")){
                    UserModel um = new UserModel();
                    String newName = request.getParameter("nama");
                    String newPassword = AeSimpleMD5.getHashed(request.getParameter("passwordnew"));
                    String oldPassword = AeSimpleMD5.getHashed(request.getParameter("passwordold"));
                    String newEmail = request.getParameter("email");
                    String id = request.getParameter("id");
                    um.setById(id);
                    RequestDispatcher rd = null;
                    if(!newName.equals(um.getNama())){
                        um.setNama(newName);
                    }
                    if(!newEmail.equals(um.getEmail())){
                        um.setEmail(newEmail);
                    }
                    if(validasi(oldPassword,um.getPassword())){
                        if(!newPassword.equals(um.getPassword())){
                            um.setPassword(newPassword);
                        }
                        um.update();
                        alert = "<div class='alert alert-success alert-dismissible fade show' style='max-width:80%; margin-left:10%; margin-right:10%;' role='alert'>Sukses Mengedit Data!<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button></div>";
                        request.setAttribute("alert",alert);
                        um.setById((String)session.getAttribute("user"));
                        request.setAttribute("nama",um.getNama());
                        request.setAttribute("email",um.getEmail());
                        request.setAttribute("id", um.getId());
                        request.getRequestDispatcher("./Profile").forward(request,response);
                    } else {
                        alert = "<div class='alert alert-warning alert-dismissible fade show' style='max-width:80%; margin-left:10%; margin-right:10%;' role='alert'>Gagal Mengedit Data! Silahkan isi password lama anda dengan benar<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button></div>";
                        request.setAttribute("alert",alert);
                        um.setById((String)session.getAttribute("user"));
                        request.setAttribute("nama",um.getNama());
                        request.setAttribute("email",um.getEmail());
                        request.setAttribute("id", um.getId());
                        request.getRequestDispatcher("./Profile").forward(request,response);
                    }
                    } 
                }
            } else if(proses.equals("add")){
                HttpSession session = request.getSession();
                SearchModel sm = new SearchModel();
                sm.setNamaItem(request.getParameter("namaItem"));
                sm.setDeskripsiSingkat(request.getParameter("deskripsi"));
                sm.setNamaPenjual((String)session.getAttribute("user"));
                sm.setLokasiGambar("3.jpg");
                //System.println((String)request.getAttribute("namaItem
                sm.simpan();
                response.sendRedirect("UserController?proses=inventory");
            } else if(proses.equals("edit")){
                SearchModel sm = new SearchModel();
                sm.setNamaItem(request.getParameter("namaItem"));
                sm.setDeskripsiSingkat(request.getParameter("deskripsi"));
                sm.update(Integer.valueOf(request.getParameter("kode")));
                response.sendRedirect("UserController?proses=inventory");
            }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
    
    public boolean validasi(String passwordUser, String passwordCurrent){
        return passwordUser.equals(passwordCurrent);
    }

}
