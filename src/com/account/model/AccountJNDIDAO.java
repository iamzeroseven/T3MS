package com.account.model;

import java.sql.Connection;
//import java.sql.DriverManager;
//import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
//import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class AccountJNDIDAO implements AccountDAO_interface{
	
		private static DataSource ds = null;
		
		static {
			try {
				Context ctx = new InitialContext();
				ds = (DataSource) ctx.lookup("java:comp/env/jdbc/T3MS");
			} catch (NamingException e) {
				e.printStackTrace();
			}
		}
		
		
		private static final String INSERT_STMT = 
				"INSERT INTO ACCOUNT_BACKSTAGE(BS_ACC_NO,BS_ACC_NAME,ROLE_NO,CINEMA_NO,BS_ACC_PSW,EMAIL,TEL,STATE) VALUES ('A'||LPAD(to_char(ACCOUNT_BACKSTAGE_SEQ.NEXTVAL), 3, '0'),?,?,?,?,?,?,1)";
		private static final String GET_ALL_STMT = 
				"SELECT BS_ACC_NO,BS_ACC_NAME,ROLE_NO,CINEMA_NO,BS_ACC_PSW,EMAIL,TEL,LAST_ONLINE_TIME,STATE FROM ACCOUNT_BACKSTAGE order by BS_ACC_NO";
		private static final String GET_ONE_STMT = 
				"SELECT BS_ACC_NO,BS_ACC_NAME,ROLE_NO,CINEMA_NO,BS_ACC_PSW,EMAIL,TEL,LAST_ONLINE_TIME,STATE FROM ACCOUNT_BACKSTAGE where BS_ACC_NAME = ?";
		private static final String DELETE = 
				"DELETE FROM ACCOUNT_BACKSTAGE where BS_ACC_NO = ?";
		private static final String UPDATE = 
				"UPDATE ACCOUNT_BACKSTAGE set BS_ACC_NAME=?,BS_ACC_PSW=?, EMAIL=?, TEL=? where BS_ACC_NO = ?";
		private static final String LOGIN = 
				"SELECT * FROM ACCOUNT_BACKSTAGE WHERE BS_ACC_NAME=? AND BS_ACC_PSW=?";
		private static final String LOGINTIME = 
				"UPDATE ACCOUNT_BACKSTAGE SET LAST_ONLINE_TIME=? WHERE BS_ACC_NAME=?";
		private static final String GETONE = 
				"SELECT * FROM ACCOUNT_BACKSTAGE where BS_ACC_NO = ?";
		private static final String BAN ="UPDATE ACCOUNT_BACKSTAGE SET STATE=? WHERE BS_ACC_NO=?";
		
		@Override
		public String insert(AccountVO accountVO) {
			Connection con = null;
			PreparedStatement pstmt = null;
			String bs_acc_no=null;
			try {

				con = ds.getConnection();
				String[] cols = { "Bs_acc_no" };
				pstmt = con.prepareStatement(INSERT_STMT,cols);

				pstmt.setString(1, accountVO.getBs_acc_name());
				pstmt.setString(2, accountVO.getRole_no());
				pstmt.setString(3, accountVO.getCinema_no());
				pstmt.setString(4, accountVO.getBs_acc_psw());
				pstmt.setString(5, accountVO.getEmail());
				pstmt.setString(6, accountVO.getTel());

				pstmt.executeUpdate();
				ResultSet rs = pstmt.getGeneratedKeys();
	            ResultSetMetaData rsmd = rs.getMetaData();
	            int columnCount = rsmd.getColumnCount();
	            if (rs.next()) {
	                do {
	                    for (int i = 1; i <= columnCount; i++) {
	                    	bs_acc_no = rs.getString(i);
	                        //System.out.println("自增主鍵值 = " + theater_no);
	                    }
	                } while (rs.next());
	            } else {
	                System.out.println("NO KEYS WERE GENERATED.");
	            }
	            
	            rs.close();
							

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
			return bs_acc_no;
		}
		
		@Override
		public boolean login(String bs_acc_name,String bs_acc_psw) {
			Connection con=null;
			boolean isValid = false;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
	        try{
	        	con = ds.getConnection(); 
	        	pstmt = con.prepareStatement(LOGIN);
	        	
	        	pstmt.setString(1, bs_acc_name);
				pstmt.setString(2, bs_acc_psw);
				rs=pstmt.executeQuery();            
	 
	            if(rs.next()){
	                isValid = true;
	            }
	            rs.close();
	            pstmt.close();
	            
	       
			} catch (SQLException se) {
				throw new RuntimeException("A database error occured. "
						+ se.getMessage());
			}finally {
				try {
					con.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
	        if(isValid){
	            return true;
	        }
	        else return false;
	    }
		
		
		
		
		
		
		
		

		@Override
		public void update(AccountVO accountVO) {
			Connection con = null;
			PreparedStatement pstmt = null;

			try {

				con = ds.getConnection();
				pstmt = con.prepareStatement(UPDATE);

				pstmt.setString(1, accountVO.getBs_acc_name());
				pstmt.setString(2, accountVO.getBs_acc_psw());
				pstmt.setString(3, accountVO.getEmail());
				pstmt.setString(4, accountVO.getTel());
				pstmt.setString(5, accountVO.getBs_acc_no());
				
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
		public void delete(String bs_acc_no) {
			Connection con = null;
			PreparedStatement pstmt = null;

			try {

				con = ds.getConnection();
				pstmt = con.prepareStatement(DELETE);

				pstmt.setString(1, bs_acc_no);

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
		public AccountVO findVO(String bs_acc_name) {

			AccountVO accountVO = null;
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			try {

				con = ds.getConnection();
				pstmt = con.prepareStatement(GET_ONE_STMT);

				pstmt.setString(1, bs_acc_name);

				rs = pstmt.executeQuery();

				while (rs.next()) {
					accountVO = new AccountVO();
					accountVO.setBs_acc_no(rs.getString("bs_acc_no"));
					accountVO.setBs_acc_name(rs.getString("bs_acc_name"));
					accountVO.setRole_no(rs.getString("role_no"));
					accountVO.setCinema_no(rs.getString("cinema_no"));
					accountVO.setBs_acc_psw(rs.getString("bs_acc_psw"));
					accountVO.setEmail(rs.getString("email"));
					accountVO.setTel(rs.getString("tel"));
					accountVO.setLast_online_time(rs.getTimestamp("last_online_time"));
					accountVO.setState(rs.getInt("state"));
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
			return accountVO;
		}
		
		@Override
		public AccountVO findVObyno(String bs_acc_no) {

			AccountVO accountVO = null;
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			try {

				con = ds.getConnection();
				pstmt = con.prepareStatement(GETONE);

				pstmt.setString(1, bs_acc_no);

				rs = pstmt.executeQuery();

				while (rs.next()) {
					accountVO = new AccountVO();
					accountVO.setBs_acc_no(rs.getString("bs_acc_no"));
					accountVO.setBs_acc_name(rs.getString("bs_acc_name"));
					accountVO.setRole_no(rs.getString("role_no"));
					accountVO.setCinema_no(rs.getString("cinema_no"));
					accountVO.setBs_acc_psw(rs.getString("bs_acc_psw"));
					accountVO.setEmail(rs.getString("email"));
					accountVO.setTel(rs.getString("tel"));
					accountVO.setLast_online_time(rs.getTimestamp("last_online_time"));
					accountVO.setState(rs.getInt("state"));
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
			return accountVO;
		}

		@Override
		public List<AccountVO> getAll() {
			List<AccountVO> list = new ArrayList<AccountVO>();
			AccountVO account_BackstageVO = null;

			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			try {

				con = ds.getConnection();
				pstmt = con.prepareStatement(GET_ALL_STMT);
				rs = pstmt.executeQuery();

				while (rs.next()) {
					
					account_BackstageVO = new AccountVO();
					account_BackstageVO.setBs_acc_no(rs.getString("bs_acc_no"));
					account_BackstageVO.setBs_acc_name(rs.getString("bs_acc_name"));
					account_BackstageVO.setRole_no(rs.getString("role_no"));
					account_BackstageVO.setCinema_no(rs.getString("cinema_no"));
					account_BackstageVO.setBs_acc_psw(rs.getString("bs_acc_psw"));
					account_BackstageVO.setEmail(rs.getString("email"));
					account_BackstageVO.setTel(rs.getString("tel"));
					account_BackstageVO.setLast_online_time(rs.getTimestamp("last_online_time"));
					account_BackstageVO.setState(rs.getInt("state"));
					list.add(account_BackstageVO); // Store the row in the list
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

	
		@Override
		public void logintime(String bs_acc_name) {
			Connection con = null;
			PreparedStatement pstmt = null;

			try {

				con = ds.getConnection();
				pstmt = con.prepareStatement(LOGINTIME);

				pstmt.setTimestamp(1, new Timestamp(System.currentTimeMillis()));
				pstmt.setString(2, bs_acc_name);
							
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
		public void stop(String bs_acc_no) {
			Connection con = null;
			PreparedStatement pstmt = null;	
			try {

				con = ds.getConnection(); 
				pstmt = con.prepareStatement(BAN);
				pstmt.setInt(1, 0);
				pstmt.setString(2, bs_acc_no);
				pstmt.executeUpdate();
			
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
		public void unstop(String bs_acc_no) {
			Connection con = null;
			PreparedStatement pstmt = null;	
			try {

				con = ds.getConnection(); 
				pstmt = con.prepareStatement(BAN);
				pstmt.setInt(1, 1);
				pstmt.setString(2, bs_acc_no);
				pstmt.executeUpdate();
			
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
		
			
	}
			

