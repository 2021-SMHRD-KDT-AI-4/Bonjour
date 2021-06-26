package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class FavoriteGoodsDAO {
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
	   
	   //수정
	   public  ArrayList<JoinDTO> select_goods(String id) {
		      ArrayList<JoinDTO> join_list = new ArrayList<JoinDTO>();
		      JoinDTO joinDTO = null;
		      getConnection();      
		      try {      
		    	  
		         String sql = "SELECT * FROM(SELECT car_num,brand,model,d_model,grade FROM CAR_INFO WHERE car_num in(SELECT car_num FROM CAR_GOODS WHERE goods_num in(SELECT goods_num FROM GOODS_FAVORITE where id=?))) T1 INNER JOIN (SELECT * FROM CAR_GOODS WHERE goods_num in(SELECT goods_num FROM GOODS_FAVORITE where id=?)) T2 ON (T1.car_num = T2.car_num)";
		         psmt = conn.prepareStatement(sql);
		         psmt.setString(1, id);
		         psmt.setString(2, id);
		         
		         rs = psmt.executeQuery();
		         
		         while(rs.next()){
		        	 String num = rs.getString(1);
			            String brand = rs.getString(2);
			            String model = rs.getString(3);
			            String d_model = rs.getString(4);
			            String grade = rs.getString(5);	          
			            String goods_num = rs.getString(6);
			            String year = rs.getString(8);
			            String km = rs.getString(9);
			            String price = rs.getString(10);
			            String fuel = rs.getString(11);
			            String site = rs.getString(12);
			            String url = rs.getString(13);
			            joinDTO = new JoinDTO(num, brand, model, d_model, grade, goods_num, year, km, price, fuel, site, url);
			            join_list.add(joinDTO);
		         }
		         
		         
		      }catch (SQLException e) {
		         e.printStackTrace();
		      }finally{
		         close();
		      }
		      return join_list;
		   }
	   public Boolean select_good(String id , String goods_num) {
		   System.out.println("매물찜검색"+id +":"+goods_num);
		   Boolean ck = false;
		   getConnection();      
		      try {      
		         String sql = "SELECT * FROM GOODS_FAVORITE where id=? AND goods_num = ?";
		         psmt = conn.prepareStatement(sql);
		         psmt.setString(1, id);
		         psmt.setString(2, goods_num);
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
	   
	   public  int insert(FavoriteGoodsDTO dto) {
		      getConnection();      
		      try {      
		         String sql = "INSERT INTO GOODS_FAVORITE VALUES(?,?) ";
		         psmt = conn.prepareStatement(sql);
		         psmt.setString(1, dto.getId());
		         psmt.setInt(2, dto.getGoods_num());
		         
		         cnt = psmt.executeUpdate();
		         
		         
		         
		      }catch (SQLException e) {
		         e.printStackTrace();
		      }finally{
		         close();
		      }
		      return cnt;
		   }
	   public  int delete(FavoriteGoodsDTO dto) {
		      getConnection();      
		      try {      
		         String sql = "DELETE FROM GOODS_FAVORITE WHERE id=? AND goods_num=? ";
		         psmt = conn.prepareStatement(sql);
		         psmt.setString(1, dto.getId());
		         psmt.setInt(2, dto.getGoods_num());
		         
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
