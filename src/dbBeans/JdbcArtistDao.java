package dbBeans;

import java.util.ArrayList;
import java.util.List;
import java.sql.*;

public class JdbcArtistDao implements ArtistDao {
	
	JdbcManager db = new JdbcManager();

	@Override
	public void add(Artist entity) {
		
		PreparedStatement prepStmt = null;
		int idIn = entity.getArtistid();
		String fNameIn = entity.getFirstName();
		String lNameIn = entity.getLastName();
		String insertQuery = "Insert INTO Artists Values(?,?,?)";		
		
		try {
			Connection con = db.getConn();
			prepStmt = con.prepareStatement(insertQuery);
			prepStmt.setInt(1, idIn);
			prepStmt.setString(2, fNameIn);
			prepStmt.setString(3,lNameIn);
			prepStmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Record insertion failed");
		}			
		try {
			db.closeConn();
		}catch(SQLException e) {
			e.printStackTrace();
			System.out.println("close failed");
		}
	}

	@Override
	public void update(Artist entity) {
		PreparedStatement prepStmt = null;
		int idIn = entity.getArtistid();
		String fNameIn = entity.getFirstName();
		String lNameIn = entity.getLastName();
		
		String updateQuery = "Update Artists SET first_name = '"+fNameIn+"', last_name= '"+lNameIn+"' WHERE artist_id= "+idIn;
		
		try {
			Connection con = db.getConn();
			prepStmt = con.prepareStatement(updateQuery);
			prepStmt.executeUpdate();
		}catch (SQLException e) {
			e.printStackTrace();
			System.out.println("Update failed");
		}
		try {
			db.closeConn();
		}catch(SQLException e) {
			e.printStackTrace();
			System.out.println("close failed");
		}
		
	}

	@Override
	public void remove(Long key) {
		PreparedStatement prepStmt = null;
		int idIn = Math.toIntExact(key);		
		String removeQuery = "Delete from Artists WHERE artist_id ="+idIn;
		
		try {
			Connection con = db.getConn();
			prepStmt = con.prepareStatement(removeQuery);
			prepStmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Removal failed");
		}				
		try {
			db.closeConn();
		}catch(SQLException e) {
			e.printStackTrace();
			System.out.println("close failed");
		}
		
	}

	@Override
	public List<Artist> list() {
		Statement stmt = null;
		String query = "Select * FROM Artists";		
		
	try {
		Connection con = db.getConn();
		stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery(query);
		List<Artist> artists = new ArrayList<>();

		while(rs.next()) {
			int id = rs.getInt("artist_id");
			String fName = rs.getString("first_name");
			String lName = rs.getString("last_name");
			
			Artist in = new Artist(id,fName,lName);
			artists.add(in);			
		}		
		return artists;
		
	} catch (SQLException e) {

		e.printStackTrace();
	}
		return null;
	}

	@Override
	public Artist find(Long key) {
		PreparedStatement prepStmt = null;
		int idIn = Math.toIntExact(key);				
		String selectQuery = "Select * From Artists WHERE artist_id ="+idIn;
		
		try {
			Connection con = db.getConn();			
			prepStmt = con.prepareStatement(selectQuery);
			ResultSet rs = prepStmt.executeQuery();
			
			while(rs.next()) {
				int id = rs.getInt("artist_id");
				String fName = rs.getString("first_name");
				String lName = rs.getString("last_name");
				
				Artist artistOut = new Artist(id,fName,lName);
				return artistOut;				
				}
			} catch (SQLException e) {
				System.out.println("Search Failed");
				e.printStackTrace();			
			
		}
		try {
			db.closeConn();
			System.out.println("Connection Closed.");
		}catch(SQLException e) {
			e.printStackTrace();
			System.out.println("close failed");
		}
		return null;
	}
	
}
