public Boolean isMovementValid(Navigator agent, Movement movement, ArrayList<Cell> myCells){
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
