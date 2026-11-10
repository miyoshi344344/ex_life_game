package life.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * players テーブルを操作する。
 */
public class DataCheck {

    /**
     * プレイヤーのデータが1件以上あるか（続きから遊べるか）を調べる。
     *
     * @return 1件以上あれば true
     */
    public static boolean hasPlayers() throws ClassNotFoundException, SQLException {

        String sql = "SELECT COUNT(*) FROM players";

        try (Connection conn = DatabaseManager.createConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            // COUNT(*) は必ず1行返ってくるので、next() してから1列目を読む
            rs.next();
            return rs.getInt(1) > 0;
        }
    }
}