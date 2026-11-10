package life.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/human_count")
public class Human_count extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Human_count() {
        super();

    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String players = request.getParameter("players");
		
		request.setAttribute("players", players);
		
		request.getRequestDispatcher("/jsp/Create.jsp").forward(request, response);
	}

}
