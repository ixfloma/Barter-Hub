/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.application.model;

import java.sql.ResultSet;
import java.util.List;
import java.util.ArrayList;

/**
 *
 * @author pahla
 */
public class SearchModel {
    String query;
    private String namaItem;
    private String namaPenjual;
    private String lokasiGambar;
    private String deskripsiSingkat;
    private String id;
    private String statusPublish;
    private Koneksi db = null;
    
    public SearchModel(){
        db = new Koneksi();
    }

    public void setStatusPublish(String statusPublish){
        this.statusPublish = statusPublish;
    }

    public String getStatusPublish(){
        return statusPublish;
    }
    
    public void setQuery(String query){
        this.query = query;
    }
    
    public String getQuery(){
        return query;
    }

    /**
     * @return the namaItem
     */
    public String getNamaItem() {
        return namaItem;
    }

    /**
     * @param namaItem the namaItem to set
     */
    public void setNamaItem(String namaItem) {
        this.namaItem = namaItem;
    }

    /**
     * @return the namaPenjual
     */
    public String getNamaPenjual() {
        return namaPenjual;
    }

    /**
     * @param namaPenjual the namaPenjual to set
     */
    public void setNamaPenjual(String namaPenjual) {
        this.namaPenjual = namaPenjual;
    }

    /**
     * @return the lokasiGambar
     */
    public String getLokasiGambar() {
        return lokasiGambar;
    }

    /**
     * @param lokasiGambar the lokasiGambar to set
     */
    public void setLokasiGambar(String lokasiGambar) {
        this.lokasiGambar = lokasiGambar;
    }

    /**
     * @return the deskripsiSingkat
     */
    public String getDeskripsiSingkat() {
        return deskripsiSingkat;
    }

    /**
     * @param deskripsiSingkat the deskripsiSingkat to set
     */
    public void setDeskripsiSingkat(String deskripsiSingkat) {
        this.deskripsiSingkat = deskripsiSingkat;
    }

    /**
     * @return the id
     */
    public String getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(String id) {
        this.id = id;
    }
      
    public List hasilCari(){
        List<SearchModel> hasil = new ArrayList<SearchModel>();
        ResultSet rs = null;
        
        try{
            String sql = "SELECT * FROM listItem WHERE namaItem LIKE '%"+query+"%' AND statusPublish='approve'";
            rs = db.ambilData(sql);
            while(rs.next()){
                SearchModel sm = new SearchModel();
                sm.setId(Integer.toString(rs.getInt("id")));
                sm.setNamaItem(rs.getString("namaItem"));
                sm.setNamaPenjual(rs.getString("namaPenjual"));
                sm.setLokasiGambar(rs.getString("lokasiGambar"));
                sm.setDeskripsiSingkat(rs.getString("deskripsiSingkat"));
                hasil.add(sm);
            }
            db.diskonek(rs);
        } catch(Exception e){
            System.out.println("Terjadi Kesalahan" + e);
        }
        
        return hasil;
    }
    
    public SearchModel edit(int kode){
        SearchModel sm = new SearchModel();
        String sql = "SELECT * FROM listItem WHERE id="+kode;
        ResultSet rs = null;
        try{
            rs = db.ambilData(sql);
            while(rs.next()){
                sm.setId(Integer.toString(rs.getInt("id")));
                sm.setNamaItem(rs.getString("namaItem"));
                sm.setNamaPenjual(rs.getString("namaPenjual"));
                sm.setLokasiGambar(rs.getString("lokasiGambar"));
                sm.setDeskripsiSingkat(rs.getString("deskripsiSingkat"));
            }
        } catch(Exception e){
            System.out.println("Terjadi Kesalahan");
        }
        return sm;
    }
    
    public List hasilInventory(String username){
        List<SearchModel> hasil = new ArrayList<SearchModel>();
        ResultSet rs = null;
        
        try{
            String sql = "SELECT * FROM listItem WHERE namaPenjual= '"+username+"'";
            rs = db.ambilData(sql);
            while(rs.next()){
                SearchModel sm = new SearchModel();
                sm.setId(Integer.toString(rs.getInt("id")));
                sm.setNamaItem(rs.getString("namaItem"));
                sm.setNamaPenjual(rs.getString("namaPenjual"));
                sm.setLokasiGambar(rs.getString("lokasiGambar"));
                sm.setDeskripsiSingkat(rs.getString("deskripsiSingkat"));
                sm.setStatusPublish(rs.getString("statusPublish"));
                hasil.add(sm);
            }
            db.diskonek(rs);
        } catch(Exception e){
            System.out.println("Terjadi Kesalahan" + e);
        }
        return hasil;
    }

    public List hasilInventoryAdmin(){
        List<SearchModel> hasil = new ArrayList<>();
        ResultSet rs = null;

        try{
            String sql = "select * from listItem where statusPublish='waiting'";
            rs = db.ambilData(sql);
            while(rs.next()){
                SearchModel sm = new SearchModel();
                sm.setId(Integer.toString(rs.getInt("id")));
                sm.setNamaItem(rs.getString("namaItem"));
                sm.setNamaPenjual(rs.getString("namaPenjual"));
                sm.setLokasiGambar(rs.getString("lokasiGambar"));
                sm.setDeskripsiSingkat(rs.getString("deskripsiSingkat"));
                sm.setStatusPublish(rs.getString("statusPublish"));
                hasil.add(sm);
            }
            db.diskonek(rs);
        } catch(Exception e){
            System.out.println("Terjadi Kesalahan" + e);
        }
        return hasil;

    }
    
    public void simpan() {
        String sql = "INSERT INTO listItem(namaItem,namaPenjual,lokasiGambar,deskripsiSingkat,statusPublish) values('"+namaItem+ "','" + namaPenjual + "','" + lokasiGambar + "','" + deskripsiSingkat + "','waiting')";
        db.simpanData(sql);
    }
    
    public void update(int kode){
        String sql = "UPDATE listItem SET namaItem='"+namaItem+"',deskripsiSingkat='"+deskripsiSingkat+"' WHERE id="+kode;
        db.simpanData(sql);
    }
    
    public void republish(int kode){
        String sql = "UPDATE listItem SET statusPublish='waiting' WHERE id="+kode;
        db.simpanData(sql);
    }
    
    public void delete(int kode){
        String sql = "DELETE FROM listItem WHERE ID="+kode;
        db.simpanData(sql);
    }

    public void approve(int kode){
        String sql = "UPDATE listItem SET statusPublish='approve' where id="+kode;
        db.simpanData(sql);
    }

    public void decline(int kode){
        String sql = "UPDATE listItem SET statusPublish='decline' where id="+kode;
        db.simpanData(sql);
    }
    
}
