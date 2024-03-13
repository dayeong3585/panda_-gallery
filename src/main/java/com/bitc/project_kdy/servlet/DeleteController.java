package com.bitc.project_kdy.servlet;

import com.bitc.project_kdy.database.BoardDao;
import com.bitc.project_kdy.database.BoardDto;
import com.bitc.project_kdy.utils.JSFunction;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet(name="delete", value = "/board/delete.do")
public class DeleteController extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        HttpSession session = req.getSession();
        int idx = Integer.parseInt(req.getParameter("idx"));
        String id = req.getParameter("id");
        String chkId = (String) session.getAttribute("userId");
        BoardDao dao = new BoardDao();
        dao.dbOpen();

        int result = dao.deleteBoard(idx);

        dao.dbClose();

        if (id.equals(chkId)) {

            if (result == 1) {
                JSFunction.alertLocation("글이 삭제되었습니다.", "/board/list.do", res);
            }
            else {
                JSFunction.alertBack("삭제에 실패했습니다.", res);
            }
        }
        else {
            JSFunction.alertBack("삭제 권한이 없습니다",res);
        }
//        req.getRequestDispatcher("/board/list.do").forward(req, res);
    }
}
