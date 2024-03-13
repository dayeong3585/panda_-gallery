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

//get 방식으로 연결 시 글쓰기 form 페이지를 출력
//post 방식으로 연결 시 view는 없고 데이터 베이스에 글을 등록하는 프로세스가 동작
@WebServlet(name = "write", value = "/board/write.do")
public class WriteController extends HttpServlet {

//    단순 view 페이지 출력
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        HttpSession session = req.getSession();
        
        if(session.getAttribute("userId") != null) {
            req.getRequestDispatcher("/Board/Write.jsp").forward(req, res);
        }
        else {
            JSFunction.alertLocation("로그인 후 이용해주세요","../Login/LoginForm.jsp", res);
        }
                
        }

//    데이터 베이스에 글 등록 프로세스
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
//        파라미터 값 가져오기
        BoardDto board = new BoardDto();
        board.setTitle(req.getParameter("title"));
        board.setId(req.getParameter("id"));
        board.setContent(req.getParameter("content"));

//        DB연결
        BoardDao dao = new BoardDao();
        dao.dbOpen();
//        DB에 데이터 추가
        int result = dao.insertBoard(board);
        if (dao.dbIsOpen()) {
            dao.dbClose();
        }

//        리다이렉트로 list.do로 이동
        if (result == 1) {
            JSFunction.alertLocation("글이 등록되었습니다.", "/board/list.do", res);
        }
        else {
            JSFunction.alertBack("글쓰기에 실패했습니다.", res);
        }
    }
}
