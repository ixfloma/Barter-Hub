/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.application.model;

import java.util.List;
import static org.junit.Assert.*;  
import org.junit.Test;
import static org.hamcrest.CoreMatchers.*;

/**
 *
 * @author pahla
 */
public class SearchModelTest {
    SearchModel sm;
    Koneksi db = null;
    public SearchModelTest(){
        db = new Koneksi();
        sm = new SearchModel();
        sm.setQuery("o");
    }
    
    @Test
    public void hasilCari(){
        List<SearchModel> rs;
        rs = sm.hasilCari();
        assertThat(sm.getQuery(),is(notNullValue()));
        assertThat(rs,hasItem(isA(SearchModel.class)));
        
        //fail("Proses gagal");
    }
    
    @Test
    public void hasilCariGagal(){
        sm.setQuery("qwibdqwkdqw");
        List<SearchModel> rs;
        rs = sm.hasilCari();
        assertThat(sm.getQuery(),is(notNullValue()));
        assertTrue(rs.isEmpty());
    }
    
    
    
    
}
