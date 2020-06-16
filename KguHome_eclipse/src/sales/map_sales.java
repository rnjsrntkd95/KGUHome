package sales;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.DBcon;

/**
 * Servlet implementation class map_sales
 */
@WebServlet("/index")
public class map_sales extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public map_sales() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Statement stmt;
		ResultSet res;
		
		ArrayList<String> posts = new ArrayList<String>();
		try {
			DBcon db = new DBcon();
			

			String sql = String.format("SELECT * FROM ROOMBOARD");
			
			stmt = db.con.createStatement();
			res = stmt.executeQuery(sql);
			
			while(res.next()) {
				String[] info = new String[8];
				
				posts.add(res.getString("title"));
				posts.add(res.getString("deposit"));
				posts.add(res.getString("rent"));
				posts.add(res.getString("latitude"));
				posts.add(res.getString("longitude"));
				posts.add(res.getString("date"));
				posts.add(res.getString("id"));

			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		
		request.setAttribute("posts", posts);
		RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
