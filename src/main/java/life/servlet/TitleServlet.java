package life.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import life.dao.data_check;

/**
 * タイトル画面を表示する。
 * セーブデータがあるかを調べて、コンティニューを押せるかどうかを JSP に渡す。
 */
@WebServlet("/title")
public class TitleServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        boolean hasSaveData;
        try {
            hasSaveData = data_check.hasPlayers();
        } catch (Exception ex) {
            // DB に問題があるときは、エラー画面にせずに 500 エラーとして扱う
            throw new ServletException("セーブデータの確認に失敗しました", ex);
        }

        request.setAttribute("hasSaveData", hasSaveData);
        request.getRequestDispatcher("/jsp/title.jsp").forward(request, response);
    }
}
