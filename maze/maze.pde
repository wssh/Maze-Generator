import java.util.Stack;

int cols, rows;
int totalCells;
int mazeGenCount = 0;
int cellSize = 80; //n*n pixels you want each cell to be
int offset = 50;

Cell current, start, goal;
Navigator player;
ArrayList<Cell> myCells = new ArrayList(); 
Stack<Cell> stack = new Stack();
Boolean generating = true;
Boolean instantGen = false;
Boolean resetVisits = false;
Boolean playing = false;
Boolean settingsComplete = true; //toggle this to enter a maze asap

void setup(){
  size(1280,720);
  if (settingsComplete) //skip start UI part
    instantGen = true;
    setUpCells();
}

void draw(){
  background(51);
  if(settingsComplete){
    for (int i = 0; i < myCells.size(); i++) {
      drawCellWalls(myCells.get(i));
      highlightCells(myCells.get(i));
    }
    if(!instantGen)
      if(generating){
        current = watchGenerateMaze(current, myCells);
        if (start.equals(current) && generating){ 
          generating = false;
          resetCells();
          System.out.println("Maze complete with " + totalCells + " cells in " + mazeGenCount + " steps. Generating = " + generating);
          playing = true;
        }
      }
      
    if(playing){
      drawNavigator(player);
      if(isOnWinningCell(player, goal)) System.out.println("goal reached");
    }
  }
  else{
    //gui for user to manipulate settings before maze generation
    drawGui();
  }
}

public void resetCells(){
  if(!resetVisits)
  for(int i = 0; i < myCells.size(); i++) {
    myCells.get(i).setVisit(false);
    myCells.get(i).setOnStack(false);
  }
}

public void setUpCells(){
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
    generateMaze(current, myCells);
    generating = false;
    System.out.println("Maze complete with " + totalCells + " cells in " + mazeGenCount + " steps. Generating = " + generating);
    resetCells();
    playing = true;
  }
}
