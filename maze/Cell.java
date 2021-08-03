import java.io.Serializable;
import java.util.ArrayList;

class Cell implements Serializable{
  private int col, row, cellSize;
  private Boolean [] wall = {true, true, true, true}; //Boolean to check if the walls exist: top, right, bottom, left is the order
  private ArrayList<Cell> neighbors;
  private Boolean visited = false;
  private Boolean onStack = false;
  
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
  
  @Override
  public String toString(){
    return "X: " + col + " Y: " + row;
  }
}