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


@WebServlet(name = "view", value = "/board/view.do")
public class ViewController extends HttpServlet {

//    지정한 글번호에 대한 상세 정보를 출력
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        HttpSession session = req.getSession();

        if(session.getAttribute("userId") != null) {
//        글번호 파라미터 값 가져오기
            int idx = Integer.parseInt(req.getParameter("idx"));

//        데이터 베이스 연결
            BoardDao dao = new BoardDao();
            dao.dbOpen();

//        글번호에 해당하는 글 상세 정보를 가져옴
            BoardDto board = dao.selectBoardDetail(idx);
            dao.updateVisitCount(idx);
            if (dao.dbIsOpen()) {
                dao.dbClose();
            }
//        request 영역에 가져온 데이터 저장
            req.setAttribute("board", board);

//        jsp 템플릿 파일을 호출하여 서버내에서 화면 이동
            req.getRequestDispatcher("/Board/View.jsp").forward(req, res);
        }
        else {
            JSFunction.alertLocation("로그인 후 이용해주세요","../Login/LoginForm.jsp", res);
        }

    }
}
