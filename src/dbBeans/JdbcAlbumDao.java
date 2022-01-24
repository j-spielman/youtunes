package dbBeans;

import java.util.ArrayList;
import java.util.List;
import java.sql.*;

public class JdbcAlbumDao implements AlbumDao {
	JdbcManager db = new JdbcManager();

	@Override
	public void add(Album entity) {
		PreparedStatement prepStmt = null;
		int albumIdIn = entity.getAlbumid();
		String title = entity.getTitle();
		double price = entity.getPrice();
		String genre = entity.getGenre();
		String imgUrl = entity.getImgUrl();
		int artistIdIn = entity.getArtistid();
		String insertQuery = "Insert INTO Albums Values(?,?,?,?,?,?)";
		
		try {
			Connection con = db.getConn();
			prepStmt = con.prepareStatement(insertQuery);
			prepStmt.setInt(1, albumIdIn);
			prepStmt.setString(2, title);
			prepStmt.setDouble(3, price);
			prepStmt.setString(4, genre);
			prepStmt.setString(5, imgUrl);
			prepStmt.setInt(6, artistIdIn);
			prepStmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
			System.out.println("Update Failed");
		}
		try {
			db.closeConn();
		}catch(SQLException e) {
			e.printStackTrace();
			System.out.println("close failed");
		}		
	}

	@Override
	public void update(Album entity) {
		PreparedStatement prepStmt = null;
		int idIn = entity.getAlbumid();
		String title = entity.getTitle();
		double price = entity.getPrice();
		String genre = entity.getGenre();
		String imgUrl = entity.getImgUrl();
		int artistIdIn = entity.getArtistid();
		
		String updateQuery = "Update Albums SET title= '"+title+"', "+
							 "price ='"+price+"', "+"genre= '"+genre+"', "+
							 "img_url= '"+imgUrl+"', "+"artist_id= '"+artistIdIn+"' WHERE album_id= "+idIn;
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
		String removeQuery = "Delete from Albums WHERE album_id ="+idIn;
		
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
	public List<Album> list() {
		Statement stmt = null;
		String query = "Select * FROM Albums";
		
		try {
			Connection con = db.getConn();
			stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			List<Album> albums = new ArrayList<>();
			
			while(rs.next()) {
				int albumid = rs.getInt("album_id");
				String title = rs.getString("title");
				double price = rs.getDouble("price");
				String genre = rs.getString("genre");
				String imgUrl = rs.getString("img_url");
				int artistid = rs.getInt("artist_id");
				
				Album in = new Album(albumid,title,price,genre,imgUrl,artistid);
				albums.add(in);
			}
			return albums;
		}catch (SQLException e) {
			e.printStackTrace();
			System.out.print("Retrieval Error");
		}
		return null;
	}

	@Override
	public Album find(Long key) {
		PreparedStatement prepStmt = null;
		int idIn = Math.toIntExact(key);				
		String selectQuery = "Select * From Albums WHERE album_id ="+idIn;
		
		try {
			Connection con = db.getConn();
			prepStmt = con.prepareStatement(selectQuery);
			ResultSet rs = prepStmt.executeQuery();
			
			while(rs.next()) {
				int albumid = rs.getInt("album_id");
				String title = rs.getString("title");
				double price = rs.getDouble("price");
				String genre = rs.getString("genre");
				String imgUrl = rs.getString("img_url");
				int artistid = rs.getInt("artist_id");
				
				Album albumOut = new Album(albumid,title,price,genre,imgUrl,artistid);
				return albumOut;				
			}
		}catch (SQLException e) {
			System.out.println("Search Failed");
			e.printStackTrace();
		}
		return null;
	}

}
