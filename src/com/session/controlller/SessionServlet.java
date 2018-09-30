package com.session.controlller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Reader;
import java.io.StringReader;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;
import java.util.TimeZone;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import com.session.model.SessionService;
import com.session.model.SessionVO;
import com.theater.model.TheaterService;
import com.theater.model.TheaterVO;
import com.theater.controller.TheaterServlet;

/**
 * Servlet implementation class SessionServlet
 */
@WebServlet("/session/session.do")
public class SessionServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SessionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        doPost(req, res);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        res.setContentType("text/html; charset=utf-8");
        //PrintWriter out = res.getWriter();

        String action = req.getParameter("action");

        if ("insert".equals(action)) { // from addTheater.jsp

            List<String> errorMsgs = new LinkedList<String>();
            // Store this set in the request scope, in case we need to
            // send the ErrorPage view.
            req.setAttribute("errorMsgs", errorMsgs);

            //Enumeration<String> enu = req.getParameterNames();
            int paramCount = 0;
            Set<String> set = new HashSet<String>();
            set.add("cinema_no");
            set.add("theater_no");
            set.add("movie_no");
            set.add("session_time");
            set.add("action");
            int exclusiveParams = set.size();
            int rows = 0, cols = 0;

            //int[] ret = getRowsColsParamCount(req, set);
            TheaterServlet theaterServlet = new TheaterServlet();
            int[] ret = theaterServlet.getRowsColsParamCount(req, set, errorMsgs);
            rows = ret[0];
            cols = ret[1];
            paramCount = ret[2];
            String cinema_no = null;
            SessionVO sessionVO = new SessionVO();
            try {
                /***********************1.接收請求參數 - 輸入格式的錯誤處理*************************/
                cinema_no = req.getParameter("cinema_no");
                if (cinema_no == null || cinema_no.trim().length() == 0) {
                    errorMsgs.add("無此影城編號資料");
                }

                String theater_no = req.getParameter("theater_no");
                if (theater_no == null || theater_no.trim().length() == 0) {
                    errorMsgs.add("影廳名稱請勿空白");
                }

                String movie_no = req.getParameter("movie_no");
                if (movie_no == null || movie_no.trim().length() == 0) {
                    errorMsgs.add("電影名稱請勿空白");
                }

                String strDate = req.getParameter("session_time");
                if (strDate == null || strDate.trim().length() == 0) {
                    errorMsgs.add("場次時間請勿空白");
                }

                //SimpleDateFormat parse java.util.Date -> getTime() -> java.sql.Timestamp
                DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                dateFormat.setTimeZone(TimeZone.getTimeZone("Asia/Taipei"));
                Date utilDate = null;
                try {
                    utilDate = dateFormat.parse(strDate);
                } catch (ParseException e) {
                    errorMsgs.add("場次時間格式不符合");
                    e.printStackTrace();
                }

                Timestamp session_time = null;
                if(utilDate != null) {
                    session_time = new Timestamp(utilDate.getTime());
                    sessionVO.setSession_time(session_time);
                }

                JSONObject json = new JSONObject();
                Integer seats = theaterServlet.getSeats(req, rows , cols ,json);

                System.out.println("seats : " + seats);
                System.out.println("json.length(): " + json.length());
                System.out.println(json.toString());

                TheaterService tSvc = new TheaterService();
                TheaterVO theaterVO = tSvc.getOneTheater(theater_no);

                if(seats != (theaterVO.getSeats())) {
                    errorMsgs.add("與影廳座位模版的座位數不相符");
                }

                String seat_table = json.toString();

                sessionVO.setTheater_no(theater_no);
                sessionVO.setMovie_no(movie_no);

                sessionVO.setSeat_table(seat_table);

                // Send the use back to the form, if there were errors
                if (!errorMsgs.isEmpty()) {
//                    System.out.println("errorMsgs.size() : " + errorMsgs.size());
                    req.setAttribute("sessionVO", sessionVO); // 含有輸入格式錯誤的sessionVO物件,也存入req
                    RequestDispatcher failureView = req
                            .getRequestDispatcher("/backstage/session/addSession.jsp?cinema_no=" + cinema_no);
                    failureView.forward(req, res);
                    return;//程式中斷
                }

                /***************************2.開始新增資料***************************************/
                SessionService sSvc = new SessionService();
                String session_no = sSvc.addSession(theater_no, movie_no, session_time, seat_table);

                /***************************3.新增完成,準備轉交(Send the Success view)***********/
                String url = "/backstage/session/listAllSession.jsp?cinema_no=" + cinema_no;
                System.out.println("url: " + url);
                RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllTheater.jsp
                successView.forward(req, res);

                /***************************其他可能的錯誤處理**********************************/
            } catch (Exception e) {
                errorMsgs.add("其他錯誤 " + e.getMessage());
                System.out.println("其他可能的錯誤處理");
                RequestDispatcher failureView = req
                        .getRequestDispatcher("/backstage/session/addSession.jsp?cinema_no=" + cinema_no);
                failureView.forward(req, res);
                e.printStackTrace();
            }
        }

        if ("delete".equals(action)) { // from listAllSession.jsp

            List<String> errorMsgs = new LinkedList<String>();
            // Store this set in the request scope, in case we need to
            // send the ErrorPage view.
            req.setAttribute("errorMsgs", errorMsgs);

            String requestURL = req.getParameter("requestURL"); // 送出刪除的來源網頁路徑

            try {
                /***************************1.接收請求參數***************************************/
               String session_no = req.getParameter("session_no");

                /***************************2.開始刪除資料***************************************/
               SessionService sSvc = new SessionService();
               sSvc.deleteSession(session_no);

                /***************************3.刪除完成,準備轉交(Send the Success view)***********/
               String url = requestURL;
               System.out.println("requestURL: " + url);
               RequestDispatcher successView = req.getRequestDispatcher(url); // 刪除成功後,轉交回送出刪除的來源網頁
               successView.forward(req, res);

                /***************************其他可能的錯誤處理**********************************/
            } catch (Exception e) {
                errorMsgs.add("刪除資料失敗: "+e.getMessage().replaceAll("\r|\n", ""));
                RequestDispatcher failureView = req
                        .getRequestDispatcher(requestURL);
                failureView.forward(req, res);
            }
        }

        if ("get_seat_model".equals(action)) { // from addSession.jsp ajax

            List<String> errorMsgs = new LinkedList<String>();
            // Store this set in the request scope, in case we need to
            // send the ErrorPage view.
//            req.setAttribute("errorMsgs", errorMsgs);

//            String requestURL = req.getParameter("requestURL"); // 送出刪除的來源網頁路徑
            req.setCharacterEncoding("utf-8");
            res.setContentType("text/plain; charset=utf-8");
            PrintWriter out = res.getWriter();
            JSONObject json = new JSONObject();

            try {
                /***************************1.接收請求參數***************************************/
               String theater_no = req.getParameter("theater_no");

                /***************************2.查詢資料***************************************/
               TheaterService tSvc = new TheaterService();
               TheaterVO theaterVO = tSvc.getOneTheater(theater_no);

               if(theaterVO == null) {
                   json.put("status", "no data found");
                   out.print(json);
                   return;
               } else {
                   Integer t_rows = theaterVO.getT_rows();
                   json.put("t_rows", t_rows);
                   Integer t_columns = theaterVO.getT_columns();
                   json.put("t_columns", t_columns);

                   Reader model = theaterVO.getSeat_model();
                   char[] arr = new char[8 * 1024];
                   StringBuilder buffer = new StringBuilder();
                   int numCharsRead;
                   while ((numCharsRead = model.read(arr, 0, arr.length)) != -1) {
                       buffer.append(arr, 0, numCharsRead);
                   }
                   model.close();
                   String str = buffer.toString();
                   //System.out.println("buffer.toString() : " + str);
                   //json.put("seat_model", str); //{"t_rows":9,"seat_model":"{\"4_11\":[\"D_11\",\"2\"],\"4_10\":[\"D_10\",\"2\"]...
                   json.put("seat_model", new JSONObject(str)); //{"t_rows":5,"seat_model":{"1_1":["x","0"],"1_2":["A_1","2"],"2_1":["B_1","2"],"1_3":["A_2","2"]...

               }
                /***************************3.完成,回傳json***********/
               json.put("status", "done");
               //System.out.println("json.toString() : " + json.toString());
               out.print(json);

                /***************************其他可能的錯誤處理**********************************/
            } catch (Exception e) {
                errorMsgs.add("查詢資料失敗: "+e.getMessage().replaceAll("\r|\n", ""));
//                RequestDispatcher failureView = req
//                        .getRequestDispatcher(requestURL);
//                failureView.forward(req, res);
                json.put("status", "error");
                json.put("msg", errorMsgs);
                return;
            }
        }

    }

}
