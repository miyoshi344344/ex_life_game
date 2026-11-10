package life.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import life.dao.DatabaseManager;


@WebServlet("/number_of_people")
public class Number_of_people extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Number_of_people() {
        super();

    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "jdbc:sqlite:/Volumes/Macintosh HD/Users/Shared/db_server/life_game.db";
		
		String sql = "DELETE FROM players";
		
		try(Connection conn = DatabaseManager.createConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql)){
			
			pstmt.executeUpdate();
			
			 request.getRequestDispatcher("/jsp/Number_of_people.jsp").forward(request, response);
		} catch (ClassNotFoundException |SQLException e) {
			throw new ServletException("ゲームデータの初期化に失敗しました", e);
		}
       

	}

}
