/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.application.model;


/**
 *
 * @author pahla
 */
import java.sql.Connection; 
import java.sql.DriverManager; 
import java.sql.SQLException; 

// This class can be used to initialize the database connection 
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author pahla
 */
public class Koneksi {
    private Connection conn;
    private Statement st;

    public static Connection ambilKoneksi() {
        try {
            String db = "jdbc:mysql://127.0.0.1:3306/barterhub";
            String user = "root";
            String pass = "";
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(db, user, pass);
            return con;
        } catch (Exception x) {
            System.out.println("Terjadi kesalahan ambil koneksi : " + x);
            return null;
        }
    }
    public void koneksi() {
        try {
            String db = "jdbc:mysql://127.0.0.1:3306/barterhub";
            String user = "root";
            String pass = "";
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(db, user, pass);
            st = conn.createStatement();
        } catch (Exception x) {

            System.out.println("Terjadi kesalahan koneksi : " + x);
        }
    }
    public void diskonek(ResultSet rs) {
        try {
            if (rs != null) {
                rs.close();
            }
            st.close();
            conn.close();
        } catch (Exception x) {
            System.out.println("Terjadi kesalahan diskoneksi : " + x);
        }
    }
    public ResultSet ambilData(String sql) {
        ResultSet rs = null;
        try {
            koneksi();
            rs = st.executeQuery(sql);
        } catch (Exception x) {
            System.out.println("Terjadi kesalahan ambil data : " + x);
        }
        return rs;
    }
    public void simpanData(String sql) {
        try {
            koneksi();
            st.executeUpdate(sql);
        } catch (Exception x) {
            System.out.println("Terjadi kesalahan simpan data : " + x);
        }
    }

}