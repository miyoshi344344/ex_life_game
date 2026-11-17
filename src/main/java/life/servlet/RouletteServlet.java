package life.servlet;

import java.io.IOException;
import java.util.concurrent.ThreadLocalRandom;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import life.dao.DataRoulette;

@WebServlet("/roulette")
public class RouletteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    	request.setCharacterEncoding("UTF-8");
    	
    	String id = DataRoulette.getNextPlayer();
    	
    	int tile = ThreadLocalRandom.current().nextInt(1, 7);
    	
    	DataRoulette.update(id, tile);

		response.getWriter().print(tile);
	}
}
