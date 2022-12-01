package common;

import dao.BoardDao;
import dto.BoardDto;
import dto.CommentDto;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;


@WebServlet("/common/CommentList.do")
public class CommentList extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int boardIdx = Integer.parseInt(req.getParameter("idx"));
        BoardDao dao = new BoardDao();
        ArrayList<CommentDto> clist = dao.listComment(boardIdx);
//        블로그에서는 여기에 뭔가를 넣어놓음

        req.setAttribute("clist",clist);
        RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-APP/boardDetail.jsp");
        dispatcher.forward(req, resp);
    }
}

