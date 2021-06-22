package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


public class carDAO {

   private Connection conn;
   private PreparedStatement psmt;
   private ResultSet rs;
   private int cnt;
   
   carinfoDTO dto = null;
   
   private void getConnection() {
      try {
         Class.forName("oracle.jdbc.driver.OracleDriver");
         String db_url = "jdbc:oracle:thin:@localhost:1521:xe";
         String db_id = "hr";
         String db_pw = "hr";
         conn = DriverManager.getConnection(db_url, db_id, db_pw);
         
      } catch (ClassNotFoundException e) {
         e.printStackTrace();
      } catch(SQLException e) {
         e.printStackTrace();
      }
   }
   
   private void close() {
      try {
         if(rs != null){
            rs.close();
         }
         if(psmt != null){
            psmt.close();
         }
         if(conn != null){
            conn.close();
         }
      } catch (SQLException e) {
            e.printStackTrace();
         }
   }
   
   
   public  ArrayList<String> selectModel(String brand) {
      ArrayList<String> model_list = new ArrayList<String>();
      getConnection();      
      try {      
         String sql = "SELECT DISTINCT MODEL FROM car_info where brand=? ";
         psmt = conn.prepareStatement(sql);
         psmt.setString(1, brand);         
         
         rs = psmt.executeQuery();
         
         while(rs.next()){
            String model = rs.getString(1);
            model_list.add(model);
            System.out.println(model);
         }
         
         
      }catch (SQLException e) {
         e.printStackTrace();
      }finally{
         close();
      }
      return model_list;
   }
   
   public  ArrayList<String> select_dmodel(String brand, String model) {
      ArrayList<String> d_model_list = new ArrayList<String>();
      getConnection();      
      try {      
         String sql = "SELECT DISTINCT D_MODEL FROM car_info where brand=? and model=? ";
         psmt = conn.prepareStatement(sql);
         psmt.setString(1, brand);
         psmt.setString(2, model);
         
         rs = psmt.executeQuery();
         
         while(rs.next()){
            String d_model = rs.getString(1);
            d_model_list.add(d_model);
         }
         
         
      }catch (SQLException e) {
         e.printStackTrace();
      }finally{
         close();
      }
      return d_model_list;
   }
   
   public  ArrayList<String> select_grade(String brand, String model, String d_model) {
      ArrayList<String> grade_list = new ArrayList<String>();
      getConnection();      
      try {      
         String sql = "SELECT DISTINCT GRADE FROM car_info where brand=? and model=? and d_model=? ";
         psmt = conn.prepareStatement(sql);
         psmt.setString(1, brand);
         psmt.setString(2, model);
         psmt.setString(3, d_model);
         
         rs = psmt.executeQuery();
         
         while(rs.next()){
            String grade = rs.getString(1);
            grade_list.add(grade);
         }
         
         
      }catch (SQLException e) {
         e.printStackTrace();
      }finally{
         close();
      }
      return grade_list;
   }
   public  ArrayList<String> select_year(String brand, String model, String d_model, String grade) {
      ArrayList<String> year_list = new ArrayList<String>();
      getConnection();      
      try {      
         String sql = "SELECT DISTINCT YEAR FROM car_info where brand=? and model=? and d_model=? and grade=? ";
         psmt = conn.prepareStatement(sql);
         psmt.setString(1, brand);
         psmt.setString(2, model);
         psmt.setString(3, d_model);
         psmt.setString(4, grade);
         
         
         rs = psmt.executeQuery();
         
         while(rs.next()){
            String year = rs.getString(1);
            year_list.add(year);
         }
         
         
      }catch (SQLException e) {
         e.printStackTrace();
      }finally{
         close();
      }
      return year_list;
   }
   
}