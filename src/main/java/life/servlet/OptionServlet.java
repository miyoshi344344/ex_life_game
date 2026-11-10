package life.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * タイトル画面の「オプション」ボタンから呼ばれ、オプション画面を表示する。
 */
@WebServlet("/option")
public class OptionServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // オプション画面（見た目だけ）なので、処理はせずにJSPへ転送するだけ
    	request.getRequestDispatcher("/jsp/option.jsp").forward(request, response);
    }
}