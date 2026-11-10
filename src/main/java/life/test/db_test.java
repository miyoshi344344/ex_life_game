package life.test;

import java.sql.Connection;

import life.dao.DatabaseManager;

public class db_test {

	public static void main(String[] args) {
        Connection conn = null;
        try {
            // データベース・コネクションを生成する
            conn = DatabaseManager.createConnection();
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            // データベース・コネクションを破棄する
            DatabaseManager.destroy(conn);
        }
    }

}
