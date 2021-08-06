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
int mazeGenCount = 0;
int cellSize = 40; //n*n pixels you want each cell to be
Cell current, start;
ArrayList<Cell> myCells = new ArrayList(); 
Stack<Cell> stack = new Stack();
Boolean generating = true;
Boolean instantGen = true;

void setup(){
  size(1280,770);
  cols = (width)/cellSize;
  rows = (height-50)/cellSize;
  totalCells = cols * rows;
  setUpCells();
}

void draw(){
  background(51);
  for (int i = 0; i < myCells.size(); i++) {
    drawCellWalls(myCells.get(i));
    highlightCells(myCells.get(i));
  }
  if(!instantGen)
    if(generating){
      current = watchGenerateMaze(current, myCells);
      if (start == current && generating){ 
        generating = false;
        System.out.println("Maze complete with " + totalCells + " cells in " + mazeGenCount + " steps.");
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
  current = myCells.get(floor(random(0, myCells.size())));
  start = current;
  System.out.println("starting cell: " + current);
  if(instantGen){
    generateMaze(current, myCells);
    System.out.println("Maze complete with " + totalCells + " cells in " + mazeGenCount + " steps.");
  }
}
