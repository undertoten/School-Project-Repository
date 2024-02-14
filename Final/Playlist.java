import java.util.Scanner;

public class Playlist{
  static String playlistTitle;
  static Scanner scnr = new Scanner(System.in);
  static SongEntry headNode = null;
  static SongEntry currNode = null;
  static SongEntry tailNode = null;
  static SongEntry prevNode;
  static int listSize;

  //prints menu and returns char for choosing options
  public static char printMenu(){
    char userChar;
    System.out.println(playlistTitle + " PLAYLIST MENU");
    System.out.println("a - Add song");
    System.out.println("d - Remove song");
    System.out.println("c - Change position of song");
    System.out.println("s - Output songs by specific artist");
    System.out.println("t - Output total time of playlist (in seconds)");
    System.out.println("o - Output full playlist");
    System.out.println("q - Quit\n");
    System.out.println("Choose an option:");
    do{
      userChar = scnr.nextLine().charAt(0);
      switch(userChar){
        case 'a':
        case 'd':
        case 'c':
        case 's':
        case 't':
        case 'o':
        case 'q':
          return userChar;
        default:
          System.out.println("Choose an option:");
      }
    }while(true);
  }

  public static void add(){
    String tempID;
    String tempSongName;
    String tempArtName;
    int tempTime;
    System.out.println("ADD SONG");
    System.out.println("Enter song's unique ID:");
    tempID = scnr.nextLine();
    System.out.println("Enter song's name:");
    tempSongName = scnr.nextLine();
    System.out.println("Enter artist's name:");
    tempArtName = scnr.nextLine();
    System.out.println("Enter song's length (in seconds):\n");
    tempTime = scnr.nextInt();
    scnr.nextLine(); //to flush the input
    currNode = new SongEntry(tempID, tempSongName, tempArtName, tempTime);
    ++listSize;
   if(headNode == null){
      headNode = currNode;
      tailNode = headNode;
      }
   else{
      tailNode.insertAfter(currNode);
      tailNode = currNode;
      }
  }

  public static void outputAll(){
    int i = 1;
    System.out.println(playlistTitle + " - OUTPUT FULL PLAYLIST");
    currNode = headNode;
    if(currNode != null){
      while(currNode != null){
        System.out.println(i + ".");
        currNode.printPlaylistSongs();
        currNode = currNode.getNext();
        System.out.println("");
        ++i;
      }
    }
    else {
      System.out.println("Playlist is empty\n");
    }
  }

  public static void remove(){
    boolean foundItem = false;
    SongEntry nextNode;
    System.out.println("REMOVE SONG\nEnter song's unique ID:");
    String IDRem = scnr.nextLine();
    currNode = headNode;
    prevNode = null;
    --listSize;
    while(currNode != null && foundItem == false){
      if(currNode.getID().equals(IDRem) && prevNode != null){
         if(currNode.getNext() == null){
            tailNode = prevNode;
            prevNode.setNext(null);
         }
         else{
            nextNode = currNode.getNext();
            prevNode.setNext(nextNode);
         }
         foundItem = true;
         System.out.println("\"" + currNode.getSongName() + "\" removed.\n");
      }
      else if(currNode.getID().equals(IDRem) && prevNode == null){
         if(tailNode == headNode){
            headNode = null;
            tailNode = null;
         }
         else{
            headNode = currNode.getNext();
         }
         foundItem = true;
         System.out.println("\"" + currNode.getSongName() + "\" removed.\n");
      }
      else{
         currNode = currNode.getNext();
         if(prevNode == null){
           prevNode = headNode;
         }
         else{
            prevNode = prevNode.getNext(); 
         }
        
      }
   }
}
   public static void changePos(){
      boolean found1, found2;
      String tempName;
      found1 = false; found2 = false;
      System.out.println("CHANGE POSITION OF SONG\nEnter song's current position:");
      int currPos = scnr.nextInt();
      System.out.println("Enter new position for song:");
      int newPos = scnr.nextInt();
      scnr.nextLine(); //flushes input
      int cnt = 1;
      SongEntry x = null;
      SongEntry prevx = null;
      SongEntry postx = null;
      SongEntry y = null;
      SongEntry prevy = null;
      SongEntry posty = null;
      if(currPos <= 1){
         x = headNode;
         currNode = headNode;
         headNode = headNode.getNext();
         while(currNode != null && cnt < newPos){
            currNode = currNode.getNext();
            ++cnt;
            }
         x.setNext(currNode.getNext());
         currNode.setNext(x);
         tempName = x.getSongName();
         System.out.println("\"" + tempName + "\"" + " moved to position " + newPos + "\n");
         }
      else if(currPos == listSize){
         cnt = 1;
         currNode = headNode;
         prevNode = null;
         x = tailNode;
         while(cnt <= listSize && currNode != null){
            if(cnt == newPos - 1){
               currNode.insertAfter(x);
               }
            if(cnt == listSize){
               currNode.setNext(null);
               tailNode = currNode;
               }
            currNode = currNode.getNext();
            ++cnt;
            }
         tempName = x.getSongName();
         System.out.println("\"" + tempName + "\"" + " moved to position " + newPos + "\n");
         }
      else if(newPos <= 1){
         SongEntry afterhead = null;
         currNode = headNode;
         y = headNode;
         while(cnt <= listSize && currNode != null){
            if(cnt == 2){
               afterhead = currNode;
               }
            if(cnt == currPos - 1){
               prevx = currNode;
               }
            if(cnt == currPos){
               x = currNode;
               }
            if(cnt == currPos + 1){
               postx = currNode;
               }
            currNode = currNode.getNext();
            ++cnt;
            }
         prevx.setNext(postx);
         x.setNext(y);
         //x.insertAfter(y);
         headNode = x;
         tempName = x.getSongName();
         System.out.println("\"" + tempName + "\"" + " moved to position " + newPos + "\n");
         }
      else if(newPos == listSize){
         currNode = headNode;
         y = tailNode;
         while(currNode != null && cnt <= listSize){
            if(cnt == currPos - 1){
               prevx = currNode;
               }
            if(cnt == currPos){
               x = currNode;
               }
            if(cnt == currPos + 1){
               postx = currNode;
               }
            ++cnt;
            currNode = currNode.getNext();
            }
         prevx.setNext(postx);
         y.setNext(x);
         tailNode = x;
         x.setNext(null);
         }
      else if(currPos < newPos){
         currNode = headNode;
         while(currNode != null && cnt <= listSize){
            if(cnt == currPos - 1){
               prevx = currNode;
               }
            if(cnt == currPos){
               x = currNode;
               found1 = true;
               }
            if(cnt == currPos + 1){
               postx = currNode;
               found2 = true;
               }
            if(cnt == newPos - 1){
               prevy = currNode;
               }
            if(cnt == newPos){
               y = currNode;
               }
            if(cnt == newPos + 1){
               posty = currNode;
               }
            
            currNode = currNode.getNext();
            ++cnt;
            }
         prevx.setNext(postx);
         y.setNext(x);
         x.setNext(posty);
         //y.setNext(x.getNext());
         //x.setNext(y);
         tempName = x.getSongName();
         System.out.println("\"" + tempName + "\"" + " moved to position " + newPos + "\n");
         }
         else if(newPos < currPos){
         currNode = headNode;
         while(currNode != null && cnt <= listSize){
            if(cnt == currPos - 1){
               prevx = currNode;
               }
            if(cnt == currPos){
               x = currNode;
               found1 = true;
               }
            if(cnt == currPos + 1){
               postx = currNode;
               found2 = true;
               }
            if(cnt == newPos - 1){
               prevy = currNode;
               }
            if(cnt == newPos){
               y = currNode;
               }
            if(cnt == newPos + 1){
               posty = currNode;
               }
            
            currNode = currNode.getNext();
            ++cnt;
            }
         y.setNext(x.getNext());
         x.setNext(y);
         prevy.setNext(x);
         tempName = x.getSongName();
         System.out.println("\"" + tempName + "\"" + " moved to position " + newPos + "\n");
         }
      
   }

  public static void artistOut(){
    int i = 1;
    System.out.println("OUTPUT SONGS BY SPECIFIC ARTIST\nEnter artist's name:");
    String artToOut = scnr.nextLine();
    //System.out.println("");
    currNode = headNode;
    if(currNode != null){
      while(currNode != null){
         //System.out.println(currNode.getNext().getArtistName());
        
        if(currNode.getArtistName().equals(artToOut)){
          System.out.println(i + ".");
          currNode.printPlaylistSongs();
          System.out.println("");
        }
         currNode = currNode.getNext();
         ++i;
      }
    }
    else {
      System.out.println("Playlist is empty");
    }
  }

  public static void totalTime(){
    int totaltime = 0;
    currNode = headNode;
    while(currNode != null){
      totaltime += currNode.getSongLength();
      currNode = currNode.getNext();
    }
    System.out.println("OUTPUT TOTAL TIME OF PLAYLIST (IN SECONDS)\nTotal time: " + totaltime + " seconds\n");
  }

  public static void main(String[] args) {
    listSize = 0;
    tailNode = headNode;
    System.out.println("Enter playlist's title:");
    playlistTitle = scnr.nextLine();
    System.out.println();
    do{
      switch(printMenu()){
        case 'a':
          add();
          break;
        case 'd':
          remove();
          break;
        case 'c':
          changePos();
          break;
        case 's':
          artistOut();
          break;
        case 't':
          totalTime();
          break;
        case 'o':
          outputAll();
          break;
        case 'q':
          //exits program
          System.exit(0);
      }
    }while (true);
  }
}