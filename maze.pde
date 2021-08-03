import java.util.Stack;
import java.io.FileOutputStream;
import java.io.ObjectOutputStream;
import java.io.FileInputStream;
import java.io.ObjectInputStream;
import java.io.EOFException;
import java.io.FileNotFoundException;
import java.io.IOException;

int cols, rows;
int totalCells;
int cellSize = 15; //n*n pixels you want each cell to be
Cell current;
ArrayList<Cell> myCells = new ArrayList(); 
Stack<Cell> stack = new Stack();

void setup(){
  size(1280,770);
  cols = (width)/cellSize;
  rows = (height-50)/cellSize;
  totalCells = cols * rows;
  setUpCells();
  frameRate(5);
}

void draw(){
  background(51);
  for (int i = 0; i < myCells.size(); i++) {
    drawCellWalls(myCells.get(i));
    highlightCells(myCells.get(i));
    //watchGenerateMaze(current, myCells);
  }
}

void keyPressed() {
    if (key == 'p') {
      System.out.println("resetting canvas and generate new maze");
      myCells.clear();
      setUpCells();
    }
    if (key == 's'){ //serialize the maze
      try
        {
            FileOutputStream fos = new FileOutputStream("mazeData");
            ObjectOutputStream oos = new ObjectOutputStream(fos);
            oos.writeObject(myCells);
            oos.close();
            fos.close();
            System.out.println("serialized myCells");
        } 
        catch (IOException ioe) 
        {
            ioe.printStackTrace();
        }
    }
    if(key == 'l'){ //deserialize the maze
     try{
       FileInputStream fis = new FileInputStream("mazeData");
       ObjectInputStream ois = new ObjectInputStream(fis);
       
       ArrayList<Cell> tempCells = (ArrayList)ois.readObject();
       if(tempCells.size() != totalCells) System.out.println("invalid cellSize for serialized input");
       else myCells = tempCells;
       ois.close();
       fis.close();
     }
     catch(FileNotFoundException e){
       e.printStackTrace();
       return;
     }
     catch(IOException e){
       e.printStackTrace();
       return;
     }
     catch (ClassNotFoundException c) 
        {
            System.out.println("Class not found");
            c.printStackTrace();
            return;
        }
    }
}

public void setUpCells(){
    System.out.println("setting up new cells");
    for (int j = 0; j < rows; j++) {
      for (int i = 0; i < cols; i++){
        Cell tempCell = new Cell(i,j,cellSize);
        myCells.add(tempCell);
      }
  }
  current = myCells.get(0);
  generateMaze(current, myCells);
}
