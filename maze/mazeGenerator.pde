public void findNeighbors(Cell cell, ArrayList<Cell> myCells){ //<>//
  Cell t, r, b, l;
  int top = index(cell.getCol(), cell.getRows()-1);
  int right = index(cell.getCol()+1, cell.getRows());
  int bottom = index(cell.getCol(), cell.getRows()+1);
  int left = index(cell.getCol()-1, cell.getRows());
  
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
  if (i < 0 || j < 0 || i > cols -1 || j > rows -1) 
    return -1;
  return i + j * cols; //gets the numeric number pixel on screen. x + y * width
}

public Cell getRandomNeighbor(Cell cell){
  Cell temp;
  if(cell.getNeighbors().size() > 0){
    int n = floor(random(0, cell.getNeighbors().size())); //Processing's random(low, high)
    temp = cell.getNeighbors().get(n);
    cell.getNeighbors().remove(n);
    return temp;
  }
  return null;
}

public void generateMaze(Cell current, ArrayList<Cell> myCells){
  current.visit(); //set the current node to visited //<>//
  stack.push(current);
  while(!stack.isEmpty()){
    mazeGenCount++;
    current = stack.pop();
    findNeighbors(current, myCells);  //find if we have VALID unvisited neighbors on the current cell\
    if(current.hasValidNeighbors()){
      stack.push(current);
      Cell next = getRandomNeighbor(current);
      removeWalls(current, next);
      next.visit();
      stack.push(next); //<>//
    }
  }
}

public Cell watchGenerateMaze(Cell current, ArrayList<Cell> myCells){
  if(!current.getVisit()) current.visit();
  stack.push(current);
  current.setOnStack(true);
  if(!stack.isEmpty()){
    mazeGenCount++;
    current = stack.pop();
    current.setOnStack(false);
    findNeighbors(current, myCells);
    if(current.hasValidNeighbors()){
      stack.push(current);
      current.setOnStack(true);
      Cell next = getRandomNeighbor(current);
      removeWalls(current, next);
      next.visit();
      stack.push(next);
      return next;
    }
    else{
      while(!current.hasValidNeighbors() && !stack.isEmpty()){
        current = stack.pop();
        current.setOnStack(false);
        return current;
      }
    }
  }
  return current;
}

public void removeWalls(Cell a, Cell b){
    int wallX = a.getCol() - b.getCol(); //remove the walls left/right walls if we travel left/right
    if (wallX == 1){
      a.deleteWalls(3);
      b.deleteWalls(1);
    }
    else if(wallX == -1){
     a.deleteWalls(1);
     b.deleteWalls(3);
    }
    
    int wallY = a.getRows() - b.getRows(); //remove the walls top/bottom if we travel top/bottom
    if (wallY == 1){
      a.deleteWalls(0);
      b.deleteWalls(2);
    }
    else if(wallY == -1){
     a.deleteWalls(2);
     b.deleteWalls(0);
    }
}
 
