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

@WebServlet(name = "edit", value = "/board/edit.do")
public class EditController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

//    글 번호를 파라미터값으로 가져옴
        int idx = Integer.parseInt(req.getParameter("idx"));

//    데이터 베이스 연결
        BoardDao dao = new BoardDao();
        dao.dbOpen();

//    글 번호에 대한 상세 정보를 가져옴
        req.setAttribute("board", dao.selectBoardDetail(idx));


        req.getRequestDispatcher("/Board/Edit.jsp").forward(req, res);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
//    수정할 정보를 파라미터 값으로 가져옴
        HttpSession session = req.getSession();
        String title = req.getParameter("title");
        String content = req.getParameter("content");
        int idx = Integer.parseInt(req.getParameter("idx")); // 데이터를 수정할 글번호
        String id = req.getParameter("name");
        String chkId = (String) session.getAttribute("userId");

        //    가져온 정보를 DTO 타입으로 저장
        BoardDto board = new BoardDto();
        board.setIdx(idx);
        board.setTitle(title);
        board.setContent(content);

        BoardDao dao =  new BoardDao();

        dao.dbOpen();

        int result = dao.updateBoard(board);

        dao.dbClose();

        if (id.equals(chkId)) {

            if (result == 1) {
                JSFunction.alertLocation("글이 수정되었습니다.", "/board/list.do", res);
            }
            else {
                JSFunction.alertBack("수정에 실패했습니다.", res);
            }
        }
        else {
            JSFunction.alertBack("수정 권한이 없습니다",res);
        }


//        res.sendRedirect("/board/list.do");

    }
}