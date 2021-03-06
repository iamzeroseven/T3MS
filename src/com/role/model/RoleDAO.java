package com.role.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.movie.model.MovieVO;
import com.nav_backstage.model.NavVO;



public class RoleDAO implements RoleDAO_interface{

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
			"INSERT INTO BACKSTAGE_ROLE(BR_NO,BR_NAME) VALUES ('R'||LPAD(to_char(BACKSTAGE_ROLE_SEQ.NEXTVAL), 3, '0'),?)";
	
	private static final String GET_ONE_STMT ="SELECT * FROM BACKSTAGE_ROLE WHERE BR_NAME=?";
	private static final String GET_ALL_STMT ="SELECT * FROM BACKSTAGE_ROLE";
	private static final String GET_ONE ="SELECT * FROM BACKSTAGE_ROLE WHERE BR_NO=?";
	
	
	@Override
	public String insert(RoleVO roleVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String br_no = null;
		try {
			
			con = ds.getConnection();
			String[] cols = { "br_no" };
			pstmt = con.prepareStatement(INSERT_STMT,cols);
			pstmt.setString(1, roleVO.getBr_name());
			
			pstmt.executeUpdate();
			ResultSet rs = pstmt.getGeneratedKeys();
            ResultSetMetaData rsmd = rs.getMetaData();
            int columnCount = rsmd.getColumnCount();
            if (rs.next()) {
                do {
                    for (int i = 1; i <= columnCount; i++) {
                    	br_no = rs.getString(i);
                        //System.out.println("自增主鍵值 = " + theater_no);
                    }
                } while (rs.next());
            } else {
                System.out.println("NO KEYS WERE GENERATED.");
            }
            
            rs.close();
		}  catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
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
		return br_no;
	}

	@Override
	public void update(RoleVO roleVO) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(String permission__no) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public RoleVO findnoByname(String br_name) {
		RoleVO roleVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE_STMT);
			pstmt.setString(1, br_name);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// MovieVo 也稱為 Domain objects
				roleVO = new RoleVO();
				roleVO.setBr_no(rs.getString("br_no"));
				roleVO.setBr_name(rs.getString("br_name"));
			}

			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
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

		return roleVO;
	
	}

	@Override
	public List<RoleVO> getAll() {
		List<RoleVO> list = new ArrayList<RoleVO>();
        RoleVO roleVO = null;

        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {

            con = ds.getConnection();
            pstmt = con.prepareStatement(GET_ALL_STMT);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                roleVO = new RoleVO();
                roleVO.setBr_no(rs.getString("br_no"));
                roleVO.setBr_name(rs.getString("br_name"));

                list.add(roleVO); // Store the row in the list
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
	public RoleVO findByno(String br_no) {
		RoleVO roleVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ONE);
			pstmt.setString(1, br_no);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				// MovieVo 也稱為 Domain objects
				roleVO = new RoleVO();
				roleVO.setBr_no(rs.getString("br_no"));
				roleVO.setBr_name(rs.getString("br_name"));
			}

			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
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

		return roleVO;
	
	}

	
	


}
