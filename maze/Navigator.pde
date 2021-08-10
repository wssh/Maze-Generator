class Navigator{
  private int col, row, cellSize, playerSize;
  private ArrayList<Cell> neighbors;
  
  Navigator(int col, int row, int cellSize){
    this.col = col;
    this.row = row;
    this.cellSize = cellSize;
    this.playerSize = (cellSize > 1) ? cellSize/2 : cellSize;
    neighbors = new ArrayList<>();
  }
  
  public void addNeighbors(Cell cell){
    neighbors.add(cell);
  }
  
  public ArrayList<Cell> getNeighbors(){
    return neighbors;
  }
 
  public int getCol(){
    return col;
  }
  
  public int getRows(){
    return row;
  }
  
  public int getCellSize(){
    return cellSize;
  }
  
  public int getPlayerSize(){
    return playerSize;
  }
  
  public void moveDown(){
    row++;
  }
  
  public void moveUp(){
    row--;
  }
  
  public void moveLeft(){
    col--;
  }
  
  public void moveRight(){
    col++;
  }
  
  @Override
  public String toString(){
    return "X: " + col + " Y: " + row;
  }
}
  
  
