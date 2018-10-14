package com.session.model;

import java.sql.Connection;
import java.util.HashMap;
import java.util.List;

import com.session.model.SessionVO;

public interface SessionDAO_interface {
    public String insert(SessionVO sessionVO);
    public void update(SessionVO sessionVO);
    public void delete(String session_no);
    public SessionVO findByPrimaryKey(String session_no);
    public SessionVO findByTheaterNoBeforeSessionTime(String theater_no, String sessionTime);
    public List<SessionVO> getAllBySessionTimeMovieNoCinemaNo(String sessionTime, String movie_no, String cinema_no);
    public List<SessionVO> getAll();
    public List<SessionVO> getAllofTheater(String theater_no);
    public List<SessionVO> getAllofJoinTheaterMovieWhereTheaterNoCinema(String cinema_no);
    public List<HashMap> getAllCountInTheaterNoListGroupByTheaterNo(List<String> theater_no_list);
    public SessionVO getOneofJoinTheaterMovieWhereSessionNo(String session_no);

    public void updateSessionSeat(String seattable,String movie_session_no,Connection conn);

    //電影時刻 現正熱映 場次
    public List<SessionVO> getNowMoment();
    //場次明天~第七天
    public List<SessionVO> getTmrMoment();
    public List<SessionVO> getCMoment();
    public List<SessionVO> getDMoment();
    public List<SessionVO> getEMoment();
    public List<SessionVO> getFMoment();
    public List<SessionVO> getGMoment();
}
