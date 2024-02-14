public class SongEntry{
	
  private String uniqueID;
	private String songName;
	private String artistName;
  private int songLength;
	private SongEntry nextNode;
	
	public SongEntry() {
		songName = "none";
		artistName = "none";
    uniqueID = "none";
    songLength = 0;
		nextNode = null;
	}

	public SongEntry(String ID, String name, String artName, int length) {
		songName = name;
		artistName = artName;
    uniqueID = ID;
    songLength = length;
		nextNode = null;
	}
	
	public SongEntry(String ID, String name, String artName, int length, SongEntry node) {
		songName = name;
		artistName = artName;
    uniqueID = ID;
    songLength = length;
		nextNode = node;
	}
	
	public String getSongName() {
		return songName;
	}

	public String getID() {
		return uniqueID;
	}

  public String getArtistName(){
    return artistName;
  }

  public int getSongLength(){
    return songLength;
  }
	
	public void insertAfter(SongEntry node) {
		SongEntry tempNext;
		tempNext = this.nextNode; //puts the current nextnode into a temp store
		this.nextNode = node; // puts the input as the next node 
		node.nextNode = tempNext; //puts the inputs next node as the temp node
	}

  public void setNext(SongEntry nextNode){
    this.nextNode = nextNode;
  }
	
	public SongEntry getNext() {
		return this.nextNode;
	}
	
	public void printPlaylistSongs() {
		System.out.println("Unique ID: " + uniqueID + "\nSong Name: " + songName + "\nArtist Name: " + artistName + "\nSong Length (in seconds): " + songLength);
	}
}