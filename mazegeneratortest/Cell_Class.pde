public class Cell {
  int i, j, w;
  Boolean [] wall = {true, true, true, true}; //Boolean to check if the walls exist: top, right, bottom, left is the order
  Boolean visited = false;
  Boolean onStack = false;
  Cell(int i, int j, int w) {
    this.i = i;
    this.j = j;
    this.w = w;
  }
  
  public int getX(){
    //println(y);
    return i;
  }
  
  public int getY(){
    //println(x);
    return j;
  }
  
  public void highlight(){
    int x = (this.i)*w;
    int y = (this.j)*w;
    if (onStack){
      noStroke();
      fill(0,0,255,100);
      rect(x,y,w,w);
    }
    else{
      noStroke();
      fill(0,255,0,100);
      rect(x,y,w,w);
    }
  }
  public void show(){
    int x = (this.i)*w;
    int y = (this.j)*w;
    stroke(255);
    if (wall[0])
      line(x,y,x+w,y); //top wall
    if (wall[1])
      line(x+w,y,x+w,y+w); // right wall
    if (wall[2]) 
      line(x+w,y+w,x,y+w); // bottom wall
    if (wall[3])
      line(x,y+w,x,y); // left wall
      
    if(visited){
      noStroke();
      fill(255,0,0,100);
      rect(x,y,w,w);
    }
  }
}