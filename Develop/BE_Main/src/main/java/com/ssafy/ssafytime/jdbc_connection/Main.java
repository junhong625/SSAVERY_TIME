package com.ssafy.ssafytime.jdbc_connection;

import java.sql.SQLException;

public class Main {
    public static void main(String[] args) throws SQLException {
        DbConnector conn = new DbConnector();
        conn.insertNotice();
    }
}
