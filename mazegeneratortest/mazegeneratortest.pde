import java.util.Stack;

int cols, rows;
int w = 40;
ArrayList<Cell> myCells = new ArrayList(); 
Stack<Cell> stack = new Stack();
Cell current;
Cell next;

void setup(){
  size(1280,720);
  cols = width/w;
  rows = height/w;
  //frameRate(1);
  for (int j = 0; j < rows; j++) {
    for (int i = 0; i < cols; i++){
      Cell tempCell = new Cell(i,j,w);
      myCells.add(tempCell);
    }
  }
  current = myCells.get(0);
}

void draw(){
  background(51);
  for (int i = 0; i < myCells.size(); i++) {
    myCells.get(i).show();
  }
  //println("Cell coordinates:" + current.getX() + "," + current.getY() +"\n\n");
  current.visited = true;
  current.highlight();
  next = checkNeighbors(current);
  
  if(next != null){
    next.visited = true;
    stack.push(current);
    current.onStack = true;
    removeWall(current, next);
    
    current = next;
  }
  else if (stack.size() > 0){
    current = stack.pop();
  }
}

int index(int i, int j){
  if (i < 0 || j < 0 || i > cols-1 || j > rows-1){
    //println("returning -1");
    return -1;
  }
  //println("returning" + y + x *cols); 
  return i + j * cols;
}

Cell checkNeighbors(Cell cell){
  ArrayList<Cell> neighbors = new ArrayList();
  Cell top, right, bottom, left;
  int t = index(cell.getX()-1,cell.getY());
  int r = index(cell.getX(),cell.getY()+1);
  int b = index(cell.getX()+1,cell.getY());
  int l = index(cell.getX(),cell.getY()-1);
  
  if (t != -1){top = myCells.get(t);}else{top = null;}
  if (r != -1){right = myCells.get(r);}else{right = null;}
  if (b != -1){bottom = myCells.get(b);}else{bottom= null;}
  if (l != -1){left = myCells.get(l);}else{left = null;}
  
  if (top != null && !top.visited){
    //println("top neighbor exists");
    neighbors.add(top);
  }
    if (right != null && !right.visited){
    //println("right neighbor exists");
    neighbors.add(right);
  }
    if (bottom != null && !bottom.visited){
    //println("bottom neighbor exists");
    neighbors.add(bottom);
  }
    if (left != null && !left.visited){
   // println("left neighbor exists");
    neighbors.add(left);
  }
  
  if(neighbors.size() > 0){
    //println("neighbors size:" + neighbors.size());
    int n = floor(random(0, neighbors.size()));
    //println("random #" + n);
    //println("\n Next Coordinate:" + neighbors.get(n).getX() + "," + neighbors.get(n).getY() + "\n");
    return neighbors.get(n);
  }
  else return null;
}

void removeWall(Cell a, Cell b){
  int xdiff = a.getX() - b.getX();
  switch (xdiff) {
    case 1:
      a.wall[3] = false;
      b.wall[1] = false;
    case -1:
      a.wall[1] = false;
      b.wall[3] = false;
  }
  int ydiff = a.getY() - b.getY();
  switch (ydiff){
    case 1:
      a.wall[0] = false;
      b.wall[2] = false;
    case -1:
      a.wall[2] = false;
      b.wall[0] = false;
  }
}