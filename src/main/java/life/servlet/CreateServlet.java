
package life.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import life.dao.DataCreate;

@WebServlet("/player")
public class CreateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    protected void doPost(HttpServletRequest request,HttpServletResponse response)
    		throws ServletException, IOException {
    	
    	request.setCharacterEncoding("UTF-8");
    	
    	String players = request.getParameter("players");
    	
    	String[] playerNames = request.getParameterValues("playerName");

        // プレイヤーの名前をデータベースに保存
        if (playerNames != null) {

            for (int i = 0; i < playerNames.length; i++) {

                String id = String.valueOf(i + 1);
                String name = playerNames[i];

                DataCreate.create(id, name);
            }
        }

        response.sendRedirect(request.getContextPath() + "/jsp/maingame.jsp");
    }
}

