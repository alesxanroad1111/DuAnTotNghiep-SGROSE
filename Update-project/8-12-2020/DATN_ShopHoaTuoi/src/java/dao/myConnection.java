
package dao;

import java.sql.Connection;
import java.sql.DriverManager;


public class myConnection {

    public myConnection() {
    }
    public Connection getConnect() {
        Connection cn = null;
        try {
            String url = "jdbc:sqlserver://localhost:1433;databasename=SG_Rose";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            cn = DriverManager.getConnection(url, "sa", "1234");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cn;
    }
}
