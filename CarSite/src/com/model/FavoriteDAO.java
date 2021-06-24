package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.sun.xml.internal.bind.v2.schemagen.xmlschema.List;

public class FavoriteDAO {
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
	   
	   public  ArrayList<carinfoDTO> select_cars(String id) {
		      ArrayList<carinfoDTO> car_list = new ArrayList<carinfoDTO>();
		      getConnection();      
		      try {      
		         String sql = "SELECT * FROM CAR_INFO WHERE car_num in (SELECT car_num FROM CAR_FAVORITE where id=?) ";
		         psmt = conn.prepareStatement(sql);
		         psmt.setString(1, id);
		         
		         rs = psmt.executeQuery();
		         
		         while(rs.next()){
		           car_list.add(new carinfoDTO(rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6)));
		         }
		         
		         
		      }catch (SQLException e) {
		         e.printStackTrace();
		      }finally{
		         close();
		      }
		      return car_list;
		   }
	   public Boolean select_car(String id , String car_num) {
		   System.out.println("Âò°Ë»ö"+id +":"+car_num);
		   Boolean ck = false;
		   getConnection();      
		      try {      
		         String sql = "SELECT * FROM CAR_FAVORITE where id=? AND car_num = ?";
		         psmt = conn.prepareStatement(sql);
		         psmt.setString(1, id);
		         psmt.setString(2, car_num);
		         rs = psmt.executeQuery();
		         
	         if(rs.next()) {
	        	 	System.out.println(rs.getString(1));
	        	 	System.out.println(rs.getString(2));
		        	 ck = true;
		         }
		         
		         
		      }catch (SQLException e) {
		         e.printStackTrace();
		      }finally{
		         close();
		      }
		      System.out.println(ck);
		      return ck;
		   }
	   
	   public  int insert(FavoriteDTO dto) {
		      getConnection();      
		      try {      
		         String sql = "INSERT INTO CAR_FAVORITE VALUES(?,?) ";
		         psmt = conn.prepareStatement(sql);
		         psmt.setString(1, dto.getId());
		         psmt.setString(2, dto.getCar_num());
		         
		         cnt = psmt.executeUpdate();
		         
		         
		         
		      }catch (SQLException e) {
		         e.printStackTrace();
		      }finally{
		         close();
		      }
		      return cnt;
		   }
	   public  int delete(FavoriteDTO dto) {
		      getConnection();      
		      try {      
		         String sql = "DELETE FROM CAR_FAVORITE WHERE id=? AND car_num=? ";
		         psmt = conn.prepareStatement(sql);
		         psmt.setString(1, dto.getId());
		         psmt.setString(2, dto.getCar_num());
		         
		         cnt = psmt.executeUpdate();
		         
		         System.out.println(cnt);
		         
		      }catch (SQLException e) {
		         e.printStackTrace();
		      }finally{
		         close();
		      }
		      return cnt;
		   }
}
