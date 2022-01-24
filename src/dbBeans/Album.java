package dbBeans;

public class Album {
	int albumid;
	String title;
	double price;
	String genre;
	String imgUrl;
	int artistid;
	public Album(int albumid, String title, double price, String genre, String imgUrl, int artistid) {
		super();
		this.albumid = albumid;
		this.title = title;
		this.price = price;
		this.genre = genre;
		this.imgUrl = imgUrl;
		this.artistid = artistid;
	}
	public int getAlbumid() {
		return albumid;
	}
	public void setAlbumid(int albumid) {
		this.albumid = albumid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public String getImgUrl() {
		return imgUrl;
	}
	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}
	public int getArtistid() {
		return artistid;
	}
	public void setArtistid(int artistid) {
		this.artistid = artistid;
	}
	
	@Override
	public String toString() {
		return "Album [albumid="+albumid+",title="+title+",price="+price+",genre="+genre+",imgUrl="+imgUrl+",aritistid="+artistid+"]";
	}

}
