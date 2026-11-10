package life.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import life.dao.DataCheck;

/**
 * タイトル画面の「コンティニュー」から呼ばれ、続きからゲームを始める。
 */
@WebServlet("/continue")
public class ContinueServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        boolean hasSaveData;
        try {
            hasSaveData = DataCheck.hasPlayers();
        } catch (Exception ex) {
            throw new ServletException("セーブデータの確認に失敗しました", ex);
        }

        // URL を直接打たれた場合などに備えて、ここでも確認する
        if (!hasSaveData) {
            response.sendRedirect(request.getContextPath() + "/title");
            return;
        }

        // TODO: ゲーム画面ができたら、そこへ移動する
        response.sendRedirect(request.getContextPath() + "/maingame");
    }
}