package life.test;

import java.sql.Connection;
import java.sql.Statement;

import life.dao.DatabaseManager;


public class PlayerDelete {

    public static void main(String[] args) {

        try (Connection conn = DatabaseManager.createConnection();
             Statement st = conn.createStatement()) {

            int count = st.executeUpdate("DELETE FROM players");

            System.out.println(count + " 件のプレイヤーを削除しました");

        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
}

//プレイヤーのデータ消すやつね。特定のやつ消すようにはできてないから気をつけてね。