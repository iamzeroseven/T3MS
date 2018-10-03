--  DROP TABLE  --

DROP TABLE CINEMAMOVIE;

DROP TABLE PRIVATE_CHAT;
DROP TABLE SERVICE_CHAT;
DROP TABLE TICKET_DETAIL;

DROP TABLE TEAM_MSG_REPORT;
DROP TABLE TEAM_MEN_REPORT;
DROP TABLE TEAM_MEN;
DROP TABLE MSG;

DROP TABLE REPORT_MSG;
DROP TABLE PIC_REPORT;
DROP TABLE PIC_REPLY;
DROP TABLE PIC_HITS;
DROP TABLE MEM_PIC;

DROP TABLE ACTIVITY;
DROP TABLE ANNOUNCEMENT;

DROP TABLE REPORT_FILMREVIEW_MSG;
DROP TABLE FILMREVIEW_MSG;
DROP TABLE FILMREVIEW;

DROP TABLE MOVIE_INTRODUCE;
DROP TABLE MOVIE_TRACE_LIST;
DROP TABLE BOX_OFFICE_CHARTS;

DROP TABLE ACCOUNT_BACKSTAGE;

DROP TABLE ROLE_PERMISSION_BACKSTAGE;
DROP TABLE INVITE_FRIEND;
DROP TABLE FREINDSHIP;

DROP TABLE TEAM;

DROP TABLE MOVIE_SESSION;

DROP TABLE MEAL_DETAILS;

DROP TABLE TICKET_ORDER;

DROP TABLE MEAL;

DROP TABLE TICKETTYPE;
DROP TABLE THEATER;
DROP TABLE CINEMA;

DROP TABLE MEMBER;
DROP TABLE MOVIE;

DROP TABLE BACKSTAGE_ROLE;

DROP TABLE NAV_BACKSTAGE;

--  DROP SEQUENCE  --
DROP SEQUENCE CINEMA_SEQ;
DROP SEQUENCE THEATER_SEQ;
DROP SEQUENCE TICKETTYPE_SEQ;
DROP SEQUENCE MEAL_SEQ;

DROP SEQUENCE MOVIE_SESSION_SEQ;
DROP SEQUENCE TICKET_ORDER_SEQ;
DROP SEQUENCE PRIVATE_CHAT_SEQ;
DROP SEQUENCE SERVICE_CHAT_SEQ;
DROP SEQUENCE TICKET_DETAIL_SEQ;

DROP SEQUENCE MSG_SEQ;
DROP SEQUENCE TEAM_SEQ;
DROP SEQUENCE TEAM_MEN_SEQ;
DROP SEQUENCE TEAM_MSG_REPORT_SEQ;
DROP SEQUENCE TEAM_MEN_REPORT_SEQ;

DROP SEQUENCE MEM_PIC_SEQ;
DROP SEQUENCE PIC_HITS_SEQ;
DROP SEQUENCE PIC_REPLY_SEQ;
DROP SEQUENCE REPORT_MSG_SEQ;
DROP SEQUENCE PIC_REPORT_SEQ;

DROP SEQUENCE ACTIVITY_SEQ;
DROP SEQUENCE ANNOUNCEMENT_SEQ;
DROP SEQUENCE FILMREVIEW_SEQ;
DROP SEQUENCE FILMREVIEW_MSG_SEQ;
DROP SEQUENCE REPORT_FILMREVIEW_MSG_SEQ;

DROP SEQUENCE MOVIE_SEQ;
DROP SEQUENCE MEMBER_SEQ;
DROP SEQUENCE MOVIE_INTRODUCE_SEQ;
DROP SEQUENCE MOVIE_TRACE_LIST_SEQ;
DROP SEQUENCE BOX_OFFICE_CHARTS_SEQ;

DROP SEQUENCE ACCOUNT_BACKSTAGE_SEQ;
DROP SEQUENCE NAV_BACKSTAGE_SEQ;
DROP SEQUENCE ROLE_PERMISSION_BACKSTAGE_SEQ;
DROP SEQUENCE INVITE_FRIEND_SEQ;
DROP SEQUENCE FREINDSHIP_FRIEND_SEQ;

--------------------------------------------------------
--  DDL for Sequence CINEMA_SEQ
--------------------------------------------------------
CREATE SEQUENCE CINEMA_SEQ
  MINVALUE 1
  START WITH 1
  INCREMENT BY 1
  NOCACHE
  NOCYCLE;

--------------------------------------------------------
--  DDL for Sequence THEATER_SEQ
--------------------------------------------------------
CREATE SEQUENCE THEATER_SEQ
  MINVALUE 1
  START WITH 1
  INCREMENT BY 1
  NOCACHE
  NOCYCLE;

--------------------------------------------------------
--  DDL for Sequence TICKETTYPE_SEQ
--------------------------------------------------------
CREATE SEQUENCE TICKETTYPE_SEQ
  MINVALUE 1
  START WITH 1
  INCREMENT BY 1
  NOCACHE
  NOCYCLE;

--------------------------------------------------------
--  DDL for Sequence MEAL_SEQ
--------------------------------------------------------
CREATE SEQUENCE MEAL_SEQ
  MINVALUE 1
  START WITH 1
  INCREMENT BY 1
  NOCACHE
  NOCYCLE;

--------------------------------------------------------
--  DDL for Sequence MOVIE_SESSION_SEQ
--------------------------------------------------------
CREATE SEQUENCE MOVIE_SESSION_SEQ
  MINVALUE 1
  START WITH 1
  INCREMENT BY 1
  NOCACHE
  NOCYCLE;

--------------------------------------------------------
--  DDL for Sequence TICKET_ORDER_SEQ
--------------------------------------------------------
CREATE SEQUENCE TICKET_ORDER_SEQ
  MINVALUE 1
  START WITH 1
  INCREMENT BY 1
  NOCACHE
  NOCYCLE;

--------------------------------------------------------
--  DDL for Sequence PRIVATE_CHAT_SEQ
--------------------------------------------------------
CREATE SEQUENCE PRIVATE_CHAT_SEQ
  MINVALUE 1
  START WITH 1
  INCREMENT BY 1
  NOCACHE
  NOCYCLE;

--------------------------------------------------------
--  DDL for Sequence SERVICE_CHAT_SEQ
--------------------------------------------------------
CREATE SEQUENCE SERVICE_CHAT_SEQ
  MINVALUE 1
  START WITH 1
  INCREMENT BY 1
  NOCACHE
  NOCYCLE;

--------------------------------------------------------
--  DDL for Sequence TICKET_DETAIL_SEQ
--------------------------------------------------------
CREATE SEQUENCE TICKET_DETAIL_SEQ
  MINVALUE 1
  START WITH 1
  INCREMENT BY 1
  NOCACHE
  NOCYCLE;

--------------------------------------------------------
--  DDL for Sequence MSG_SEQ
--------------------------------------------------------
CREATE SEQUENCE MSG_SEQ
  MINVALUE 1
  START WITH 1
  INCREMENT BY 1
  NOCACHE
  NOCYCLE;

--------------------------------------------------------
--  DDL for Sequence TEAM_SEQ
--------------------------------------------------------
CREATE SEQUENCE TEAM_SEQ
  MINVALUE 1
  START WITH 1
  INCREMENT BY 1
  NOCACHE
  NOCYCLE;

--------------------------------------------------------
--  DDL for Sequence TEAM_MEN_SEQ
--------------------------------------------------------
CREATE SEQUENCE TEAM_MEN_SEQ
  MINVALUE 1
  START WITH 1
  INCREMENT BY 1
  NOCACHE
  NOCYCLE;

--------------------------------------------------------
--  DDL for Sequence TEAM_MSG_REPORT_SEQ
--------------------------------------------------------
CREATE SEQUENCE TEAM_MSG_REPORT_SEQ
  MINVALUE 1
  START WITH 1
  INCREMENT BY 1
  NOCACHE
  NOCYCLE;

--------------------------------------------------------
--  DDL for Sequence TEAM_MEN_REPORT_SEQ
--------------------------------------------------------
CREATE SEQUENCE TEAM_MEN_REPORT_SEQ
  MINVALUE 1
  START WITH 1
  INCREMENT BY 1
  NOCACHE
  NOCYCLE;


CREATE SEQUENCE MEM_PIC_SEQ
  MINVALUE 1
  INCREMENT BY 1
  START WITH 1
  NOMAXVALUE
  NOCYCLE
  NOCACHE;


CREATE SEQUENCE PIC_HITS_SEQ
  MINVALUE 1
  INCREMENT BY 1
  START WITH 1
  NOMAXVALUE
  NOCYCLE
  NOCACHE;


CREATE SEQUENCE PIC_REPLY_SEQ
  MINVALUE 1
  INCREMENT BY 1
  START WITH 1
  NOMAXVALUE
  NOCYCLE
  NOCACHE;


CREATE SEQUENCE REPORT_MSG_SEQ
  MINVALUE 1
  INCREMENT BY 1
  START WITH 1
  NOMAXVALUE
  NOCYCLE
  NOCACHE;


CREATE SEQUENCE PIC_REPORT_SEQ
  MINVALUE 1
  INCREMENT BY 1
  START WITH 1
  NOMAXVALUE
  NOCYCLE
  NOCACHE;


CREATE SEQUENCE ACTIVITY_SEQ
  MINVALUE 1
  INCREMENT BY 1
  START WITH 1
  NOCACHE
  NOCYCLE;

CREATE SEQUENCE ANNOUNCEMENT_SEQ
  MINVALUE 1
  INCREMENT BY 1
  START WITH 1
  NOCACHE
  NOCYCLE;

CREATE SEQUENCE FILMREVIEW_SEQ
  MINVALUE 1
  INCREMENT BY 1
  START WITH 1
  NOCACHE
  NOCYCLE;

CREATE SEQUENCE FILMREVIEW_MSG_SEQ
  MINVALUE 1
  INCREMENT BY 1
  START WITH 1
  NOCACHE
  NOCYCLE;

CREATE SEQUENCE REPORT_FILMREVIEW_MSG_SEQ
  MINVALUE 1
  INCREMENT BY 1
  START WITH 1
  NOCACHE
  NOCYCLE;


CREATE SEQUENCE MEMBER_SEQ
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
NOCACHE;

CREATE SEQUENCE MOVIE_SEQ
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
NOCACHE;

CREATE SEQUENCE BOX_OFFICE_CHARTS_SEQ
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
NOCACHE;

CREATE SEQUENCE MOVIE_INTRODUCE_SEQ
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
NOCACHE;

CREATE SEQUENCE MOVIE_TRACE_LIST_SEQ
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
NOCACHE;

CREATE SEQUENCE ACCOUNT_BACKSTAGE_SEQ
  MINVALUE 1
  START WITH 1
  INCREMENT BY 1
  NOCACHE
  NOCYCLE;

CREATE SEQUENCE NAV_BACKSTAGE_SEQ
  MINVALUE 1
  START WITH 1
  INCREMENT BY 1
  NOCACHE
  NOCYCLE;

CREATE SEQUENCE ROLE_PERMISSION_BACKSTAGE_SEQ
  MINVALUE 1
  START WITH 1
  INCREMENT BY 1
  NOCACHE
  NOCYCLE;

CREATE SEQUENCE INVITE_FRIEND_SEQ
  MINVALUE 1
  START WITH 1
  INCREMENT BY 1
  NOCACHE
  NOCYCLE;

CREATE SEQUENCE FREINDSHIP_FRIEND_SEQ
  MINVALUE 1
  START WITH 1
  INCREMENT BY 1
  NOCACHE
  NOCYCLE;

--------------------------------------------------------
--  for Table CINEMA
--------------------------------------------------------
CREATE TABLE CINEMA (
  CINEMA_NO      VARCHAR2(10)  NOT NULL,
  CINEMA_NAME    VARCHAR2(100) NOT NULL,
  CINEMA_ENGNAME VARCHAR2(100),
  CINEMA_ADDRESS VARCHAR2(300),
  CINEMA_TEL     VARCHAR2(50),
  INTRODUCTION   VARCHAR2(4000),
  TRAFFIC        VARCHAR2(800),
  PHOTO_TITLE    VARCHAR2(50),
  PHOTO_PATH     VARCHAR2(200),
  PHOTO_SMALL    VARCHAR2(200),
  ACTIVE         NUMBER(1,0),
  STATE          NUMBER(1,0));

-- ALTER TABLE CINEMA
--   MODIFY PHOTO_PATH VARCHAR2(200);
--
-- ALTER TABLE CINEMA
--   ADD PHOTO_SMALL VARCHAR2(200);

--------------------------------------------------------
--  for Table CINEMAMOVIE
--------------------------------------------------------
CREATE TABLE CINEMAMOVIE (
  CINEMA_NO  VARCHAR2(10) NOT NULL,
  MOVIE_NO   VARCHAR2(10) NOT NULL,
  START_DATE DATE,
  END_DATE   DATE);

--------------------------------------------------------
--  for Table THEATER
--------------------------------------------------------
CREATE TABLE THEATER (
  THEATER_NO   VARCHAR2(10)  NOT NULL,
  CINEMA_NO    VARCHAR2(10)  NOT NULL,
  THEATER_NAME VARCHAR2(100),
  T_ROWS       NUMBER,
  T_COLUMNS    NUMBER,
  SEAT_MODEL   CLOB,
  SEATS        NUMBER,
  EQUIPMENT    VARCHAR2(20));

--------------------------------------------------------
--  for Table TICKETTYPE
--------------------------------------------------------
CREATE TABLE TICKETTYPE (
  TICKETTYPE_NO VARCHAR2(10) NOT NULL,
  THEATER_NO    VARCHAR2(10) NOT NULL,
  IDENTITY      VARCHAR2(100),
--  EQUIPMENT     VARCHAR2(20),
  TIME          VARCHAR2(20),
  PRICE         NUMBER);

-- ALTER TABLE TICKETTYPE
  -- DROP COLUMN EQUIPMENT;
--------------------------------------------------------
--  for Table MEAL
--------------------------------------------------------
CREATE TABLE MEAL (
  MEAL_NO     VARCHAR2(10) NOT NULL,
  CINEMA_NO   VARCHAR2(10) NOT NULL,
  MEAL_NAME   VARCHAR2(50),
  MEAL_FOOD   VARCHAR2(200),
  MEAL_PRICE  NUMBER,
  MEAL_PHOTO  BLOB,
  EXTENSION   VARCHAR2(20),
  PHOTO_TITLE VARCHAR2(50),
  MEAL_ACTIVE NUMBER(1,0));

--------------------------------------------------------
--  for Table MEAL_DETAILS
--------------------------------------------------------
CREATE TABLE MEAL_DETAILS (
  ORDER_NO  VARCHAR2(10) NOT NULL,
  MEAL_NO   VARCHAR2(10) NOT NULL);


CREATE TABLE MOVIE_SESSION
(
SESSION_NO VARCHAR2(10) NOT NULL,
THEATER_NO VARCHAR2(10) NOT NULL,
MOVIE_NO VARCHAR2(10) NOT NULL,
SESSION_TIME TIMESTAMP NOT NULL,
SEAT_TABLE CLOB);

ALTER TABLE MOVIE_SESSION
  MODIFY SESSION_TIME TIMESTAMP WITH TIME ZONE;

CREATE TABLE TICKET_ORDER
(
ORDER_NO VARCHAR2(10) NOT NULL,
MEM_NO VARCHAR2(10) NOT NULL,
MEAL_NO VARCHAR2(10) NOT NULL,
UUID VARCHAR2(200),
AMOUNT VARCHAR2(10),
ORDER_STATE NUMBER(1,0),
PAYMENT_STATE NUMBER(1,0),
CREATED_AT TIMESTAMP NOT NULL,
UPDATED_AT TIMESTAMP NOT NULL,
EXCHANGE_STATE NUMBER(1,0),
CREDIT_CARD VARCHAR2(20),
DEADLINE VARCHAR2(10),
AUTH_KEY VARCHAR2(5));

CREATE TABLE PRIVATE_CHAT
(
PRIVATE_CHAT_NO VARCHAR2(10) NOT NULL,
TRANS_MEM_NO VARCHAR2(10) NOT NULL,
RECEIVER_MEM_NO VARCHAR2(10) NOT NULL,
CREATED_AT TIMESTAMP NOT NULL,
CONTENT VARCHAR2(600) NOT NULL);

CREATE TABLE SERVICE_CHAT
(
CHAT_ID VARCHAR2(10) NOT NULL,
BACKSTAGE_NO VARCHAR2(10) NOT NULL,
MEM_NO VARCHAR2(10) NOT NULL,
CREATED_AT TIMESTAMP NOT NULL,
OWNER NUMBER(1,0),
CONTENT VARCHAR2(600) NOT NULL);

CREATE TABLE TICKET_DETAIL
(
TICKET_DETAIL_NO VARCHAR2(10) NOT NULL,
ORDER_NO VARCHAR2(10) NOT NULL,
SESSION_NO VARCHAR2(10) NOT NULL,
TICKETTYPE_NO VARCHAR2(10) NOT NULL,
SEAT VARCHAR2(10) NOT NULL,
CREATED_AT TIMESTAMP NOT NULL,
UPDATED_AT TIMESTAMP NOT NULL);


CREATE TABLE MSG(
MSG_NO VARCHAR2(10) NOT NULL,
MEM_NO VARCHAR2(10) NOT NULL,
TEAM_NO VARCHAR2(10) NOT NULL,
MSG_CON VARCHAR2(600),
PAR_NO VARCHAR2(10),
UPDATED_AT TIMESTAMP NOT NULL,
CREATED_AT TIMESTAMP NOT NULL);

------------揪團留言--------------

CREATE TABLE TEAM (
TEAM_NO VARCHAR2(10) NOT NULL,
MEM_NO VARCHAR2(10) NOT NULL,
SESSION_NO VARCHAR2(10) NOT NULL,
TEAM_TIME TIMESTAMP NOT NULL,
TEAM_NAME VARCHAR2(60) NOT NULL,
TEAM_DES VARCHAR2(600),
TEAM_DATE TIMESTAMP NOT NULL,
TEAM_POS VARCHAR2(60) NOT NULL,
TEAM_REV NUMBER(1,0) NOT NULL,
TEAM_NUM Number NOT NULL,
STATE NUMBER(1,0) NOT NULL);

-------揪團------

CREATE TABLE TEAM_MEN(
TMEM_NO VARCHAR2(10) NOT NULL,
MEM_NO VARCHAR2(10) NOT NULL,
TEAM_NO VARCHAR2(10) NOT NULL,
EVA VARCHAR2(600),
ACCEPTANCE_OPRICE NUMBER(1,0) NOT NULL,
MEN_STATE NUMBER(1,0) NOT NULL,
REV_STATE NUMBER(1,0) NOT NULL);

-------------揪團成員---------------

CREATE TABLE TEAM_MSG_REPORT(
MSGREP_NO VARCHAR2(10) NOT NULL,
MSG_NO VARCHAR2(10) NOT NULL,
MEM_NO VARCHAR2(10) NOT NULL,
RSN VARCHAR2(600) NOT NULL,
STATE NUMBER(1,0) NOT NULL);

-----------檢舉揪團留言----------

CREATE TABLE TEAM_MEN_REPORT(
MENREP_NO VARCHAR2(10) NOT NULL,
TMEM_NO VARCHAR2(10) NOT NULL,
MEM_NO VARCHAR2(10) NOT NULL,
RSN VARCHAR2(600) NOT NULL,
STATE NUMBER(1,0) NOT NULL);

--------檢舉揪團成員------



/* 會員照片牆 MEM_PIC */

CREATE TABLE MEM_PIC (
MEMPIC_NO VARCHAR2(10) NOT NULL ,
MEM_NO VARCHAR2(10) NOT NULL ,
PATH VARCHAR2(50) ,
IMGTEXT VARCHAR2(600) ,
UPDATED_AT TIMESTAMP NOT NULL ,
CREATED_AT TIMESTAMP NOT NULL
);

/* 會員照片按讚數 PIC_HITS */

CREATE TABLE PIC_HITS (
HITS_NO VARCHAR2(10) NOT NULL ,
MEMPIC_NO VARCHAR2(10) NOT NULL,
MEM_NO VARCHAR2(10) NOT NULL
);

/* 會員照片留言 PIC_REPLY */

CREATE TABLE PIC_REPLY (
REPLY_NO VARCHAR2(10) ,
MEMPIC_NO VARCHAR2(10) NOT NULL ,
MEM_NO VARCHAR2(10) NOT NULL ,
PARENT_ID VARCHAR2(10) ,
CONTENT VARCHAR2(600) ,
UPDATED_AT TIMESTAMP NOT NULL ,
CREATED_AT TIMESTAMP NOT NULL
);

/* 檢舉照片留言 REPORT_MSG */

CREATE TABLE REPORT_MSG (
REPMSG_NO VARCHAR2(10) NOT NULL ,
REPLY_NO VARCHAR2(10) NOT NULL ,
MEM_NO VARCHAR2(10) NOT NULL ,
CONTENT VARCHAR2(600) ,
STATE NUMBER(1,0) NOT NULL
);

/* 檢舉照片 PIC_REPORT */

CREATE TABLE PIC_REPORT (
PICREP_NO VARCHAR2(10) NOT NULL ,
MEMPIC_NO VARCHAR2(10) NOT NULL ,
MEM_NO VARCHAR2(10) NOT NULL ,
CONTENT VARCHAR2(600) ,
STATE NUMBER(1,0) NOT NULL
);

--

CREATE TABLE ACTIVITY (
  ACTIVITY_NO    VARCHAR2(10)  NOT NULL,
  ACTIVITY_NAME  VARCHAR2(200) NOT NULL,
  ACTIVITY_DESC  VARCHAR2(500) NOT NULL,
  BACKSTAGE_NO   VARCHAR2(10)  NOT NULL,
  CREATED_AT     TIMESTAMP          NOT NULL,
  UPDATED_AT     TIMESTAMP          NOT NULL,
  ACTIVE         NUMBER(1,0)   ,
  IMG_PATH       Varchar2(50)  NOT NULL,
  ACTIVITY_URL   Varchar2(200) NOT NULL);


CREATE TABLE ANNOUNCEMENT (
  ANC_NO         VARCHAR2(10)  NOT NULL,
  ANC_CON        VARCHAR2(1000) NOT NULL,
  BACKSTAGE_NO   VARCHAR2(10)  NOT NULL,
  CREATED_AT     TIMESTAMP          NOT NULL,
  UPDATED_AT     TIMESTAMP          NOT NULL,
  ACTIVE         NUMBER(1,0)   );


CREATE TABLE BACKSTAGE_ROLE (
  BR_NO          VARCHAR2(10)  NOT NULL,
  BR_NAME        VARCHAR2(100) ) ;


CREATE TABLE FILMREVIEW (
  FR_NO         VARCHAR2(10)  NOT NULL,
  MOVIE_NO       VARCHAR2(10) NOT NULL,
  CREATED_AT     TIMESTAMP          NOT NULL,
  UPDATED_AT     TIMESTAMP          NOT NULL,
  CONTENT        CLOB          NOT NULL,
  EVALUATION     NUMBER(2,1)   ,
  TITLE          VARCHAR2(300) NOT NULL,
  SOURCE         VARCHAR2(60)  ,
  URL            VARCHAR2(200) ,
  MEM_NO         VARCHAR2(10)  ,
  AUTHOR         VARCHAR2(60)  ,
  ACTIVE         NUMBER(1,0)   );


CREATE TABLE FILMREVIEW_MSG (
  FRM_NO         VARCHAR2(10)  NOT NULL,
  FR_NO          VARCHAR2(10)  NOT NULL,
  MEM_NO         VARCHAR2(10)  NOT NULL,
  CREATED_AT     TIMESTAMP          NOT NULL,
  UPDATED_AT     TIMESTAMP          NOT NULL,
  CONTENT        Varchar2(600) NOT NULL,
  PARENT_ID      VARCHAR2(10)  );


CREATE TABLE REPORT_FILMREVIEW_MSG (
  RFM_NO         VARCHAR2(10)  NOT NULL,
  FRM_NO         VARCHAR2(10)  NOT NULL,
  MEM_NO         VARCHAR2(10)  NOT NULL,
  STATE          NUMBER(1,0)   ,
  CONTENT        Varchar2(600) NOT NULL );


-------------會員---------------
CREATE TABLE MEMBER (
  MEM_NO      VARCHAR2(10)  NOT NULL,
  MEM_PW      VARCHAR2(200)  NOT NULL,
  FNAME       VARCHAR2(20)  NOT NULL,
  LNAME       VARCHAR2(20)  NOT NULL,
  IDNUM       VARCHAR2(10)  NOT NULL UNIQUE,
  GENDER      VARCHAR2(1),
  LOCNO       NUMBER,
  ADDR        VARCHAR2(100),
  PHONE       VARCHAR2(20),
  EMAIL       VARCHAR2(30)  NOT NULL,
  STATUS      NUMBER(1,0),
  TYPE        NUMBER(1,0),
  MEMIMG      BLOB,
  EXTNAME     VARCHAR2(20),
  BIRTHDAY    DATE,
  VIOLATION   NUMBER,
  INTRODUCTION VARCHAR2(600)
  );


-------------電影---------------
CREATE TABLE MOVIE(
    MOVIE_NO      VARCHAR2(10)   NOT NULL,
    MOVIE_TYPE    VARCHAR2(30),
    MOVIE_NAME    VARCHAR2(60),
    ENG_NAME      VARCHAR2(60),
    MOVIE_PIC     BLOB,
    RELASED       DATE,
    DISTRIBUTED   VARCHAR2(30),
    LENGTH        NUMBER,
    LANGUAGE      VARCHAR2(30),
    MADEIN        VARCHAR2(30),
    IMDB          NUMBER(2,1),
    TOMATO        VARCHAR2(20),
    RATING        VARCHAR2(20),
    TRAILER_URL   VARCHAR2(50),
    BRIEF_INTRO   VARCHAR2(4000),
    ACTIVE        NUMBER(1,0),
    DIRECTOR      VARCHAR2(20),
    STARRING      VARCHAR2(300)
);


-------------票房排行榜---------------
CREATE TABLE  BOX_OFFICE_CHARTS(
    RANKING_NO     VARCHAR2(10)     NOT NULL,
    MOVIE_NO       VARCHAR2(10)     NOT Null,
    STATISTICS     DATE,
    RANK           NUMBER,
    LOC            NUMBER
    );


-------------電影介紹(推薦文章)---------------
CREATE TABLE MOVIE_INTRODUCE(
    INTROD_NO   VARCHAR2(10) NOT NULL,
    MOVIE_NO    VARCHAR2(10),
    SOURCE      VARCHAR2(60),
    URL         VARCHAR2(200),
    AUTHOR      VARCHAR2(30),
    TITLE       VARCHAR2(300),
    CONTENT     CLOB,
    CREATED_AT  TIMESTAMP,
    UPDATED_AT  TIMESTAMP,
    ACTIVE      NUMBER(1,0),
    PHOTO_PATH  VARCHAR2(200),
    PHOTO_SMALL VARCHAR2(200)
);

-- ALTER TABLE MOVIE_INTRODUCE
--   MODIFY PHOTO_PATH VARCHAR2(200);
--
-- ALTER TABLE MOVIE_INTRODUCE
--   ADD PHOTO_SMALL VARCHAR2(200);
-------------電影追蹤清單---------------
CREATE TABLE MOVIE_TRACE_LIST(
	MEM_NO     VARCHAR2(10) NOT NULL,
	MOVIE_NO   VARCHAR2(10) NOT NULL
);


CREATE TABLE ACCOUNT_BACKSTAGE
(
  BS_ACC_NO VARCHAR2(10) NOT NULL,
  ROLE_NO VARCHAR2(10) NOT NULL,
  BS_ACC_NAME VARCHAR2(100) NOT NULL,
  CINEMA_NO VARCHAR2(10),
  BS_ACC_PSW VARCHAR2(200) NOT NULL,
  EMAIL VARCHAR2(300) NOT NULL,
  TEL VARCHAR2(200) NOT NULL,
  LAST_ONLINE_TIME TIMESTAMP NOT NULL,
  STATE NUMBER(1,0) NOT NULL
);


CREATE TABLE NAV_BACKSTAGE
(
  LISTITEM_NO VARCHAR2(10) NOT NULL,
  LISTITEM_NAME VARCHAR2(100) NOT NULL,
  URL VARCHAR2(400) NOT NULL,
  PARENT_ID VARCHAR2(10),
  ITEM_ORDER NUMBER(10) NOT NULL
);

CREATE TABLE ROLE_PERMISSION_BACKSTAGE
(
  PERMISSION_NO VARCHAR2(10) NOT NULL,
  ROLE_NO VARCHAR2(10) NOT NULL
);

CREATE TABLE INVITE_FRIEND
(
  INVITE_NO VARCHAR2(10) NOT NULL,
  FRIEND_NO VARCHAR2(10) NOT NULL,
  TEAM_NO VARCHAR2(10) NOT NULL
);

CREATE TABLE FREINDSHIP
(
  FRIENDSHIP_NO VARCHAR2(10) NOT NULL,
  MEM_NO VARCHAR2(10) NOT NULL,
  FRIEND_NO VARCHAR2(10) NOT NULL,
  STATE NUMBER(1,0) NOT NULL
);

-- CINEMA 影城 --
ALTER TABLE CINEMA ADD CONSTRAINT "CINEMA_NO_PK" PRIMARY KEY ("CINEMA_NO");

ALTER TABLE MOVIE ADD CONSTRAINT "MOVIE_NO_PK" PRIMARY KEY ("MOVIE_NO");

ALTER TABLE CINEMAMOVIE ADD CONSTRAINT "CINEMAMOVIE_PK" PRIMARY KEY ("CINEMA_NO", "MOVIE_NO");
ALTER TABLE CINEMAMOVIE ADD CONSTRAINT "CINEMAMOVIE_CINEMA_NO_FK" FOREIGN KEY ("CINEMA_NO") REFERENCES CINEMA ("CINEMA_NO") ON DELETE CASCADE
  ADD CONSTRAINT "CINEMAMOVIE_MOVIE_NO_FK" FOREIGN KEY ("MOVIE_NO") REFERENCES MOVIE ("MOVIE_NO") ON DELETE CASCADE;



ALTER TABLE MEMBER ADD CONSTRAINT "MEM_NO_PK" PRIMARY KEY ("MEM_NO");

ALTER TABLE BACKSTAGE_ROLE ADD CONSTRAINT "BR_NO_PK" PRIMARY KEY ("BR_NO");

ALTER TABLE NAV_BACKSTAGE ADD CONSTRAINT "LISTITEM_NO_PK" PRIMARY KEY ("LISTITEM_NO");
ALTER TABLE NAV_BACKSTAGE ADD CONSTRAINT "NAV_BACKSTAGE_PARENT_ID_FK" FOREIGN KEY ("PARENT_ID") REFERENCES NAV_BACKSTAGE ("LISTITEM_NO") ON DELETE CASCADE;

ALTER TABLE ACCOUNT_BACKSTAGE ADD CONSTRAINT "BS_ACC_NO_PK" PRIMARY KEY ("BS_ACC_NO");
ALTER TABLE ACCOUNT_BACKSTAGE ADD CONSTRAINT "ACCOUNT_BACKSTAGE_ROLE_NO_FK" FOREIGN KEY ("ROLE_NO") REFERENCES BACKSTAGE_ROLE ("BR_NO") ON DELETE CASCADE
  ADD CONSTRAINT "ACCOUNT_BACKSTAGE_CINEMA_NO_FK" FOREIGN KEY ("CINEMA_NO") REFERENCES CINEMA ("CINEMA_NO") ON DELETE CASCADE;

-- THEATER 影廳 --
ALTER TABLE THEATER ADD CONSTRAINT "THEATER_NO_PK" PRIMARY KEY ("THEATER_NO");
ALTER TABLE THEATER ADD CONSTRAINT "THEATER_CINEMA_NO_FK" FOREIGN KEY ("CINEMA_NO") REFERENCES CINEMA ("CINEMA_NO") ON DELETE CASCADE;

ALTER TABLE TICKETTYPE ADD CONSTRAINT "TICKETTYPE_NO_PK" PRIMARY KEY ("TICKETTYPE_NO");
ALTER TABLE TICKETTYPE ADD CONSTRAINT "TICKETTYPE_THEATER_NO_FK" FOREIGN KEY ("THEATER_NO") REFERENCES THEATER ("THEATER_NO") ON DELETE CASCADE;

ALTER TABLE MEAL ADD CONSTRAINT "MEAL_NO_PK" PRIMARY KEY ("MEAL_NO");
ALTER TABLE MEAL ADD CONSTRAINT "MEAL_CINEMA_NO_FK" FOREIGN KEY ("CINEMA_NO") REFERENCES CINEMA ("CINEMA_NO") ON DELETE CASCADE;

ALTER TABLE TICKET_ORDER ADD CONSTRAINT "ORDER_NO_PK" PRIMARY KEY ("ORDER_NO");
ALTER TABLE TICKET_ORDER ADD CONSTRAINT "TICKET_ORDER_MEM_NO_FK" FOREIGN KEY ("MEM_NO") REFERENCES MEMBER ("MEM_NO") ON DELETE CASCADE
  ADD CONSTRAINT "TICKET_ORDER_MEAL_NO_FK" FOREIGN KEY ("MEAL_NO") REFERENCES MEAL ("MEAL_NO") ON DELETE CASCADE;

ALTER TABLE MEAL_DETAILS ADD CONSTRAINT "MEAL_DETAILS_PK" PRIMARY KEY ("ORDER_NO", "MEAL_NO");
ALTER TABLE MEAL_DETAILS ADD CONSTRAINT "MEAL_DETAILS_ORDER_NO_FK" FOREIGN KEY ("ORDER_NO") REFERENCES TICKET_ORDER ("ORDER_NO") ON DELETE CASCADE
  ADD CONSTRAINT "MEAL_DETAILS_MEAL_NO_FK" FOREIGN KEY ("MEAL_NO") REFERENCES MEAL ("MEAL_NO") ON DELETE CASCADE;

ALTER TABLE PRIVATE_CHAT ADD CONSTRAINT "PRIVATE_CHAT_NO_PK" PRIMARY KEY ("PRIVATE_CHAT_NO");
ALTER TABLE PRIVATE_CHAT ADD CONSTRAINT "PRIVATE_CHAT_TRANS_MEM_NO_FK" FOREIGN KEY ("TRANS_MEM_NO") REFERENCES MEMBER ("MEM_NO") ON DELETE CASCADE
  ADD CONSTRAINT "PRIVATE_CHAT_RECEIVER_MEM_FK" FOREIGN KEY ("RECEIVER_MEM_NO") REFERENCES MEMBER ("MEM_NO") ON DELETE CASCADE;

ALTER TABLE SERVICE_CHAT ADD CONSTRAINT "CHAT_ID_PK" PRIMARY KEY ("CHAT_ID");
ALTER TABLE SERVICE_CHAT ADD CONSTRAINT "SERVICE_CHAT_BACKSTAGE_NO_FK" FOREIGN KEY ("BACKSTAGE_NO") REFERENCES ACCOUNT_BACKSTAGE ("BS_ACC_NO") ON DELETE CASCADE
  ADD CONSTRAINT "SERVICE_CHAT_MEM_NO_FK" FOREIGN KEY ("MEM_NO") REFERENCES MEMBER ("MEM_NO") ON DELETE CASCADE;

ALTER TABLE MOVIE_SESSION ADD CONSTRAINT "MOVIE_SESSION_NO_PK" PRIMARY KEY ("SESSION_NO");
ALTER TABLE MOVIE_SESSION ADD CONSTRAINT "MOVIE_SESSION_THEATER_NO_FK" FOREIGN KEY ("THEATER_NO") REFERENCES THEATER ("THEATER_NO") ON DELETE CASCADE
  ADD CONSTRAINT "MOVIE_SESSION_MOVIE_NO_FK" FOREIGN KEY ("MOVIE_NO") REFERENCES MOVIE ("MOVIE_NO") ON DELETE CASCADE;

ALTER TABLE TICKET_DETAIL ADD CONSTRAINT "TICKET_DETAIL_NO_PK" PRIMARY KEY ("TICKET_DETAIL_NO");
ALTER TABLE TICKET_DETAIL ADD CONSTRAINT "TICKET_DETAIL_ORDER_NO_FK" FOREIGN KEY ("ORDER_NO") REFERENCES TICKET_ORDER ("ORDER_NO") ON DELETE CASCADE
  ADD CONSTRAINT "TICKET_DETAIL_SESSION_NO_FK" FOREIGN KEY ("SESSION_NO") REFERENCES MOVIE_SESSION ("SESSION_NO") ON DELETE CASCADE
  ADD CONSTRAINT "TICKET_DETAIL_TICKETTYPE_NO_FK" FOREIGN KEY ("TICKETTYPE_NO") REFERENCES TICKETTYPE ("TICKETTYPE_NO") ON DELETE CASCADE;

ALTER TABLE FREINDSHIP ADD CONSTRAINT "FRIENDSHIP_NO_PK" PRIMARY KEY ("FRIENDSHIP_NO");
ALTER TABLE FREINDSHIP ADD CONSTRAINT "FREINDSHIP_MEM_NO_FK" FOREIGN KEY ("MEM_NO") REFERENCES MEMBER ("MEM_NO") ON DELETE CASCADE
  ADD CONSTRAINT "FREINDSHIP_FRIEND_NO_FK" FOREIGN KEY ("FRIEND_NO") REFERENCES MEMBER ("MEM_NO") ON DELETE CASCADE;

ALTER TABLE TEAM ADD CONSTRAINT "TEAM_NO_PK" PRIMARY KEY ("TEAM_NO");
ALTER TABLE TEAM ADD CONSTRAINT "TEAM_MEM_NO_FK" FOREIGN KEY ("MEM_NO") REFERENCES MEMBER ("MEM_NO") ON DELETE CASCADE
  ADD CONSTRAINT "TEAM_MOVIE_SESSION_NO_FK" FOREIGN KEY ("SESSION_NO") REFERENCES MOVIE_SESSION ("SESSION_NO") ON DELETE CASCADE;

ALTER TABLE INVITE_FRIEND ADD CONSTRAINT "INVITE_NO_PK" PRIMARY KEY ("INVITE_NO");
ALTER TABLE INVITE_FRIEND ADD CONSTRAINT "INVITE_FRIEND_FRIEND_NO_FK" FOREIGN KEY ("FRIEND_NO") REFERENCES MEMBER ("MEM_NO") ON DELETE CASCADE
  ADD CONSTRAINT "INVITE_FRIEND_TEAM_NO_FK" FOREIGN KEY ("TEAM_NO") REFERENCES TEAM ("TEAM_NO") ON DELETE CASCADE;

ALTER TABLE ROLE_PERMISSION_BACKSTAGE ADD CONSTRAINT "ROLE_PERMISSION_PK" PRIMARY KEY ("PERMISSION_NO", "ROLE_NO");
ALTER TABLE ROLE_PERMISSION_BACKSTAGE ADD CONSTRAINT "RP_PERMISSION_NO_FK" FOREIGN KEY ("PERMISSION_NO") REFERENCES NAV_BACKSTAGE ("LISTITEM_NO") ON DELETE CASCADE
  ADD CONSTRAINT "RP_ROLE_NO_FK" FOREIGN KEY ("ROLE_NO") REFERENCES BACKSTAGE_ROLE ("BR_NO") ON DELETE CASCADE;

ALTER TABLE BOX_OFFICE_CHARTS ADD CONSTRAINT "RANKING_NO_PK" PRIMARY KEY ("RANKING_NO");
ALTER TABLE BOX_OFFICE_CHARTS ADD CONSTRAINT "RANK_MOVIE_NO_FK" FOREIGN KEY ("MOVIE_NO") REFERENCES MOVIE ("MOVIE_NO") ON DELETE CASCADE;

ALTER TABLE MOVIE_TRACE_LIST ADD CONSTRAINT "MOVIE_TRACE_LIST_PK" PRIMARY KEY ("MEM_NO", "MOVIE_NO");
ALTER TABLE MOVIE_TRACE_LIST ADD CONSTRAINT "TRACE_LIST_MEM_NO_FK" FOREIGN KEY ("MEM_NO") REFERENCES MEMBER ("MEM_NO") ON DELETE CASCADE
  ADD CONSTRAINT "TRACE_LIST_MOVIE_NO_FK" FOREIGN KEY ("MOVIE_NO") REFERENCES MOVIE ("MOVIE_NO") ON DELETE CASCADE;

ALTER TABLE MOVIE_INTRODUCE ADD CONSTRAINT "INTROD_NO_PK" PRIMARY KEY ("INTROD_NO");
ALTER TABLE MOVIE_INTRODUCE ADD CONSTRAINT "MOVIE_INTRODUCE_MOVIE_NO_FK" FOREIGN KEY ("MOVIE_NO") REFERENCES MOVIE ("MOVIE_NO") ON DELETE CASCADE;

ALTER TABLE FILMREVIEW ADD CONSTRAINT "FR_NO_PK" PRIMARY KEY ("FR_NO");
ALTER TABLE FILMREVIEW ADD CONSTRAINT "FILMREVIEW_MOVIE_NO_FK" FOREIGN KEY ("MOVIE_NO") REFERENCES MOVIE ("MOVIE_NO") ON DELETE CASCADE
  ADD CONSTRAINT "FILMREVIEW_MEM_NO_FK" FOREIGN KEY ("MEM_NO") REFERENCES MEMBER ("MEM_NO") ON DELETE CASCADE;

ALTER TABLE FILMREVIEW_MSG ADD CONSTRAINT "FRM_NO_PK" PRIMARY KEY ("FRM_NO");
ALTER TABLE FILMREVIEW_MSG ADD CONSTRAINT "FRM_FR_NO_FK" FOREIGN KEY ("FR_NO") REFERENCES FILMREVIEW ("FR_NO") ON DELETE CASCADE
  ADD CONSTRAINT "FRM_MEM_NO_FK" FOREIGN KEY ("MEM_NO") REFERENCES MEMBER ("MEM_NO") ON DELETE CASCADE;

ALTER TABLE REPORT_FILMREVIEW_MSG ADD CONSTRAINT "RFM_NO_PK" PRIMARY KEY ("RFM_NO");
ALTER TABLE REPORT_FILMREVIEW_MSG ADD CONSTRAINT "REPORT_FRM_NO_FK" FOREIGN KEY ("FRM_NO") REFERENCES FILMREVIEW_MSG ("FRM_NO") ON DELETE CASCADE
  ADD CONSTRAINT "REPORT_MEM_NO_FK" FOREIGN KEY ("MEM_NO") REFERENCES MEMBER ("MEM_NO") ON DELETE CASCADE;

ALTER TABLE ANNOUNCEMENT ADD CONSTRAINT "ANC_NO_PK" PRIMARY KEY ("ANC_NO");
ALTER TABLE ANNOUNCEMENT ADD CONSTRAINT "ANC_BACKSTAGE_NO_FK" FOREIGN KEY ("BACKSTAGE_NO") REFERENCES ACCOUNT_BACKSTAGE ("BS_ACC_NO") ON DELETE CASCADE;

ALTER TABLE ACTIVITY ADD CONSTRAINT "ACTIVITY_NO_PK" PRIMARY KEY ("ACTIVITY_NO");
ALTER TABLE ACTIVITY ADD CONSTRAINT "ACTIVITY_BACKSTAGE_NO_FK" FOREIGN KEY ("BACKSTAGE_NO") REFERENCES ACCOUNT_BACKSTAGE ("BS_ACC_NO") ON DELETE CASCADE;

ALTER TABLE MEM_PIC ADD CONSTRAINT "MEMPIC_NO_PK" PRIMARY KEY ("MEMPIC_NO");
ALTER TABLE MEM_PIC ADD CONSTRAINT "MEM_PIC_MEM_NO_FK" FOREIGN KEY ("MEM_NO") REFERENCES MEMBER ("MEM_NO") ON DELETE CASCADE;

ALTER TABLE PIC_HITS ADD CONSTRAINT "HITS_NO_PK" PRIMARY KEY ("HITS_NO");
ALTER TABLE PIC_HITS ADD CONSTRAINT "PIC_HITS_MEMPIC_NO_FK" FOREIGN KEY ("MEMPIC_NO") REFERENCES MEM_PIC ("MEMPIC_NO") ON DELETE CASCADE
  ADD CONSTRAINT "PIC_HITS_MEM_NO_FK" FOREIGN KEY ("MEM_NO") REFERENCES MEMBER ("MEM_NO") ON DELETE CASCADE;

ALTER TABLE PIC_REPLY ADD CONSTRAINT "REPLY_NO_PK" PRIMARY KEY ("REPLY_NO");
ALTER TABLE PIC_REPLY ADD CONSTRAINT "PIC_REPLY_MEMPIC_NO_FK" FOREIGN KEY ("MEMPIC_NO") REFERENCES MEM_PIC ("MEMPIC_NO") ON DELETE CASCADE
  ADD CONSTRAINT "PIC_REPLY_MEM_NO_FK" FOREIGN KEY ("MEM_NO") REFERENCES MEMBER ("MEM_NO") ON DELETE CASCADE
  ADD CONSTRAINT "PIC_REPLY_PARENT_ID_FK" FOREIGN KEY ("PARENT_ID") REFERENCES PIC_REPLY ("REPLY_NO") ON DELETE CASCADE;

ALTER TABLE PIC_REPORT ADD CONSTRAINT "PICREP_NO_PK" PRIMARY KEY ("PICREP_NO");
ALTER TABLE PIC_REPORT ADD CONSTRAINT "PIC_REPORT_MEMPIC_NO_FK" FOREIGN KEY ("MEMPIC_NO") REFERENCES MEM_PIC ("MEMPIC_NO") ON DELETE CASCADE
  ADD CONSTRAINT "PIC_REPORT_MEM_NO_FK" FOREIGN KEY ("MEM_NO") REFERENCES MEMBER ("MEM_NO") ON DELETE CASCADE;

ALTER TABLE REPORT_MSG ADD CONSTRAINT "REPMSG_NO_PK" PRIMARY KEY ("REPMSG_NO");
ALTER TABLE REPORT_MSG ADD CONSTRAINT "REPORT_MSG_REPLY_NO_FK" FOREIGN KEY ("REPLY_NO") REFERENCES PIC_REPLY ("REPLY_NO") ON DELETE CASCADE
  ADD CONSTRAINT "REPORT_MSG_MEM_NO_FK" FOREIGN KEY ("MEM_NO") REFERENCES MEMBER ("MEM_NO") ON DELETE CASCADE;

ALTER TABLE MSG ADD CONSTRAINT "MSG_NO_PK" PRIMARY KEY ("MSG_NO");
ALTER TABLE MSG  ADD CONSTRAINT "MSG_MEM_NO_FK" FOREIGN KEY ("MEM_NO") REFERENCES MEMBER ("MEM_NO") ON DELETE CASCADE
  ADD CONSTRAINT "MSG_TEAM_NO_FK" FOREIGN KEY ("TEAM_NO") REFERENCES TEAM ("TEAM_NO") ON DELETE CASCADE
  ADD CONSTRAINT "MSG_PAR_NO_FK" FOREIGN KEY ("PAR_NO") REFERENCES MSG ("MSG_NO") ON DELETE CASCADE;

ALTER TABLE TEAM_MEN ADD CONSTRAINT "TMEM_NO_PK" PRIMARY KEY ("TMEM_NO");
ALTER TABLE TEAM_MEN ADD CONSTRAINT "TEAM_MEN_MEM_NO_FK" FOREIGN KEY ("MEM_NO") REFERENCES MEMBER ("MEM_NO") ON DELETE CASCADE
  ADD CONSTRAINT "TEAM_MEN_TEAM_NO_FK" FOREIGN KEY ("TEAM_NO") REFERENCES TEAM ("TEAM_NO") ON DELETE CASCADE;

ALTER TABLE TEAM_MEN_REPORT ADD CONSTRAINT "MENREP_NO_PK" PRIMARY KEY ("MENREP_NO");
ALTER TABLE TEAM_MEN_REPORT ADD CONSTRAINT "MENREP_TMEM_NO_FK" FOREIGN KEY ("TMEM_NO") REFERENCES TEAM_MEN ("TMEM_NO") ON DELETE CASCADE
  ADD CONSTRAINT "MENREP_MEM_NO_FK" FOREIGN KEY ("MEM_NO") REFERENCES MEMBER ("MEM_NO") ON DELETE CASCADE;

ALTER TABLE TEAM_MSG_REPORT ADD CONSTRAINT "MSGREP_NO_PK" PRIMARY KEY ("MSGREP_NO");
ALTER TABLE TEAM_MSG_REPORT ADD CONSTRAINT "MSGREP_MSG_NO_FK" FOREIGN KEY ("MSG_NO") REFERENCES MSG ("MSG_NO") ON DELETE CASCADE
  ADD CONSTRAINT "MSGREP_MEM_NO_FK" FOREIGN KEY ("MEM_NO") REFERENCES MEMBER ("MEM_NO") ON DELETE CASCADE;

/*
SELECT * FROM NLS_SESSION_PARAMETERS;

alter session set nls_date_format = 'yyyy/mm/dd hh24:mi:ss';

show parameter nls_date_format;
*/

/*
insert into CINEMA (CINEMA_NO, CINEMA_NAME) values ('C001', '威秀');
insert into MOVIE (MOVIE_NO) values ('M001');
insert into CINEMAMOVIE (CINEMA_NO, MOVIE_NO, START_DATE, END_DATE) values
 ('C001', 'M001',TO_DATE('2003/05/03 21:02:44', 'yyyy/mm/dd hh24:mi:ss') ,TO_DATE('2003/05/13', 'yyyy/mm/dd'));
*/

/*
ALTER TABLE CINEMAMOVIE
  MODIFY (START_DATE TIMESTAMP,
          END_DATE TIMESTAMP);

alter session set nls_timestamp_format = 'yyyy/mm/dd hh24:mi:ss';

show parameter nls_timestamp_format;

insert into CINEMA (CINEMA_NO, CINEMA_NAME) values ('C001', '威秀');
insert into MOVIE (MOVIE_NO) values ('M001');

insert into CINEMAMOVIE (CINEMA_NO, MOVIE_NO, START_DATE, END_DATE) values
 ('C001', 'M001', TO_TIMESTAMP('2003/05/03 21:02:44', 'yyyy/mm/dd hh24:mi:ss'), TO_TIMESTAMP('2003/05/13', 'yyyy/mm/dd'));
*/

-- insert into CINEMAMOVIE (CINEMA_NO, MOVIE_NO) values ('C001', 'M001'); --
/*
delete from cinema where cinema_no = 'C001';
delete from movie where movie_no = 'M001';
*/

/*
insert into MEMBER (MEM_NO, MEM_PW , FNAME ,LNAME,IDNUM ,EMAIL ) values ('M00001' ,'MEM_PW','FNAME' ,'LNAME' ,'IDNUM' ,'xxx@email.com');
insert into  MEM_PIC values ('MP0001','M00001','PATH','IMGTEXT',TO_TIMESTAMP('2003/05/03 21:02:44', 'yyyy/mm/dd hh24:mi:ss'),TO_TIMESTAMP('2003/05/03 21:02:44', 'yyyy/mm/dd hh24:mi:ss'));
*/

commit;
