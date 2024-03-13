package com.bitc.project_kdy.database;

import jakarta.servlet.ServletContext;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BoardDao extends JDBConnect {

    public BoardDao() {
    }

    public BoardDao(ServletContext app) {
        super(app);
    }

    public BoardDao(String dbDriver, String dbUrl, String dbUserId, String dbUserPw) {
        super(dbDriver, dbUrl, dbUserId, dbUserPw);
    }

//    //    전체 리스트 가져오기
//    public List<BoardDto> selectBoardList() {
//        List<BoardDto> boardList = new ArrayList<>();
//
//        try {
//            String sql = "select idx,title,id,postdate,visitcount ";
//            sql += "from tb_board ";
//            sql += "order by idx desc ";
//            stmt = conn.createStatement();
//            rs = stmt.executeQuery(sql);
//
//            while (rs.next()) {
//                BoardDto board = new BoardDto();
//
//                board.setIdx(rs.getInt("idx"));
//                board.setTitle(rs.getString("title"));
//                board.setId(rs.getString("id"));
//                board.setPostdate(rs.getString("postdate"));
//                board.setVisitcount(rs.getInt("visitcount"));
//
//                boardList.add(board);
//            }
//        } catch (SQLException e) {
//            printErrorMessage("조회", e.getMessage());
//        }
//
//        return boardList;
//    }

    //  전체 게시물 목록 가져오기 (페이징 기능 추가)
    public List<BoardDto> selectBoardListPaging(int startNum, int postSize) {
        List<BoardDto> boardList = new ArrayList<>();

        try {
            String sql = "SELECT idx, title, id, postdate, visitcount ";
            sql += "FROM tb_board ";
            sql += "ORDER BY idx DESC ";
            sql += "LIMIT ?, ? "; // LIMIT를 사용하여 지정한 index부터 지정한 수만큼 데이터를 조회하여 가져옴

            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, startNum); // 데이터를 가져오기 시작할 index, index는 0부터 시작
            pstmt.setInt(2, postSize); // 가져올 데이터 수 지정

            rs = pstmt.executeQuery();

            while (rs.next()) {
                BoardDto board = new BoardDto();

                board.setIdx(rs.getInt("idx"));
                board.setTitle(rs.getString("title"));
                board.setId(rs.getString("id"));
                board.setPostdate(rs.getString("postdate"));
                board.setVisitcount(rs.getInt("visitcount"));

                boardList.add(board);
            }
        }
        catch (SQLException e) {
            printErrorMessage("조회", e.getMessage());
        }

        return boardList;
    }

    //    글 등록(기본 글 등록)
    public int insertBoard(BoardDto board) {
        int result = 0;

        try {
            String sql = "insert into tb_board(title,content,id,postdate) ";
            sql += "values(?,?,?,now()) ";

            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, board.getTitle());
            pstmt.setString(2, board.getContent());
            pstmt.setString(3, board.getId());

            result = pstmt.executeUpdate();

        } catch (SQLException e) {
            printErrorMessage("등록", e.getMessage());
        }

        return result;

    }


    //    상세 글 보기
    public BoardDto selectBoardDetail(int idx) {
        BoardDto board = new BoardDto();

        try {
            String sql = "select idx,title,content,id,postdate,visitcount ";
            sql += "from tb_board ";
            sql += "where idx = ?";


            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, idx);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                board.setIdx(rs.getInt("idx"));
                board.setTitle(rs.getString("title"));
                board.setContent(rs.getString("content"));
                board.setId(rs.getString("id"));
                board.setVisitcount(rs.getInt("visitcount"));
                board.setPostdate(rs.getString("postdate"));
            }

        } catch (SQLException e) {
            printErrorMessage("조회", e.getMessage());
        }

        return board;
    }

    //    글 수정(기본 글 수정)
    public int updateBoard(BoardDto board) {

        int result = 0;

        try {
            String sql = "update tb_board set title = ?,content = ? ";
            sql += "where idx = ?";


            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, board.getTitle());
            pstmt.setString(2, board.getContent());
            pstmt.setInt(3, board.getIdx());

            result = pstmt.executeUpdate();

        }
        catch (SQLException e) {
            printErrorMessage("수정", e.getMessage());
        }

        return result;

    }

    //    글 삭제
    public int deleteBoard(int idx) {

        int result = 0;

        try {
            String sql = "delete from tb_board where idx = ? ";

            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, idx);

            result = pstmt.executeUpdate();
        }
        catch (SQLException e) {
            printErrorMessage("삭제", e.getMessage());
        }

        return result;

    }

    //    글 조회수 증가
    public void updateVisitCount(int idx) {

        try {
            String sql = "update tb_board set visitcount = visitcount + 1 where idx = ? ";

            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, idx);

            pstmt.executeUpdate();

        }
        catch (SQLException e) {
            printErrorMessage("수정", e.getMessage());
        }

    }

    //    첨부 파일 다운로드 수 증가
    public void updateDownCount(int idx) {

        try {
            String sql = "update tb_board set downcount = downcount + 1 where idx = ? ";

            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, idx);

            pstmt.executeUpdate();

        }
        catch (SQLException e) {
            printErrorMessage("수정", e.getMessage());
        }

    }

    private void printErrorMessage(String userMsg, String errMsg) {
        System.out.println("\n******************************\n");
        System.out.println("데이터 베이스 " + userMsg + " 중 오류가 발생했습니다.");
        System.out.println("오류 내용 : " + errMsg);
        System.out.println("\n******************************\n");
    }

    //  전체 게시물 수 가져오기
    public int totalCount() {
        int result = 0;

        try {
            String sql = "SELECT COUNT(*) AS cnt FROM tb_board ";

            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);

            while (rs.next()) {
                result = rs.getInt("cnt");
            }
        }
        catch (SQLException e) {
            printErrorMessage("조회", e.getMessage());
        }

        return result;
    }

}
