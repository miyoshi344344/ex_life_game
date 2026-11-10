package life.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
public class DataCreate {
	
	public static void create(String id, String name) {
		
		Connection conn = null;
		PreparedStatement ps = null;
		
		try {
			conn = DatabaseManager.createConnection();
			String sql = "INSERT INTO players (id, name) VALUES (?, ?)";
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, id);
			ps.setString(2, name);

            int num = ps.executeUpdate();

            System.out.println(num + " record was inserted.");

        } catch (Exception ex) {
            ex.printStackTrace();

        } finally {
            DatabaseManager.destroy(ps);
            DatabaseManager.destroy(conn);
        }
    }
}

