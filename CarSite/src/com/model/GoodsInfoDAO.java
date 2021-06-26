package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class GoodsInfoDAO {
	
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
	   
	   public GoodsInfoDTO select_goods(GoodsInfoDTO gidto) {
		      GoodsInfoDTO dto = null;
		      getConnection();      
		      try {      
		         String sql = "SELECT * FROM GOODS_INFO WHERE goods_num =?";
		         psmt = conn.prepareStatement(sql);
		         psmt.setString(1, gidto.getGoods_num());
		         rs = psmt.executeQuery();
		         
		         
		      while(rs.next()){
		    	  //psmt.setString(1,goods_num);
		    	  String goods_num = rs.getString(1);
		    	  String id = rs.getString(2);
		    	  String car_id = rs.getString(3);
		    	  String smartkey = rs.getString(4);
		    	  String sunroof = rs.getString(5);
		    	  String navi = rs.getString(6);
		    	  String insurance = rs.getString(7);
		    	  dto = new GoodsInfoDTO(goods_num, id, car_id, smartkey, sunroof, navi, insurance);
		        }
		         
		         
		      }catch (SQLException e) {
		         e.printStackTrace();
		      }finally{
		         close();
		      }
		      return gidto;
		   }

	   public GoodsInfoDTO select_goods(String num) {
		      GoodsInfoDTO dto = null;
		      getConnection();      
		      try {      
		         String sql = "SELECT * FROM GOODS_INFO WHERE goods_num =?";
		         psmt = conn.prepareStatement(sql);
		         psmt.setString(1, num);
		         
		         rs = psmt.executeQuery();
		         
		         
		      while(rs.next()){
		    	  
		    	  String goods_num = rs.getString(1);
		    	  String id = rs.getString(2);
		    	  String car_id = rs.getString(3);
		    	  String smartkey = rs.getString(4);
		    	  String sunroof = rs.getString(5);
		    	  String navi = rs.getString(6);
		    	  String insurance = rs.getString(7);
		    	  dto = new GoodsInfoDTO(goods_num, id, car_id, smartkey, sunroof, navi, insurance);
		        }
		         
		      }catch (SQLException e) {
		         e.printStackTrace();
		      }finally{
		         close();
		      }
		      return dto;
		   }
	   
	   
	   
	   
	   public int insertRegis(GoodsInfoDTO dto) {
			int cnt = 0;
			
			getConnection();
			
			try {			
				String sql = "insert into goods_info values((carsq_num.nextval)/2-0.5,?,?,?,?,?,?)";
				psmt = conn.prepareStatement(sql);
				
				psmt.setString(1, dto.getId());
				psmt.setString(2, dto.getCar_id());
				psmt.setString(3, dto.getSmartkey());
				psmt.setString(4, dto.getSunroof());
				psmt.setString(5, dto.getNavi());
				psmt.setString(6, dto.getInsurance());
				
				cnt = psmt.executeUpdate();
			}catch (SQLException e) {
				e.printStackTrace();
				
			}finally {
				close();		
			}
			
			return cnt;
		}
	   
	   
	   
	   
	   

}
