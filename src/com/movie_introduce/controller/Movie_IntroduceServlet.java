package com.movie_introduce.controller;

import java.io.IOException;

import java.util.LinkedList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.movie_introduce.model.*;


public class Movie_IntroduceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Movie_IntroduceServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
//------------------------------Search----------------------------------------------------------	
		
		if ("getOne_For_Display".equals(action)) { // 來自introduce_List1.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				String str = req.getParameter("introd_no");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("請輸入電影介紹編號");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/backstage/movie_introduce/introduce_List1.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
							
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/backstage/movie_introduce/introduce_List1.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				/***************************2.開始查詢資料*****************************************/
				Movie_IntroduceService introduceSvc = new Movie_IntroduceService();
				Movie_IntroduceVO movie_introduceVO = introduceSvc.getOneMovie_Itde(str);
				
				if (movie_introduceVO == null) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/backstage/movie_introduce/introduce_List1.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				/***************************3.查詢完成,準備轉交(Send the Success view)*************/
				req.setAttribute("movie_introduceVO", movie_introduceVO); // 資料庫取出的movie_introduceVO物件,存入req
				String url_M = "/backstage/movie_introduce/introduce_One.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url_M); // 成功轉交 introduce_One.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/backstage/movie_introduce/introduce_List1.jsp");
				failureView.forward(req, res);
			}
		}

//-----------------------delete---------------------------------------------
		
		if ("delete".equals(action)) { // from introduce_List.jsp

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			String requestURL = req.getParameter("requestURL"); // 送出刪除的來源網頁路徑

			try {
				/*************************** 1.接收請求參數 ***************************************/
				String introd_no = req.getParameter("introd_no");

				/*************************** 2.開始刪除資料 ***************************************/
				Movie_IntroduceService introduceSvc = new Movie_IntroduceService();
               
				introduceSvc.delete(introd_no);

				/*************************** 3.刪除完成,準備轉交(Send the Success view) ***********/
				// DeptService deptSvc = new DeptService();
				// if(requestURL.equals("/dept/listEmps_ByDeptno.jsp") ||
				// requestURL.equals("/dept/listAllDept.jsp"))
				// req.setAttribute("listEmps_ByDeptno",deptSvc.getEmpsByDeptno(empVO.getDeptno()));
				// // 資料庫取出的list物件,存入request

				String url_M = "/backstage/movie_introduce/introduce_List1.jsp";
				System.out.println("requestURL: " + url_M);
				RequestDispatcher successView = req.getRequestDispatcher(url_M); // 刪除成功後,轉交回送出刪除的來源網頁
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add("刪除資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher(requestURL);
				failureView.forward(req, res);
			}
		}

//---------------------------------------update-----------------------------------------	
		
		if ("getOne_For_Update".equals(action)) { // 來自introduce_List1.jsp 的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				/*************************** 1.接收請求參數 ****************************************/
				String introd_no = req.getParameter("introd_no").trim();
				

				/*************************** 2.開始查詢資料 ****************************************/

				Movie_IntroduceService introduceSvc = new Movie_IntroduceService();
				Movie_IntroduceVO movie_introduceVO = introduceSvc.getOneMovie_Itde(introd_no);
				
				/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
				req.setAttribute("movie_introduceVO", movie_introduceVO); // 資料庫取出的movie_introduceVO物件,存入req
				String url_M = "/backstage/movie_introduce/introduce_Update1.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url_M); // 成功轉交introduceVO_Update1.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 ************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料取出時失敗:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/backstage/movie_introduce/introduce_List1.jsp");
				failureView.forward(req, res);
			}
		}

		if ("update".equals(action)) { // 來自introd_Update1.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				String introd_no = req.getParameter("introd_no").trim();

				String movie_no = req.getParameter("movie_no").trim();
				if (movie_no == null || movie_no.trim().length() == 0) {
					errorMsgs.add("電影編號請勿空白");
				}

				String source = req.getParameter("source");
				if (source == null || source.trim().length() == 0) {
					errorMsgs.add("來源名稱: 請勿空白");
				}
		
				String url = req.getParameter("url").trim();
				if (url == null || url.trim().length() == 0) {
					errorMsgs.add("網址請勿空白");
				}

			
				String author = req.getParameter("author").trim();
				if (author == null || author.trim().length() == 0) {
					errorMsgs.add("作者請勿空白");
				}

				String title = req.getParameter("title").trim();
				if (title == null || title.trim().length() == 0) {
					errorMsgs.add("標題請勿空白");
				}
			
				String content = req.getParameter("content").trim();
				if (content == null || content.trim().length() == 0) {
					errorMsgs.add("內容請勿空白");
				}
					
				Integer active = new Integer(req.getParameter("active"));

				Movie_IntroduceVO movie_introduceVO = new Movie_IntroduceVO();
				
				movie_introduceVO.setIntrod_no(introd_no);
				movie_introduceVO.setMovie_no(movie_no);
				movie_introduceVO.setSource(source);
				movie_introduceVO.setUrl(url);
				movie_introduceVO.setAuthor(author);
				movie_introduceVO.setTitle(title);
				movie_introduceVO.setContent(content);
				movie_introduceVO.setActive(active);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("movie_introduceVO", movie_introduceVO); // 含有輸入格式錯誤的movie_introduceVO物件,也存入req
					RequestDispatcher failureView = req.getRequestDispatcher("/backstage/movie_introduce/introduce_Update1.jsp");
					failureView.forward(req, res);
					return; // 程式中斷
				}

				/*************************** 2.開始修改資料 *****************************************/
				Movie_IntroduceService introduceSvc = new Movie_IntroduceService();
				movie_introduceVO =  introduceSvc.updateMovie_Itde( introd_no , movie_no, source, url,
						 author, title, content, active) ;


				/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
				 req.setAttribute("movie_introduceVO", movie_introduceVO);
				 

	                String url_M = "/backstage/movie_introduce/introduce_List1.jsp";
	                RequestDispatcher successView = req.getRequestDispatcher(url_M);   // 修改成功後,轉交回送出修改的來源網頁
	                successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/backstage/movie_introduce/introduce_Update1.jsp");
				failureView.forward(req, res);

			}
		}
		//----------------------------Insert--------------------------------------------------------------------		

				if ("insert".equals(action)) { // 來自introduce_Add.jsp的請求

					List<String> errorMsgs = new LinkedList<String>();
					// Store this set in the request scope, in case we need to
					// send the ErrorPage view.
					req.setAttribute("errorMsgs", errorMsgs);

					try {
						/*********************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/
						

						String movie_no = req.getParameter("movie_no").trim();
						if (movie_no == null || movie_no.trim().length() == 0) {
							errorMsgs.add("電影編號請勿空白");
						}

						String source = req.getParameter("source");
						if (source == null || source.trim().length() == 0) {
							errorMsgs.add("來源名稱: 請勿空白");
						}
					
						String url = req.getParameter("url").trim();
						if (url == null || url.trim().length() == 0) {
							errorMsgs.add("網址請勿空白");
						}

					
						String author = req.getParameter("author").trim();
						if (author == null || author.trim().length() == 0) {
							errorMsgs.add("作者請勿空白");
						}

						String title = req.getParameter("title").trim();
						if (title == null || title.trim().length() == 0) {
							errorMsgs.add("標題請勿空白");
						}
					
						String content = req.getParameter("content").trim();
						if (content == null || content.trim().length() == 0) {
							errorMsgs.add("內容請勿空白");
						}
						
						Integer active = new Integer(req.getParameter("active"));


						Movie_IntroduceVO movie_introduceVO = new Movie_IntroduceVO();
						
						movie_introduceVO.setMovie_no(movie_no);
						movie_introduceVO.setSource(source);
						movie_introduceVO.setUrl(url);
						movie_introduceVO.setAuthor(author);
						movie_introduceVO.setTitle(title);
						movie_introduceVO.setContent(content);						
						movie_introduceVO.setActive(active);
					

						Movie_IntroduceService introduceSvc = new Movie_IntroduceService();

						// Send the use back to the form, if there were errors
						if (!errorMsgs.isEmpty()) {
							req.setAttribute("movie_introduceVO", movie_introduceVO); // 含有輸入格式錯誤的movie_introduceVO物件,也存入req
							RequestDispatcher failureView = req.getRequestDispatcher("/backstage/movie_introduce/introduce_Add.jsp");
							failureView.forward(req, res);
							return;
						}

						/*************************** 2.開始新增資料 ***************************************/

						movie_introduceVO = introduceSvc.addMovie_Itde(movie_no,source,url,
								author,title,content,active);

						/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
						String url_M = "/backstage/movie_introduce/introduce_List1.jsp";
						RequestDispatcher successView = req.getRequestDispatcher(url_M); // 新增成功後轉交introduce_List1.jsp
						successView.forward(req, res);

						/*************************** 其他可能的錯誤處理 **********************************/
					} catch (Exception e) {
						errorMsgs.add(e.getMessage());
						RequestDispatcher failureView = req.getRequestDispatcher("/backstage/movie_introduce/introduce_Add.jsp");
						failureView.forward(req, res);
					}
				}

	}
}
