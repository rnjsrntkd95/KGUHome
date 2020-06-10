package jiwoo.servlet.reviewBoard;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jiwoo.database.reviewBoard.reviewBoard;

@WebServlet("/reviewInsert")
public class reviewInsert extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		String title = request.getParameter("title");
		String content = request.getParameter("content");

		reviewBoard rb = new reviewBoard();

		rb.insertReview(title,content);

		response.sendRedirect("/index.html");
	}
}
