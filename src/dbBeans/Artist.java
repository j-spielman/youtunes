package dbBeans;

public class Artist {
	int artistid;
	String firstName;
	String lastName;
	 	
	public Artist(int artistid, String firstName, String lastName) {
		super();
		this.artistid = artistid;
		this.firstName = firstName;
		this.lastName = lastName;
	}
	public int getArtistid() {
		return artistid;
	}
	public void setArtistid(int artistid) {
		this.artistid = artistid;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	
	@Override
	public String toString() {
		return "Artist [artistid=" + artistid + ", firstName=" + firstName + ", lastName=" + lastName + "]";
	}

}
