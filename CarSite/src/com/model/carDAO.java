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
    	  
         String sql = "SELECT DISTINCT MODEL FROM CAR_INFO where brand=? ORDER BY MODEL";
         psmt = conn.prepareStatement(sql);
         psmt.setString(1, brand);         
         System.out.println("brand"+brand);
         rs = psmt.executeQuery();
         while(rs.next()){
            String model = rs.getString(1);
            model_list.add(model);
            System.out.println(model+"¸ðµ¨");
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
         String sql = "SELECT DISTINCT D_MODEL FROM car_info where brand=? and model=? ORDER BY D_MODEL";
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
         String sql = "SELECT DISTINCT GRADE FROM car_info where brand=? and model=? and d_model=? ORDER BY GRADE";
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
         String sql = "SELECT DISTINCT YEAR FROM car_info where brand=? and model=? and d_model=? and grade=? ORDER BY YEAR";
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
   

   public  carinfoDTO select_all(carinfoDTO dto) {
	      carinfoDTO infodto = null ;

	      getConnection();      
	      try {      
	         String sql = "SELECT * FROM car_info where brand=? and model=? and d_model=? and grade=? and year=?";
	         psmt = conn.prepareStatement(sql);
	         psmt.setString(1, dto.getBrand());
	         psmt.setString(2, dto.getModel());
	         psmt.setString(3, dto.getD_model());
	         psmt.setString(4, dto.getGrade());
	         psmt.setString(5, dto.getYear());
	         rs = psmt.executeQuery();
	         
	        if(rs.next()){
	        	String num = rs.getString(1);
	            String brand = rs.getString(2);
	            String model = rs.getString(3);
	            String d_model = rs.getString(4);
	            String grade = rs.getString(5);
	            String year = rs.getString(6);
	            String price = rs.getString(7);
	            String fe = rs.getString(8);
	            String cc = rs.getString(9);
	            String output = rs.getString(10);
	            String torque = rs.getString(11);
	            String drivesys = rs.getString(12);
	            String people = rs.getString(13);
	            String wheel = rs.getString(14);
	            String tire = rs.getString(15);
	            String gear = rs.getString(16);
	            String fuel = rs.getString(17);
	            String cartype = rs.getString(18);
	            String url = rs.getString(19);
	            infodto = new carinfoDTO(num, brand, model, d_model, grade, year, price, fe, cc, output, torque, drivesys, people, wheel, tire, gear, fuel, url, cartype);
	            System.out.println("!@#!@$");
	         }
	         
	         
	      }catch (SQLException e) {
	         e.printStackTrace();
	      }finally{
	         close();
	      }
	      return infodto;
	   }
   public  String select_car_num(carinfoDTO dto) {
	      String num = null;
	      getConnection();      
	      try {      
	         String sql = "SELECT car_num FROM car_info where brand=? and model=? and d_model=? and grade=?";
	         psmt = conn.prepareStatement(sql);
	         psmt.setString(1, dto.getBrand());
	         psmt.setString(2, dto.getModel());
	         psmt.setString(3, dto.getD_model());
	         psmt.setString(4, dto.getGrade());
	         rs = psmt.executeQuery();
	         
	        if(rs.next()){
	        	num = rs.getString(1);	            
	         }
	         
	         
	      }catch (SQLException e) {
	         e.printStackTrace();
	      }finally{
	         close();
	      }
	      return num;
	   }
   public carinfoDTO2 select_all2(carinfoDTO2 dto) {
	      carinfoDTO2 infodto = null;
	      getConnection();      
	      try {      
	         String sql = "SELECT * FROM car_info where brand=? and model=? and d_model=? and grade=? and year=?";
	         psmt = conn.prepareStatement(sql);
	         psmt.setString(1, dto.getBrand());
	         psmt.setString(2, dto.getModel());
	         psmt.setString(3, dto.getD_model());
	         psmt.setString(4, dto.getGrade());
	         psmt.setString(5, dto.getYear());
	         
	         rs = psmt.executeQuery();
	         
	         while(rs.next()){
	            String brand = rs.getString(2);
	            String model = rs.getString(3);
	            String d_model = rs.getString(4);
	            String grade = rs.getString(5);
	            String year = rs.getString(6);
	            String price = rs.getString(7);
	            String fe = rs.getString(8);
	            String cc = rs.getString(9);
	            String output = rs.getString(10);
	            String torque = rs.getString(11);
	            String drivesys = rs.getString(12);
	            String people = rs.getString(13);
	            String wheel = rs.getString(14);
	            String tire = rs.getString(15);
	            String gear = rs.getString(16);
	            String fuel = rs.getString(17);
	            String car_type = rs.getString(18);
	            infodto = new carinfoDTO2(brand, model, d_model, grade, year, price, fe, cc, output, torque, drivesys, people, wheel, tire,car_type,gear,fuel);
	           
	         }
	         
	         
	      }catch (SQLException e) {
	         e.printStackTrace();
	      }finally{
	         close();
	      }
	      return infodto;
	   }
   
   public ArrayList<carinfoDTO> select_all3(carinfoDTO dto) {
	      carinfoDTO infodto = null ;
	      ArrayList<carinfoDTO> goods_list = new ArrayList<carinfoDTO>();
	      
	      getConnection();      
	      try {      
	         String sql = "SELECT * FROM car_info2 where brand=? and model=? and d_model=? and grade=? and year=?";
	         psmt = conn.prepareStatement(sql);
	         psmt.setString(1, dto.getBrand());
	         psmt.setString(2, dto.getModel());
	         psmt.setString(3, dto.getD_model());
	         psmt.setString(4, dto.getGrade());
	         psmt.setString(5, dto.getYear());
	         rs = psmt.executeQuery();
	         
	         
	      while(rs.next()){
            String brand = rs.getString(2);
            String model = rs.getString(3);
            String d_model = rs.getString(4);
            String grade = rs.getString(5);
            String year = rs.getString(6);
            String url = rs.getString(7);
            String oldprice = rs.getString(8);
            String site = rs.getString(9);
            infodto = new carinfoDTO(brand, model, d_model, grade, year, url,oldprice,site);
            goods_list.add(infodto);
	         }
	         
	         
	      }catch (SQLException e) {
	         e.printStackTrace();
	      }finally{
	         close();
	      }
	      return goods_list;
	      
	   } 
   
   public carinfoDTO select_carinfo(String car_num) {
	      carinfoDTO infodto = null ;
	      
	      getConnection();      
	      try {      
	         String sql = "SELECT * FROM car_info where car_num=?";
	         psmt = conn.prepareStatement(sql);
	         psmt.setString(1, car_num);

	         rs = psmt.executeQuery();
	         
	         
	      if(rs.next()){
	    	  String brand = rs.getString(2);
	    	  String model = rs.getString(3);
	    	  String d_model = rs.getString(4);
	    	  String grade = rs.getString(5);
	    	  String year = rs.getString(6);
	    	  String url = rs.getNString(19);
	    	  infodto = new carinfoDTO(car_num, brand, model, d_model, grade, year, url);
	         }
	         System.out.println(infodto.getUrl());
	         
	      }catch (SQLException e) {
	         e.printStackTrace();
	      }finally{
	         close();
	      }
	      return infodto;
	   } 
public String select_price(String car_num) {
	   String price = null ;
	      
	      getConnection();      
	      try {      
	         String sql = "SELECT CARPRICE FROM car_info where car_num=?";
	         psmt = conn.prepareStatement(sql);
	         psmt.setString(1, car_num);

	         rs = psmt.executeQuery();
	         
	         
	      if(rs.next()){
	    	   price = rs.getString(1);
	    	  
	         }
	         
	      }catch (SQLException e) {
	         e.printStackTrace();
	      }finally{
	         close();
	      }
	      return price;
	   } 
   
   
}