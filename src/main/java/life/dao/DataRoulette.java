package life.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
public class DataRoulette {
	
	public static void update(String id, int tile) {
		
		Connection conn = null;
		PreparedStatement ps = null;
		
		try {
			conn = DatabaseManager.createConnection();
            String sql = "UPDATE players SET tile_id = tile_id + ?, turn = turn + 1 WHERE id = ?";
			ps = conn.prepareStatement(sql);
			
			ps.setInt(1, tile);
			ps.setInt(2, Integer.parseInt(id));
			
			int num = ps.executeUpdate();
			
			System.out.println(num + " record was updated.");
			
		} catch (Exception ex) {
			ex.printStackTrace();
			
	    } finally {
			DatabaseManager.destroy(ps);
			DatabaseManager.destroy(conn);
		}
	}
	
	public static String getNextPlayer() {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String id = null;
		try {
			conn = DatabaseManager.createConnection();
			
			String sql = "SELECT id FROM players ORDER BY turn ASC, id ASC LIMIT 1";
			
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			if (rs.next()) {
				id = rs.getString("id");
				}
			} catch (Exception ex) {
				ex.printStackTrace();
			} finally {
				DatabaseManager.destroy(rs);
				DatabaseManager.destroy(ps);
				DatabaseManager.destroy(conn);
		}
		return id;
	}
}