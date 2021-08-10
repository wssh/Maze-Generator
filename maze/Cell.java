import java.io.Serializable;
import java.util.ArrayList;

class Cell implements Serializable{
  private int col, row, cellSize;
  private Boolean [] wall = {true, true, true, true}; //Boolean to check if the walls exist: top, right, bottom, left is the order
  private ArrayList<Cell> neighbors;
  private Boolean visited = false;
  private Boolean onStack = false;
  private Boolean isStart = false;
  private Boolean isEnd = false;
  private Boolean isPath = false;
  private Cell parent;
  
  Cell(int i, int j, int w) {
    this.col = i;
    this.row = j;
    this.cellSize = w;
    neighbors = new ArrayList();
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
  
  public Boolean[] getWalls(){
    return wall;
  }
  
  public void visit(){
    visited = true;
  }
  
  public void setVisit(Boolean bool){
    visited = bool;
  }
  
  public Boolean getVisit(){
    return visited;
  }
  
  public Boolean getOnStack(){
    return onStack;
  }
  
  public void setOnStack(Boolean bool){
    onStack = bool;
  }
  
  public void addNeighbors(Cell cell){
    neighbors.add(cell);
  }
  
  public ArrayList<Cell> getNeighbors(){
    return neighbors;
  }
  
  public void deleteWalls(int index){
    this.wall[index] = false;
  }
  
  public Boolean hasValidNeighbors(){
    for (int i  = 0; i < neighbors.size(); i++){
      if (neighbors.get(i).getVisit() == false) return true;
    }
    return false;
  }
  
  public Boolean getStart(){
    return isStart;
  }
  
  public Boolean getEnd(){
    return isEnd;
  }
  
  public void setStart(){
    isStart = true;
  }
  
  public void setEnd(){
    isEnd = true;
  }
  
  public void clearNeighbors(){
    neighbors.clear();
  }
  
  public void setParent(Cell parent){
    this.parent = parent;
  }
  
  public Cell getParent(){
     return parent;
  }
  
  public void isPath(){
    isPath = true;
  }
  
  public Boolean getIsPath(){
    return isPath;
  }
  
  @Override
  public String toString(){
    return "X: " + col + " Y: " + row;
  }
}
