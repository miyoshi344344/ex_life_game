package life.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import life.beans.Player;
import life.dao.DataSelect;

/**
 * Servlet implementation class MaingameServlet
 */
@WebServlet("/maingame")
public class MaingameServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MaingameServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
    	
    	List<Player> players = DataSelect.selectALL(getServletContext());
    	
		request.setAttribute("players", players);
        request.getRequestDispatcher("/jsp/maingame.jsp").forward(request, response);
	}
}
