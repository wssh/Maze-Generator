public void findNeighbors(Cell cell, ArrayList<Cell> myCells){
    Cell t, r, b, l;
    int top = index(cell.getCol()-1, cell.getRows()); //<>//
    int right = index(cell.getCol(), cell.getRows()+1);
    int bottom = index(cell.getCol()+1, cell.getRows());
    int left = index(cell.getCol(), cell.getRows()-1);
    
    t = (top != -1) ? myCells.get(top) : null;
    r = (right != -1) ? myCells.get(right) : null;
    b = (bottom != -1) ? myCells.get(bottom) : null;
    l = (left != -1) ? myCells.get(left) : null;
    
    if(t != null && !t.getVisit()) cell.addNeighbors(t);
    if(r != null && !r.getVisit()) cell.addNeighbors(r);
    if(b != null && !b.getVisit()) cell.addNeighbors(b);
    if(l != null && !l.getVisit()) cell.addNeighbors(l);
}

public int index(int i, int j){
  if (i < 0 || j <0 || i > cols -1 || j > rows -1) 
    return -1;
  return i + j * cols;
}

public Cell getRandomNeighbor(Cell cell){
  if(cell.neighbors.size() > 0){
    int n = floor(random(0, cell.neighbors.size()));
    return cell.neighbors.get(n);
  }
  return null;
}

public void generateMaze(Cell current, ArrayList<Cell> myCells){ //<>//
  Stack<Cell> stack = new Stack();
  current.visit(); //set the current node to visited
  findNeighbors(current, myCells); //find if we have unvistted neighbors
  while(current.hasUnvisitedNeighbors()){
    Cell next = getRandomNeighbor(current); //get a random unvistted neighbor
    if(next == null) System.out.println("next is null");
    next.visit(); //visit the next cell
    findNeighbors(next, myCells);
    stack.push(current);
    current.setOnStack(true);
    removeWalls(current, next); //remove the walls based on where the randomizer chooses to go
    current = next; //next is now current, and we repeat this loop
    while(!current.hasUnvisitedNeighbors() && !stack.isEmpty()){ //if we have no more neighbors but the stack isn't empty
      //System.out.println("backtracking");
      current = stack.pop(); //BACKTRACK to a cell that has unvistted neighbors
      current.setOnStack(false);
    }
  }
  //System.out.println("exitting while loop because no more unvistted neighbors on last curr. output: " + current + " " + current.hasUnvisitedNeighbors());
}

public void watchGenerateMaze(Cell current, ArrayList<Cell> myCells){
  current.visit(); //set the current node to visit
  findNeighbors(current, myCells); //find the next cell that we are going to travel to
  Cell next = getRandomNeighbor(current);
  if(next != null){
    next.visit(); //visit the next cell
    stack.push(current);
    current.setOnStack(true);
    removeWalls(current, next); //remove the walls
    current = next; //next is now current, and we repeat this
  }
  else if(stack.size() > 0){
    System.out.println("next is null, popping from stack");
    current = stack.pop();
    current.setOnStack(false);
  }
  System.out.println("finishing while loop, current is: " + current);
  System.out.println("do we have unvistted neighbors?: " + current.hasUnvisitedNeighbors());
}

public void removeWalls(Cell a, Cell b){
    int wallX = a.col - b.col; //remove the walls left/right walls if we travel left/right
    if (wallX == 1){
      a.wall[3] = false;
      b.wall[1] = false;
    }
    else if(wallX == -1){
     a.wall[1] = false;
     b.wall[3] = false;
    }
    
    int wallY = a.row - b.row; //remove the walls top/bottom if we travel top/bottom
    if (wallY == 1){
      a.wall[0] = false;
      b.wall[2] = false;
    }
    else if(wallY == -1){
     a.wall[2] = false;
     b.wall[0] = false;
    }
}
 
