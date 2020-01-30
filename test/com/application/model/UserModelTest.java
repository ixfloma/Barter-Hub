/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.application.model;

import static org.junit.Assert.*;  
import org.junit.Test;
import static org.hamcrest.CoreMatchers.*;
import com.application.app.AeSimpleMD5;
import java.io.IOException;
/**
 *
 * @author pahla
 */
public class UserModelTest {
    String password = "password";
    String hash;
    UserModel um;
    Koneksi db = null;
    
    public UserModelTest(){
        um = new UserModel();
        db = new Koneksi();
        um.setId("longiflorum");
    }
    
    @Test
    public void loginTest() throws IOException{
        hash = AeSimpleMD5.getHashed(password);
        assertEquals(hash,um.login());
    }
}
