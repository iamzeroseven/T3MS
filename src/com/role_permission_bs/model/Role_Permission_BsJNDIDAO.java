package com.role_permission_bs.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;



public class Role_Permission_BsJNDIDAO implements Role_Permission_BsDAO_interface{
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
			"INSERT INTO ROLE_PERMISSION_BACKSTAGE(PERMISSION_NO,ROLE_NO) VALUES (role_permission_seq.NEXTVAL,?)";
	private static final String GET_ALL_STMT = 
			"SELECT PERMISSION_NO,ROLE_NO FROM ROLE_PERMISSION_BACKSTAGE order by PERMISSION_NO";
	private static final String GET_ONE_STMT = 
			"SELECT PERMISSION_NO,ROLE_NO FROM ROLE_PERMISSION_BACKSTAGE where PERMISSION_NO = ?";
	private static final String DELETE = 
			"DELETE FROM ROLE_PERMISSION_BACKSTAGE where PERMISSION_NO = ?";
	private static final String UPDATE = 
			"UPDATE ROLE_PERMISSION_BACKSTAGE set ROLE_NO=? where PERMISSION_NO = ?";
	
	@Override
	public void insert(Role_Permission_BsVO role_Permission_BsVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(INSERT_STMT);

//			pstmt.setString(1, role_Permission_BsVO.getBs_acc_name());
			pstmt.setString(2, role_Permission_BsVO.getRole_no());
//			pstmt.setString(3, account_BackstageVO.getCinema_no());
//			pstmt.setString(4, account_BackstageVO.getBs_acc_psw());
//			pstmt.setString(5, account_BackstageVO.getEmail());
//			pstmt.setString(6, account_BackstageVO.getTel());
//			pstmt.setTimestamp(7, account_BackstageVO.getLast_online_time());
//			pstmt.setInt(8, account_BackstageVO.getState());
			
			
			
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
	public void update(Role_Permission_BsVO role_Permission_BsVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, role_Permission_BsVO.getPermission_no());
			pstmt.setString(2, role_Permission_BsVO.getRole_no());
//			pstmt.setString(3, account_BackstageVO.getCinema_no());
//			pstmt.setString(4, account_BackstageVO.getBs_acc_psw());
//			pstmt.setString(5, account_BackstageVO.getEmail());
//			pstmt.setString(6, account_BackstageVO.getTel());
//			pstmt.setTimestamp(7, account_BackstageVO.getLast_online_time());
//			pstmt.setInt(8, account_BackstageVO.getState());
//			pstmt.setString(9, account_BackstageVO.getBs_acc_no());
			
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
	public void delete(String permission_no) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(DELETE);

			pstmt.setString(1, permission_no);

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
	public Role_Permission_BsVO findByPrimaryKey(String permission_no) {

		Role_Permission_BsVO role_Permission_BsVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setString(1, permission_no);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// actVo 也稱為 Domain objects
				role_Permission_BsVO = new Role_Permission_BsVO();
				role_Permission_BsVO.setPermission_no(rs.getString("permission_no"));
				role_Permission_BsVO.setRole_no(rs.getString("role_no"));
//				account_BackstageVO.setRole_no(rs.getString("role_no"));
//				account_BackstageVO.setCinema_no(rs.getString("cinema_no"));
//				account_BackstageVO.setBs_acc_psw(rs.getString("bs_acc_psw"));
//				account_BackstageVO.setEmail(rs.getString("email"));
//				account_BackstageVO.setTel(rs.getString("tel"));
//				account_BackstageVO.setLast_online_time(rs.getTimestamp("last_online_time"));
//				account_BackstageVO.setState(rs.getInt("state"));
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
		return role_Permission_BsVO;
	}

	@Override
	public List<Role_Permission_BsVO> getAll() {
		List<Role_Permission_BsVO> list = new ArrayList<Role_Permission_BsVO>();
		Role_Permission_BsVO role_Permission_BsVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				// actVO 也稱為 Domain objects
				role_Permission_BsVO = new Role_Permission_BsVO();
				role_Permission_BsVO.setPermission_no(rs.getString("permission_no"));
				role_Permission_BsVO.setRole_no(rs.getString("role_no"));
//				account_BackstageVO.setRole_no(rs.getString("role_no"));
//				account_BackstageVO.setCinema_no(rs.getString("cinema_no"));
//				account_BackstageVO.setBs_acc_psw(rs.getString("bs_acc_psw"));
//				account_BackstageVO.setEmail(rs.getString("email"));
//				account_BackstageVO.setTel(rs.getString("tel"));
//				account_BackstageVO.setLast_online_time(rs.getTimestamp("last_online_time"));
//				account_BackstageVO.setState(rs.getInt("state"));
				list.add(role_Permission_BsVO); // Store the row in the list
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
		

	
//public static void main(String[] args) {
//
//	Account_BackstageJDBCDAO dao = new Account_BackstageJDBCDAO();
//
//	// 新增
//	Account_BackstageVO account_BackstageVO1 = new Account_BackstageVO();
//	account_BackstageVO1.setBs_acc_name("周星星");
//	account_BackstageVO1.setRole_no("後台系統管理BOSS");
//	account_BackstageVO1.setCinema_no("12");
//	account_BackstageVO1.setBs_acc_psw("123456");
//	account_BackstageVO1.setEmail("JOJO@gmail.com");
//	account_BackstageVO1.setTel("(02)1234-5678");
//	account_BackstageVO1.setLast_online_time(new Timestamp(System.currentTimeMillis()));
//	account_BackstageVO1.setState(1);
//	dao.insert(account_BackstageVO1);

	// 修改
//	Account_BackstageVO account_BackstageVO2 = new Account_BackstageVO();
//	account_BackstageVO2.setBs_acc_no("1");
//	account_BackstageVO2.setBs_acc_name("鐘天佑");
//	account_BackstageVO2.setRole_no("後台系統管理BOSS");
//	account_BackstageVO2.setCinema_no("12");
//	account_BackstageVO2.setBs_acc_psw("123456");
//	account_BackstageVO2.setEmail("JOJO@gmail.com");
//	account_BackstageVO2.setTel("(02)1234-5678");
//	account_BackstageVO2.setLast_online_time(new Timestamp(System.currentTimeMillis()));
//	account_BackstageVO2.setState(0);
//	dao.update(account_BackstageVO2);
//
	// 刪除
//	dao.delete("7");

//	// 查詢
//	Account_BackstageVO account_BackstageVO3 = dao.findByPrimaryKey("8");
//	System.out.print(account_BackstageVO3.getBs_acc_no() + ",");
//	System.out.print(account_BackstageVO3.getBs_acc_name() + ",");
//	System.out.print(account_BackstageVO3.getRole_no() + ",");
//	System.out.print(account_BackstageVO3.getCinema_no() + ",");
//	System.out.print(account_BackstageVO3.getBs_acc_psw() + ",");
//	System.out.print(account_BackstageVO3.getEmail() + ",");
//	System.out.print(account_BackstageVO3.getTel() + ",");
//	System.out.print(account_BackstageVO3.getLast_online_time() + ",");
//	System.out.println(account_BackstageVO3.getState());
//	
//	System.out.println("---------------------");
//
//	// 查詢
//	List<Account_BackstageVO> list = dao.getAll();
//	for (Account_BackstageVO account_BackstageVO : list) {
//		System.out.print(account_BackstageVO.getBs_acc_no() + ",");
//		System.out.print(account_BackstageVO.getBs_acc_name() + ",");
//		System.out.print(account_BackstageVO.getRole_no() + ",");
//		System.out.print(account_BackstageVO.getCinema_no() + ",");
//		System.out.print(account_BackstageVO.getBs_acc_psw() + ",");
//		System.out.print(account_BackstageVO.getEmail() + ",");
//		System.out.print(account_BackstageVO.getTel() + ",");
//		System.out.print(account_BackstageVO.getLast_online_time() + ",");
//		System.out.println(account_BackstageVO.getState());
//		
//		System.out.println();
//	}
	
//}	

}
