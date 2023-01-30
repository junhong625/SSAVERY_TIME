package com.ssafy.ssafytime.jdbc_connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.time.LocalDateTime;

public class DbConnector {
    private Connection conn;
    private static final String USERNAME = "root";
    private static final String PASSWORD = "ssafy";
    private static final String URL = "jdbc:mysql://localhost:3306/ssafy_web_db";

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
                pstmt = conn.prepareStatement("insert into read_notice(notice_id, is_read) values(?,?)");
                pstmt.setInt(1, 2);
                pstmt.setInt(2, 0);
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
    public static void main(String[] args) throws SQLException {
        DbConnector conn = new DbConnector();
        conn.insertNotice();
    }
}
