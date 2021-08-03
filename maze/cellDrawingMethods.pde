public void drawCellWalls(Cell cell){
    
    int x = (cell.getCol())*(cell.getCellSize());
    int y = (cell.getRows())*(cell.getCellSize());
    Boolean[] wall = cell.getWalls();
    stroke(255); //set the line color to white
    if (wall[0])
      line(x, y, x+cellSize, y); //draw the top wall
    if (wall[1])
      line(x+cellSize, y, x+cellSize, y+cellSize); //draw right wall
    if (wall[2]) 
      line(x+cellSize, y+cellSize, x, y+cellSize); //draw bottom wall
    if (wall[3])
      line(x, y+cellSize, x, y); //draw left wall
  }
  
public void highlightCells(Cell cell){
    int x = (cell.getCol())*(cell.getCellSize());
    int y = (cell.getRows())*(cell.getCellSize());
    if (cell.getOnStack()){
      noStroke();
      fill(0,0,255,100);
      rect(x,y,cellSize,cellSize);
    }
    else if(cell.getVisit()){
      noStroke();
      fill(50, 255, 50,100);
      rect(x,y,cellSize,cellSize);
    }
  }