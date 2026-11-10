package life.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * タイトル画面を表示する。
 * オプション画面の「戻る」ボタンなどから呼ばれる。
 */
@WebServlet("/title")
public class TitleServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 表示するだけなので、処理はせずにJSPへ転送する
        request.getRequestDispatcher("/jsp/title.jsp").forward(request, response);
    }
}
