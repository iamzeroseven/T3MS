package com.nav_backstage.model;

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

import com.member.model.MemVO;

public class NavDAO implements NavDAO_interface {
	// 一個應用程式中,針對一個資料庫 ,共用一個DataSource即可 
		private static DataSource ds = null;
		static {
			try {
				Context ctx = new InitialContext();
				ds = (DataSource) ctx.lookup("java:comp/env/jdbc/T3MS");
			} catch (NamingException e) {
				e.printStackTrace();
			}
		}
		
		
		private static final String INSERT_STMT ="insert into NAV_BACKSTAGE(listitem_no,listitem_name,url,parent_id,item_order) values('N'||LPAD(to_char(NAV_BACKSTAGE_seq.NEXTVAL), 3, '0'),?,?,?,?)";
		private static final String GET_ALL_STMT = "SELECT * FROM NAV_BACKSTAGE";
		
		
		@Override
		public void insert(NavVO navVO) {		
			Connection con = null;
			PreparedStatement pstmt = null;		

			try {

				con = ds.getConnection(); 
				pstmt = con.prepareStatement(INSERT_STMT);
				
				pstmt.setString(1,navVO.getListitem_name());
				pstmt.setString(2,navVO.getUrl());
				pstmt.setString(3,navVO.getParent_id());
				pstmt.setInt(4,navVO.getItem_order());
				
				pstmt.executeUpdate();
							
			} catch (SQLException se) {
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
		}




		@Override
		public void update(NavVO navVO) {
			// TODO Auto-generated method stub
			
		}




		@Override
		public void delete(String listitem_no) {
			// TODO Auto-generated method stub
			
		}




		@Override
		public NavVO findByNO(String listitem_no) {
			// TODO Auto-generated method stub
			return null;
		}
		
		
		@Override
		public List<NavVO> getAll() {
			List<NavVO> list = new ArrayList<NavVO>();
	        NavVO navVO = null;

	        Connection con = null;
	        PreparedStatement pstmt = null;
	        ResultSet rs = null;

	        try {

	            con = ds.getConnection();
	            pstmt = con.prepareStatement(GET_ALL_STMT);
	            rs = pstmt.executeQuery();

	            while (rs.next()) {
	                navVO = new NavVO();
	                navVO.setListitem_no(rs.getString("listitem_no"));
	                navVO.setListitem_name(rs.getString("listitem_name"));
	                navVO.setUrl(rs.getString("url"));
	                navVO.setParent_id(rs.getString("parent_id"));
	                navVO.setItem_order(rs.getInt("item_order"));

	                list.add(navVO); // Store the row in the list
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
