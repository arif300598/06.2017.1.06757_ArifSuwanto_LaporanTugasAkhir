/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package view;

import java.sql.Connection;
import java.sql.DriverManager;
import javax.swing.JOptionPane;


/**
 *
 * @author IT
 */
public class Koneksi {
    public static Connection koneksiDB() {
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection koneksi = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","arif_06757", "arif");
            return koneksi;
        }catch (Exception e) {
            JOptionPane.showMessageDialog(null, e);
            return null;
        }
    }
}