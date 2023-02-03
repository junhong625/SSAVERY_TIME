package com.ssafy.ssafytime.jdbc_connection;

import java.sql.*;
<<<<<<< HEAD
=======
import java.text.SimpleDateFormat;
import java.time.LocalDate;
>>>>>>> develop_AJH
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import static com.ssafy.ssafytime.api.controller.SurveyController.cnt;

public class DbConnector {
    private Connection conn;
    private static final String USERNAME = "root";
    private static final String PASSWORD = "ssafy";
    private static final String URL = "jdbc:mysql://localhost:3306/ssafy_web_db?serverTimezone=Asia/Seoul";

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
        conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
        PreparedStatement pstmt = null;
        String[] datetime = LocalDateTime.now().toString().split("T");
        String date = datetime[0].replace("-", "");
        String time = datetime[1].substring(0, 8).replace(":", "");
//        Faker faker = new Faker();
        try {
            System.out.println("start");
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, "SW 역량테스트 B형 검정 대비 특강 안내");
            pstmt.setString(2, "학습");
            pstmt.setString(3, "https://edu.ssafy.com/data/upload_files/namo/images/000050/20230127165313812_DHSATWRF.png");
            pstmt.setString(4, date);
            pstmt.setString(5, time);
            int result = pstmt.executeUpdate();
            if (result==1) {
                // 중계 테이블 삽입 데이터
                pstmt = conn.prepareStatement("insert into read_notice(notice_id, is_read, user_idx) values(?,?,?)");
                pstmt.setInt(1, 1);
                pstmt.setInt(2, 0);
                pstmt.setInt(3, 1);
                result = pstmt.executeUpdate();
                if (result==1) {
                    System.out.println("access");
                }
                else System.out.println("fail");
            }
        } catch (Exception e) {
            System.out.println(conn.prepareStatement(sql));
            System.out.println("fail");
            System.out.println(e);
        }
    }

//    public void insertUser()

    public void insertSchedule() throws SQLException{
        String sql = "insert into schedule(date, track_code, title, sub_title, start_time, end_time, category_id) values(?,?,?,?,?,?,?)";
        conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
        PreparedStatement pstmt = null;
        try {
            System.out.println("start");
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, "20230130");
            pstmt.setInt(2, 0);
            pstmt.setString(3, "팀별 PJT 진행");
            pstmt.setString(4, "공통 프로젝트");
            pstmt.setInt(5, 100000);
            pstmt.setInt(6, 180000);
            pstmt.setInt(7, 3);

            int result = pstmt.executeUpdate();
//            if (result==1) {
//                // 중계 테이블 삽입 데이터
//                pstmt = conn.prepareStatement("insert into read_notice(notice_id, is_read, user_id) values(?,?,?)");
//                pstmt.setInt(2, 2);
//                pstmt.setInt(2, 0);
//                pstmt.setInt(3, 1);
//                result = pstmt.executeUpdate();
//                System.out.println("access");
//            }
        } catch (Exception e) {
            System.out.println("fail");
            System.out.println(e);
        }
    }
    public static void main(LocalDateTime started_at, LocalDateTime ended_at) throws SQLException {
        DbConnector conn = new DbConnector();
<<<<<<< HEAD
//        conn.insertNotice();
        conn.insertSchedule();
        conn.updateStatus(started_at, ended_at);
=======
        conn.insertNotice();
//        conn.insertSchedule();
//        LocalDate date = LocalDate.now();
//        int weekDay = date.getDayOfWeek().getValue();
//        date = date.minusDays(weekDay - 1);
//        LocalDate end_date = date.plusDays(4);
//        System.out.println(date);
//        System.out.println(end_date);
>>>>>>> develop_AJH
    }
}
