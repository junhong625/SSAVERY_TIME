package com.ssafy.ssafytime.jdbc_connection;

import java.sql.*;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Random;

import static com.ssafy.ssafytime.api.controller.SurveyController.cnt;

public class DbConnector {
    private Connection conn;
    private static final String USERNAME = "root";
    private static final String PASSWORD = "ssafy";
    private static final String URL = "jdbc:mysql://i8a602.p.ssafy.io:3306/ssafy_web_db?useUnicode=true&characterEncoding=utf8&serverTimezone=Asia/Seoul&zeroDateTimeBehavior=convertToNull&rewriteBatchedStatements=true";

    public DbConnector() {
        try {
            System.out.println("create");
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
            System.out.println("connect");
        } catch (Exception e) {
            System.out.println("connect fail");
            System.out.println(e);
        }
    }

    public void updateStatus(LocalDateTime started_at, LocalDateTime ended_at) throws SQLException {
        Statement stmt = null;
        stmt = conn.createStatement();

        conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
        String startedAt = started_at.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm"));
        String endedAt = ended_at.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm"));
        try {
            stmt.executeUpdate("CREATE EVENT surveyStatusChange" + ++cnt + " \n" +
                    "on schedule \n" +
                    "at " + "'" + startedAt + "'" +
                    "\n do \n" +
                    "\tupdate survey \n" +
                    "    set status = 1" +
                    "\n where status = 0" +
                    ";");
            stmt.executeUpdate("CREATE EVENT surveyStatusChange" + ++cnt + " \n" +
                    "on schedule \n" +
                    "at " + "'" + endedAt + "'" +
                    "\n do \n" +
                    "\tupdate survey \n" +
                    "    set status = 2" +
                    "\n where status = 1" +
                    ";");
            stmt.close();
            conn.close();
        } catch (Exception e) {
            System.out.println("fail");
            System.out.println(e);
        }
    }

    public void insertNotice() throws SQLException {
        String sql = "insert into notice(title, category, content_url, create_date, create_time) values(?,?,?,?,?)";
        PreparedStatement pstmt = null;
//        Faker faker = new Faker();
        try {
            System.out.println("start");
            Random random = new Random();
            pstmt = conn.prepareStatement(sql);
            String[] categoryList = {"운영", "기타", "학습"};
            String[] imageUrlList = {"https://edu.ssafy.com/data/upload_files/namo/images/000049/20230105084050171_3XDOBL5E.png", "https://edu.ssafy.com/data/upload_files/namo/images/000049/20230112120218169_3U0ALM0U.png", "https://edu.ssafy.com/data/upload_files/namo/images/000049/20230118193407840_JZFV852T.png", "https://edu.ssafy.com/data/upload_files/namo/images/000050/20230127101047618_A4N610TL.png", "https://edu.ssafy.com/data/upload_files/namo/images/000050/20230202114009880_IB8SOFKP.png"};
            LocalDateTime localDateTime = LocalDateTime.now();
            for (int i=0; i < 5; i++) {
                pstmt.setString(1, "2학기 공통프로젝트 "+(i+1)+"주차 안내");
                pstmt.setString(2, categoryList[random.nextInt(3)]);
                pstmt.setString(3, imageUrlList[i]);
                String[] datetime = localDateTime.toString().split("T");
                String date = datetime[0].replace("-", "");
                String time = datetime[1].substring(0, 8).replace(":", "");
                pstmt.setString(4, date);
                pstmt.setString(5, time);
                pstmt.executeUpdate();
                localDateTime = localDateTime.plusDays(i + 1).plusSeconds(i + 123);
            }
            System.out.println("Insert Complete");
        } catch (Exception e) {
            System.out.println(conn.prepareStatement(sql));
            System.out.println("fail");
            System.out.println(e);
        }
    }


    public void insertScheduleCategory() throws SQLException {
        String sql = "insert into schedule_category(category) values(?)";
        String[] categoryList = {"알고리즘", "코딩과정", "프로젝트", "기타"};
        try {
            PreparedStatement pstmt = conn.prepareStatement(sql);
            for (String category:categoryList) {
                pstmt.setString(1, category);
                pstmt.executeUpdate();
            }
            System.out.println("Insert Complete");
        } catch (Exception e) {
            System.out.println("Insert Fail");
        }
    }

    /* 한 주간의 Fake 시간표 데이터를 집어 넣는 함수
    date : FakeData를 생성하고 싶은 주의 월요일 날짜 입력(format=yyyymmdd)
     */
    public void insertSchedule(String date) throws SQLException{
        PreparedStatement pstmt = null;
        Random random = new Random();
        String sql = "insert into schedule(date, track_code, title, sub_title, start_time, end_time, category_id, on_off) values(?,?,?,?,?,?,?,?)";
        String[] title = {"팀별 PJT 진행", "[LIVE] Back-End", " [LIVE] Front-End", "취업 특강"};
        LocalDate stdDate = LocalDate.of(Integer.parseInt(date.substring(0,4)), Integer.parseInt(date.substring(4,6)), Integer.parseInt(date.substring(6,8)));
        try {
            System.out.println("start");
            pstmt = conn.prepareStatement(sql);
            for (int i=0; i < 5; i++) {
                for (int j=0; j < 5; j++) {
                    int startTime = 9;
                    pstmt.setString(1, stdDate.toString().replace("-", ""));
                    pstmt.setInt(2, j);
                    pstmt.setString(4, "공통 프로젝트");
                    while (startTime < 12) {
                        pstmt.setString(3, title[random.nextInt(4)]);
                        pstmt.setInt(5, startTime);
                        startTime = startTime + random.nextInt(4) + 1;
                        if (startTime > 12)
                            startTime = 12;
                        pstmt.setInt(6, startTime);
                        pstmt.setLong(7, random.nextInt(4)+1);
                        pstmt.setInt(8, random.nextInt(2));
                        pstmt.executeUpdate();
                    }
                    startTime = 13;
                    while (startTime < 18) {
                        pstmt.setString(3, title[random.nextInt(4)]);
                        pstmt.setInt(5, startTime);
                        startTime = startTime + random.nextInt(4) + 1;
                        if (startTime > 18)
                            startTime = 18;
                        pstmt.setInt(6, startTime);
                        pstmt.setLong(7, random.nextInt(4)+1);
                        pstmt.setInt(8, random.nextInt(2));
                        pstmt.executeUpdate();
                    }
                }
                stdDate = stdDate.plusDays(1);
            }
            System.out.println("Insert Complete");
        } catch (Exception e) {
            System.out.println("fail");
            System.out.println(e);
        }
    }

    public static void main(String[] args) throws SQLException {
        DbConnector db = new DbConnector();
//        db.insertScheduleCategory(); /*시간표 카테고리가 존재하지 않을 경우에만 실행*/
        db.insertSchedule("20230206");
        db.insertNotice();
    }
    public static void main(LocalDateTime started_at, LocalDateTime ended_at) throws SQLException {
        DbConnector conn = new DbConnector();
//        conn.insertNotice();
//        conn.updateStatus(started_at, ended_at);
//        LocalDate date = LocalDate.now();
//        int weekDay = date.getDayOfWeek().getValue();
//        date = date.minusDays(weekDay - 1);
//        LocalDate end_date = date.plusDays(4);
//        System.out.println(date);
//        System.out.println(end_date);
    }
}
