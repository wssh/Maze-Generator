import java.util.Stack;
import java.util.Queue;
import java.util.LinkedList;
int cols, rows;
int totalCells;
int mazeGenCount = 0;
int cellSize = 80; //n*n pixels you want each cell to be
int offset = 50;

Cell current, start, goal;
Navigator player;
ArrayList<Cell> myCells = new ArrayList(); 
Stack<Cell> stack = new Stack<>();
LinkedList<Cell> bfs = new LinkedList<Cell>();
Boolean generating = false;
Boolean instantGen = false;
Boolean playing = false;
Boolean solving = false;
Boolean solved = false;
Boolean settingsComplete = false; //toggle this to enter a maze asap

void setup(){
  size(1280,720);
  /*if (settingsComplete){ //skip start UI part
    instantGen = true;
    setUpCells();
  }*/
}

void draw(){
  background(51);
  if(settingsComplete){
    for (int i = 0; i < myCells.size(); i++) {
      //System.out.println("drawing maze");
      drawCellWalls(myCells.get(i));
      highlightCells(myCells.get(i));
    }
    if(!instantGen){
      if(generating){
        current = watchGenerateMaze(current, myCells);
        if (start.equals(current) && generating){ 
          generating = false;
          resetCells(); //reset cell visits for pathfinding algo
          System.out.println("Maze complete with " + totalCells + " cells in " + mazeGenCount + " steps. Generating = " + generating);
          mazeGenCount = 0;
          playing = true;
        }
      }
    }
    if(playing){
      drawNavigator(player);
      drawPlayGui();
      
      if(isOnWinningCell(player, goal)) System.out.println("goal reached");
    }
  }
  else{
    //gui for user to manipulate settings before maze generation
    drawGui();
  }
}

public void resetCells(){
  for(int i = 0; i < myCells.size(); i++) {
    myCells.get(i).setVisit(false);
    myCells.get(i).setOnStack(false);
    myCells.get(i).clearNeighbors();
  }
}

public void setUpCells(){
  myCells.clear();
  cols = (width)/cellSize;
  rows = (height-offset)/cellSize;
  totalCells = cols * rows;
  System.out.println("setting up new cells");
  for (int j = 0; j < rows; j++) {
    for (int i = 0; i < cols; i++){
      Cell tempCell = new Cell(i,j,cellSize);
      myCells.add(tempCell);
    }
  }
  //current = myCells.get(floor(random(0, myCells.size()))); //pick a random node to start
  current = myCells.get(0); //pick the very first node
  goal = myCells.get(myCells.size()-1); //pick the last cell as the goal
  start = current; //record the first cell as the starting point
  player = new Navigator(start.getCol(), start.getRows(), cellSize);
  start.setStart();
  goal.setEnd();
  System.out.println("starting cell: " + current);
  if(instantGen){
    settingsComplete = true;
    generateMaze(current, myCells);
    generating = false;
    System.out.println("Maze complete with " + totalCells + " cells in " + mazeGenCount + " steps. Generating = " + generating);
    mazeGenCount = 0;
    resetCells(); //reset cell visits for pathfinding algo
    playing = true;
  }
}
