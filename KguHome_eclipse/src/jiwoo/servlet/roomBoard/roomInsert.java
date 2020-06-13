package jiwoo.servlet.roomBoard;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jiwoo.database.infoBoard.infoBoard;
import jiwoo.database.roomBoard.roomBoard;

@WebServlet("/roomInsert")
public class roomInsert extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String deposit = request.getParameter("deposit");
		String rent = request.getParameter("rent");
		String latitude = request.getParameter("latitude");
		String longitude = request.getParameter("longitude");
		String uid = request.getParameter("uid");

		roomBoard rb = new roomBoard();

		rb.insertRoom(title,content,uid,deposit,rent,latitude,longitude);

		response.sendRedirect("/index.html");
	}
}
