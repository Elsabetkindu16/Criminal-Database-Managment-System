package controller;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.SearchModel;
import dto.CriminalDTO;

@WebServlet("/SearchController")
public class SearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		if(request.getSession().getAttribute("user-name")==null){
			response.sendRedirect("login.html");
		}else{
			
			String searchByCriminalName = request.getParameter("searchCriminalName");
			String searchByNIC = request.getParameter("searchNIC");
			String searchByLocation = request.getParameter("searchLocation");
			
			if(searchByCriminalName.isEmpty() && searchByNIC.isEmpty() && searchByLocation.isEmpty()){
				response.sendRedirect("search.jsp");
			}
			else{
				CriminalDTO getcriminal = new CriminalDTO();
				if(searchByLocation.length()>0 && searchByNIC.isEmpty() && searchByCriminalName.isEmpty()){
					getcriminal.setcriminalLocation(searchByLocation);
				}
				else if(searchByNIC.length()>0 && searchByLocation.isEmpty() && searchByCriminalName.isEmpty()){
					getcriminal.setcriminalNIC(searchByNIC);
				}
				else if(searchByCriminalName.length()>0 && searchByNIC.isEmpty() && searchByLocation.isEmpty()){
					getcriminal.setcriminalName(searchByCriminalName);
				}
				else if(searchByLocation.length()>0 && searchByCriminalName.isEmpty() && searchByNIC.length()>0){
					getcriminal.setcriminalNIC(searchByNIC);
					getcriminal.setcriminalLocation(searchByLocation);
				}
				else if(searchByLocation.length()>0 && searchByNIC.isEmpty() && searchByCriminalName.length()>0){
					getcriminal.setcriminalName(searchByCriminalName);
					getcriminal.setcriminalLocation(searchByLocation);
				}else if(searchByNIC.length()>0 && searchByLocation.isEmpty() && searchByCriminalName.length()>0){
					getcriminal.setcriminalName(searchByCriminalName);
					getcriminal.setcriminalNIC(searchByNIC);
				}
				else{
					getcriminal.setcriminalName(searchByCriminalName);
					getcriminal.setcriminalNIC(searchByNIC);
					getcriminal.setcriminalLocation(searchByLocation);
				}
				
				SearchModel srchModel = new SearchModel();
				ArrayList<CriminalDTO> criminalsList = new ArrayList<>();
				try {
					criminalsList = srchModel.searchFromDatabase(getcriminal);
				} catch (SQLException e) {
					e.printStackTrace();
				}
				
				session.setAttribute("criminalsList", criminalsList);
				RequestDispatcher rd = request.getRequestDispatcher("search.jsp");
				rd.forward(request, response);
			}
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	
}
}
