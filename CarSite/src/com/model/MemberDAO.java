package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MemberDAO {
	
	private Connection conn;
	private PreparedStatement psmt;
	private ResultSet rs;

	private void getConnection() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

			String db_url = "jdbc:oracle:thin:@localhost:1521:xe";
			String db_id = "hr";
			String db_pw = "hr";
			conn = DriverManager.getConnection(db_url, db_id, db_pw);

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	private void close() {

		try {
			if (rs != null)
				rs.close();
			if (psmt != null)
				psmt.close();

			if (conn != null)
				conn.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public int join(MemberDTO dto) {

		int cnt = 0;

		try {
			getConnection();

			String sql = "insert into CAR_MEMBER values(?,?,?,?)";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPw());
			psmt.setString(3, dto.getAddress());
			psmt.setString(4, dto.getTel());

			cnt = psmt.executeUpdate();
			
			if (cnt > 0) {
				System.out.println("회원가입 성공");
			} else {
				System.out.println("회원가입 실패");
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}

	
		public boolean idCheck(String id) {
			
			boolean check = false;
			
			try {
				getConnection();
				
				String sql = "select * from car_member where id =?";
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, id);
				
				rs = psmt.executeQuery();
				
				if(rs.next()) {
					check = true;
				}else {
					check = false;
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close();
			}
			return check;
		}

		public MemberDTO login(MemberDTO dto) {
			
			MemberDTO info = null;

			try {
				getConnection();

				String sql = "select * from CAR_MEMBER where id=? and pw=?";
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, dto.getId());
				psmt.setString(2, dto.getPw());

				rs = psmt.executeQuery();

				if (rs.next()) {
					String login_id = rs.getString(1);
					String login_pw = rs.getString(2);
					String login_address = rs.getString(3);
					String login_tel = rs.getString(4);
					info = new MemberDTO(login_id, login_pw, login_address, login_tel);
				} else {
					System.out.println("로그인 실패!");
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				close();
			}
			return info;
			
		}


}
