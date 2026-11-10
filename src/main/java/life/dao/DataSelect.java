package life.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;

import life.beans.Player;

public class DataSelect {

	public static List<Player> selectALL(ServletContext context) {
		
		List<Player> players = new ArrayList<>();
		
		Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try {
        	
        	conn = DatabaseManager.createConnection();
        	
        	String sql = "SELECT * FROM players ORDER BY id";
//        	↑これ"ORDER BY id"になってますがとりあえずの処置なのであんまり気にしないでください
        	
        	ps = conn.prepareStatement(sql);
        	
        	rs = ps.executeQuery();
        	
        	while (rs.next()) {
        		
        		Player player = new Player();
        		
        		player.setId(rs.getInt("id"));
        		player.setName(rs.getString("name"));
        		player.setMoney(rs.getInt("money"));
        		player.setTileId(rs.getInt("tile_id"));
        		player.setTurn(rs.getInt("turn"));
        		player.setAge(rs.getInt("age"));
        		
        		players.add(player);
        		
        	}
        	
        } catch (Exception ex) {
        	
        	ex.printStackTrace();
        	
        } finally {
        	
        	DatabaseManager.destroy(rs);
            DatabaseManager.destroy(ps);
            DatabaseManager.destroy(conn);
        	
        }
        
        return players;
        
	}

}
