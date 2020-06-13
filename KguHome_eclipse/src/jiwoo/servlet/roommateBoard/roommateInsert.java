package jiwoo.servlet.roommateBoard;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jiwoo.database.reviewBoard.reviewBoard;
import jiwoo.database.roommateBoard.roommateBoard;

@WebServlet("/roommateInsert")
public class roommateInsert extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String uid = request.getParameter("uid");

		roommateBoard rb = new roommateBoard();

		rb.insertRoommate(title,content,uid);

		response.sendRedirect("/index.html");
	}
}
