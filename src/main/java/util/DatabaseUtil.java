package util;
import java.sql.*;

public class DatabaseUtil {
    public static Connection getConnection() {
        try {
            String url = "jdbc:mysql://localhost:3306/jsp";
            String uid = "root";
            String upw = "1234";
            Class.forName("com.mysql.cj.jdbc.Driver");

            return DriverManager.getConnection(url, uid, upw);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
