package com.ssafy.ssafytime.jdbc_connection;

import java.sql.*;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

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
        conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
        PreparedStatement pstmt = null;
        String[] datetime = LocalDateTime.now().toString().split("T");
        String date = datetime[0].replace("-", "");
        String time = datetime[1].substring(0, 8).replace(":", "");
//        Faker faker = new Faker();
        try {
            System.out.println("start");
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, "2학기 공통프로젝트 5주차 안내");
            pstmt.setString(2, "운영");
            pstmt.setString(3, "https://edu.ssafy.com/data/upload_files/namo/images/000050/20230202114009880_IB8SOFKP.png");
            pstmt.setString(4, date);
            pstmt.setString(5, time);
            pstmt.executeUpdate();
        } catch (Exception e) {
            System.out.println(conn.prepareStatement(sql));
            System.out.println("fail");
            System.out.println(e);
        }
    }

//    public void insertUser()

    public void insertSchedule() throws SQLException{
        conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
        PreparedStatement pstmt = null;
        String sql = "insert into schedule(date, track_code, title, sub_title, start_time, end_time, category_id, on_off) values(?,?,?,?,?,?,?,?)";
        try {
            System.out.println("start");
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, "20230210");
            pstmt.setInt(2, 0);
            pstmt.setString(3, "종료 미팅");
            pstmt.setString(4, "공통 프로젝트");
            pstmt.setInt(5, 17);
            pstmt.setInt(6, 18);
            pstmt.setLong(7, 3);
            pstmt.setInt(8, 1);
            /* SELECT문
            pstmt = conn.prepareStatement("select * from schedule_category");
            System.out.println("start query");
            ResultSet rs = pstmt.executeQuery();
//            System.out.println(rs.next());
            while (rs.next()) {
                int a = rs.getInt("id");
                String b = rs.getString("category");
                System.out.println(a + " : " + b);
            }

             */

            pstmt.executeUpdate();
        } catch (Exception e) {
            System.out.println("fail");
            System.out.println(e);
        }
    }

    public static void main(String[] args) throws SQLException {
        DbConnector conn = new DbConnector();
        conn.insertNotice();
    }
    public static void main(LocalDateTime started_at, LocalDateTime ended_at) throws SQLException {
        DbConnector conn = new DbConnector();
//        conn.insertNotice();
        conn.insertSchedule();
//        conn.updateStatus(started_at, ended_at);
//        LocalDate date = LocalDate.now();
//        int weekDay = date.getDayOfWeek().getValue();
//        date = date.minusDays(weekDay - 1);
//        LocalDate end_date = date.plusDays(4);
//        System.out.println(date);
//        System.out.println(end_date);
    }
}
