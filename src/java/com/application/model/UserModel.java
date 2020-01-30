/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.application.model;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpSession;

/**
 *
 * @author pahla
 */
public class UserModel {
    String id, nama, email, password, role;
    Koneksi db = null;

    public UserModel() {
        db = new Koneksi();
    }
    
    public String getRole(){
        return role;
    }
    
    public void setRole(String role){
        this.role = role;
    }
    
    public String getId() {
        return id;
    }
    public void setId(String id) {
        this.id = id;
    }
    public String getNama() {
        return nama;
    }
    public void setNama(String nama) {
        this.nama = nama;
    }
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    
    public String getPassword(){
        return password;
    }
    
    public void setPassword(String password){
        this.password = password;
    }
    
    public void setById(String id){
        String sql = "SELECT * FROM tb_user WHERE id='"+id+"'";
        ResultSet rs = null;
        
        try{
            rs = db.ambilData(sql);
            while(rs.next()){
                this.setId(rs.getString("id"));
                this.setEmail(rs.getString("email"));
                this.setNama(rs.getString("nama"));
                this.setPassword(rs.getString("password"));
            }
        } catch (Exception e){
            
        }
    }
   
  
    public void simpan() { //daftar
        String sql = "INSERT INTO tb_user values('" + id + "','" + password + "','" + email + "','" + nama + "','user')";
        db.simpanData(sql);
    }
    
    public String getGueryEmail(String emailP){
         ResultSet rs = null;
        String emailu = "";
        
        try{
            String sql = "SELECT * FROM tb_user WHERE id='"+ emailP +"'";
            rs = db.ambilData(sql);
            
            while(rs.next()){
                emailu = (rs.getString("email"));
                this.role = rs.getString("role");
            }
        } catch(Exception e){
               System.out.println(e);
        }
        
        return emailu;
    }
    
    public String login(){
        ResultSet rs = null;
        String passwordu = "";
        
        try{
            String sql = "SELECT * FROM tb_user WHERE id='"+ id +"'";
            rs = db.ambilData(sql);
            
            while(rs.next()){
                passwordu = (rs.getString("password"));
                this.role = rs.getString("role");
            }
        } catch(Exception e){
               System.out.println(e);
        }
        
        return passwordu;
    }
    
    
    
    public void update() {
    String sql = "UPDATE tb_user SET nama='" + nama + "',email='" + email +"',password='" + password + "' WHERE id='" + id + "'";
    db.simpanData(sql);
    }

    public boolean cekID(String id){
        ResultSet rs = null;
        try{
            String sql = "SELECT * FROM tb_user WHERE ID='" + id + "'";
            rs.next();
            return true;
        } catch (Exception e){
            System.out.println(e);
            return false;
        }
    }
/* public List cariID() {
    List<UserModel> data = new ArrayList<UserModel>();
    ResultSet rs = null;

    try {
        String sql = "SELECT * FROM tb_user WHERE ID='" + id + "'";
        rs = db.ambilData(sql);
        while (rs.next()) {
            UserModel m = new UserModel();
            m.setId(rs.getString("id"));
            m.setNama(rs.getString("nama"));
            m.setEmail(rs.getString("email"));
            data.add(m);

        }
        db.diskonek(rs);
    } catch (Exception ex) {
        System.out.println("Terjadi Kesalah Saat menampilkan Cari ID" + ex);
    }
    return data;

    } */
    
    public void hapus() { //hapus akun
    String sql = "DELETE FROM tb_user WHERE ID='" + id + "'";
    db.simpanData(sql);
    } 
}
