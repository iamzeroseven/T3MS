package com.backstage_role.model;

import java.sql.Connection;
//import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
//import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class Backstage_RoleDAO implements Backstage_RoleDAO_interface{
	// 一個應用程式中,針對一個資料庫 ,共用一個DataSource即可
		private static DataSource ds = null;
		static {
			try {
				Context ctx = new InitialContext();
				ds = (DataSource) ctx.lookup("java:comp/env/jdbc/TestDB");
			} catch (NamingException e) {
				e.printStackTrace();
			}
		}
		
		
		private static final String INSERT_STMT = 
				"INSERT INTO Backstage_Role(BR_NO) VALUES (backstage_role_seq.NEXTVAL,?)";
		private static final String GET_ALL_STMT = 
				"SELECT BR_NO,BR_NAME from Backstage_Role order by BR_NO";
		private static final String GET_ONE_STMT = 
				"SELECT BR_NO,BR_NAME FROM Backstage_Role where BS_ACC_NO = ?";
		private static final String DELETE = 
				"DELETE FROM Backstage_Role where BR_NO = ?";
		private static final String UPDATE = 
				"UPDATE Backstage_Role set BR_NAME=? where BR_NO = ?";
		
		@Override
		public void insert(Backstage_RoleVO backstage_RoleVO) {
			Connection con = null;
			PreparedStatement pstmt = null;

			try {

				con = ds.getConnection();
				pstmt = con.prepareStatement(INSERT_STMT);

				pstmt.setString(1, backstage_RoleVO.getBr_name());
//				pstmt.setString(2, backstage_RoleVO.getRole_no());
//				pstmt.setString(3, backstage_RoleVO.getCinema_no());
//				pstmt.setString(4, backstage_RoleVO.getBs_acc_psw());
//				pstmt.setString(5, backstage_RoleVO.getEmail());
//				pstmt.setString(6, backstage_RoleVO.getTel());
//				pstmt.setTimestamp(7, backstage_RoleVO.getLast_online_time());
//				pstmt.setInt(8, backstage_RoleVO.getState());
				
				
				
				pstmt.executeUpdate();

				// Handle any driver errors
			}  catch (SQLException se) {
				throw new RuntimeException("A database error occured. "
						+ se.getMessage());
				// Clean up JDBC resources
			} finally {
				if (pstmt != null) {
					try {
						pstmt.close();
					} catch (SQLException se) {
						se.printStackTrace(System.err);
					}
				}
				if (con != null) {
					try {
						con.close();
					} catch (Exception e) {
						e.printStackTrace(System.err);
					}
				}
			}
			
		}

		@Override
		public void update(Backstage_RoleVO backstage_RoleVO) {
			Connection con = null;
			PreparedStatement pstmt = null;

			try {

				con = ds.getConnection();
				pstmt = con.prepareStatement(INSERT_STMT);

				pstmt.setString(1, backstage_RoleVO.getBr_no());
				pstmt.setString(2, backstage_RoleVO.getBr_name());
//				pstmt.setString(3, backstage_RoleVO.getCinema_no());
//				pstmt.setString(4, backstage_RoleVO.getBs_acc_psw());
//				pstmt.setString(5, backstage_RoleVO.getEmail());
//				pstmt.setString(6, backstage_RoleVO.getTel());
//				pstmt.setTimestamp(7, backstage_RoleVO.getLast_online_time());
//				pstmt.setInt(8, backstage_RoleVO.getState());
//				pstmt.setString(9, backstage_RoleVO.getBs_acc_no());
				
				pstmt.executeUpdate();

				// Handle any driver errors
			} catch (SQLException se) {
				throw new RuntimeException("A database error occured. "
						+ se.getMessage());
				// Clean up JDBC resources
			} finally {
				if (pstmt != null) {
					try {
						pstmt.close();
					} catch (SQLException se) {
						se.printStackTrace(System.err);
					}
				}
				if (con != null) {
					try {
						con.close();
					} catch (Exception e) {
						e.printStackTrace(System.err);
					}
				}
			}

		}
			
		

		@Override
		public void delete(String br_no) {
			Connection con = null;
			PreparedStatement pstmt = null;

			try {

				con = ds.getConnection();
				pstmt = con.prepareStatement(INSERT_STMT);

				pstmt.setString(1, br_no);

				pstmt.executeUpdate();

				// Handle any driver errors
			} catch (SQLException se) {
				throw new RuntimeException("A database error occured. "
						+ se.getMessage());
				// Clean up JDBC resources
			} finally {
				if (pstmt != null) {
					try {
						pstmt.close();
					} catch (SQLException se) {
						se.printStackTrace(System.err);
					}
				}
				if (con != null) {
					try {
						con.close();
					} catch (Exception e) {
						e.printStackTrace(System.err);
					}
				}
			}

		}
		
		@Override
		public Backstage_RoleVO findByPrimaryKey(String br_no) {

			Backstage_RoleVO backstage_RoleVO = null;
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			try {

				con = ds.getConnection();
				pstmt = con.prepareStatement(GET_ONE_STMT);

				pstmt.setString(1, br_no);

				rs = pstmt.executeQuery();

				while (rs.next()) {
					// actVo 也稱為 Domain objects
					backstage_RoleVO = new Backstage_RoleVO();
					backstage_RoleVO.setBr_no(rs.getString("br_no"));
					backstage_RoleVO.setBr_name(rs.getString("br_name"));
//					backstage_RoleVO.setRole_no(rs.getString("role_no"));
//					backstage_RoleVO.setCinema_no(rs.getString("cinema_no"));
//					backstage_RoleVO.setBs_acc_psw(rs.getString("bs_acc_psw"));
//					backstage_RoleVO.setEmail(rs.getString("email"));
//					backstage_RoleVO.setTel(rs.getString("tel"));
//					backstage_RoleVO.setLast_online_time(rs.getTimestamp("last_online_time"));
//					backstage_RoleVO.setState(rs.getInt("state"));
				}

				// Handle any driver errors
			} catch (SQLException se) {
				throw new RuntimeException("A database error occured. "
						+ se.getMessage());
				// Clean up JDBC resources
			} finally {
				if (rs != null) {
					try {
						rs.close();
					} catch (SQLException se) {
						se.printStackTrace(System.err);
					}
				}
				if (pstmt != null) {
					try {
						pstmt.close();
					} catch (SQLException se) {
						se.printStackTrace(System.err);
					}
				}
				if (con != null) {
					try {
						con.close();
					} catch (Exception e) {
						e.printStackTrace(System.err);
					}
				}
			}
			return backstage_RoleVO;
		}

		@Override
		public List<Backstage_RoleVO> getAll() {
			List<Backstage_RoleVO> list = new ArrayList<Backstage_RoleVO>();
			Backstage_RoleVO backstage_RoleVO = null;

			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
	System.out.println("OK");
			try {

				con = ds.getConnection();
				System.out.println("OK");
				pstmt = con.prepareStatement(GET_ALL_STMT);
				System.out.println("OK");
				rs = pstmt.executeQuery();
	System.out.println("OK");
				while (rs.next()) {
					// actVO 也稱為 Domain objects
					backstage_RoleVO = new Backstage_RoleVO();
					backstage_RoleVO.setBr_no(rs.getString("br_no"));
					System.out.println("OK");
					backstage_RoleVO.setBr_name(rs.getString("br_name"));
					System.out.println("OK");
//					backstage_RoleVO.setRole_no(rs.getString("role_no"));
//					System.out.println("OK");
//					backstage_RoleVO.setCinema_no(rs.getString("cinema_no"));
//					System.out.println("OK");
//					backstage_RoleVO.setBs_acc_psw(rs.getString("bs_acc_psw"));
//					System.out.println("OK");
//					backstage_RoleVO.setEmail(rs.getString("email"));
//					System.out.println("OK");
//					backstage_RoleVO.setTel(rs.getString("tel"));
//					System.out.println("OK");
//					backstage_RoleVO.setLast_online_time(rs.getTimestamp("last_online_time"));
//					
//					backstage_RoleVO.setState(rs.getInt("state"));
					list.add(backstage_RoleVO); // Store the row in the list
				}

				// Handle any driver errors
			} catch (SQLException se) {
				throw new RuntimeException("A database error occured. "
						+ se.getMessage());
				// Clean up JDBC resources
			} finally {
				if (rs != null) {
					try {
						rs.close();
					} catch (SQLException se) {
						se.printStackTrace(System.err);
					}
				}
				if (pstmt != null) {
					try {
						pstmt.close();
					} catch (SQLException se) {
						se.printStackTrace(System.err);
					}
				}
				if (con != null) {
					try {
						con.close();
					} catch (Exception e) {
						e.printStackTrace(System.err);
					}
				}
			}
			return list;
		}
			

		

		
}
