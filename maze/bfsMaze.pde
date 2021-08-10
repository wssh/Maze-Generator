public void bfsMaze(Navigator agent, ArrayList<Cell> myCells){
  Cell head = getNavCell(agent, myCells);
  ArrayList<Cell> tempNeighbors;
  head.visit();
  bfs.push(head);
  while(!bfs.isEmpty()){
    System.out.println("bfs isn't empty, beginning of while loop");
    Cell current = bfs.pop();
    if(current.equals(goal)){
      System.out.println("goal found");
      while(!current.equals(head)){
        current.isPath();
        current = current.getParent();
      }
      break;
    }
    tempNeighbors = agentNeighbors(current, myCells);
    for(int i = 0; i < tempNeighbors.size(); i++){
      System.out.println(tempNeighbors.size() + " neighbors : " + tempNeighbors.get(i));
      tempNeighbors.get(i).visit();
      tempNeighbors.get(i).setParent(current);
      bfs.push(tempNeighbors.get(i));
    }
  }
}


public Boolean bfsValidMovement(Cell agent, Movement movement, ArrayList<Cell> myCells){
  int x = agent.getCol();
  int y = agent.getRows();
  Boolean [] walls;
  switch(movement){
    //wall array is as follows: [top, right, bottom, left]
    case goUp:
      if(y-1 < 0) return false;
      else {
        walls = myCells.get(index(x,y-1)).getWalls();
        if(walls[2] ==  true) return false;
      }
      return true;
    case goDown:
      if (y+1 > rows - 1) return false;
      else {
        walls = myCells.get(index(x,y+1)).getWalls();
        if(walls[0] ==  true) return false;
      }
      return true;
    case goLeft:
      if(x-1 < 0) return false;
      else {
        walls = myCells.get(index(x-1,y)).getWalls();
        if(walls[1] ==  true) return false;
      }
      return true; 
    case goRight:
      if(x+1 > cols - 1) return false;
      else {
        walls = myCells.get(index(x+1,y)).getWalls();
        if(walls[3] ==  true) return false;
      }
      return true;
  }
  return true; 
}

public ArrayList<Cell> agentNeighbors(Cell current, ArrayList<Cell> myCells){
  ArrayList<Cell> temp = new ArrayList<>();
  int x = current.getCol();
  int y  = current.getRows();
  
  if(bfsValidMovement(current, Movement.goUp, myCells) && !myCells.get(index(x,y-1)).getVisit()){
    System.out.println("top is possible");
    temp.add(myCells.get(index(x,y-1)));
  }
  if(bfsValidMovement(current, Movement.goDown, myCells) && !myCells.get(index(x,y+1)).getVisit()){
    System.out.println("bottom is possible");
    temp.add(myCells.get(index(x,y+1)));
  }
  if(bfsValidMovement(current, Movement.goRight, myCells) && !myCells.get(index(x+1,y)).getVisit()){
    System.out.println("right is possible");
    temp.add(myCells.get(index(x+1,y)));
  }
  if(bfsValidMovement(current, Movement.goLeft, myCells) && !myCells.get(index(x-1,y)).getVisit()){
    System.out.println("left is possible");
    temp.add(myCells.get(index(x-1,y)));
  }
  return temp;
}
