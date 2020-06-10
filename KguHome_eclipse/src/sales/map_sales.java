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
		
		ArrayList<String[]> posts = new ArrayList<String[]>();
		try {
			DBcon db = new DBcon();
			

			String sql = String.format("SELECT * FROM ROOMBOARD");
			
			stmt = db.con.createStatement();
			res = stmt.executeQuery(sql);
			
			while(res.next()) {
				String[] info = new String[7];
				
				info[0] = res.getString("title");
				info[1] = res.getString("deposit");
				info[2] = res.getString("rent");
//				info[3] = res.getString("image");
				info[4] = res.getString("latitude");
				info[5] = res.getString("longitude");
				info[6] = res.getString("date");
				posts.add(info);
			}
			String[] a = posts.get(0);
			
			System.out.println(a[0]);
			
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
