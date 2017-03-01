package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import dto.CriminalDTO;

public class SearchModel {
	public Connection getConnection(){
		Connection con = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/MySQL","root","root");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e){
			e.printStackTrace();
		}
		return con;
	}
	public ArrayList<CriminalDTO> searchFromDatabase(CriminalDTO searchDetails) throws SQLException{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		// preparing query
		String query = "SELECT * FROM criminal "
				
				+ "WHERE (";
			//	+ "institutes.InstituteName =? and CourseTitle = ? and InstiCity = ?";
		if(searchDetails.getcriminalName()!=null){
			query += "institutes.CriminalName LIKE '"+searchDetails.getcriminalName()+"%' AND ";
		}
		if(searchDetails.getcriminalNIC()!=null){
			query += "CriminalNIC LIKE '"+searchDetails.getcriminalNIC()+"%' AND ";
		}
		if(searchDetails.getcriminalLocation()!=null){
			query += "CriminalLocation LIKE '"+searchDetails.getcriminalLocation()+"%' AND ";
		}
		query += "1=1)";
		
		ArrayList<CriminalDTO> institutesList = new ArrayList<>();
		try {
			con=this.getConnection();
			pstmt = con.prepareStatement(query);
		
			System.out.println("Query to DB- "+query);
			rs = pstmt.executeQuery();
			while(rs.next()){
				CriminalDTO srchdto = new CriminalDTO();
				srchdto.setcriminalName(rs.getString("CriminalName"));
				srchdto.setcriminalNIC(rs.getString("CriminalNIC"));
				srchdto.setcriminalEmail(rs.getString("CriminalEmail"));
				srchdto.setcriminalAddress(rs.getString("CriminalAddress"));
				srchdto.setcriminalLocation(rs.getString("CriminalLocation"));
				srchdto.setcriminalAge(rs.getString("CriminalAge"));
				srchdto.setcriminalGender(rs.getString("CriminalGender"));
				
				institutesList.add(srchdto);
				System.out.println("List of results is created.");
			}
		} finally{
			if(pstmt!=null){
				pstmt.close();
			}
			if(con!=null){
				con.close();
			}
		}
		return institutesList;
	}
}