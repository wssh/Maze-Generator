int [] circleX = {220, 280, 340, 400, 360, 420};
int circleY = 500;
int circleY2 = 560;
Boolean [] circleOver = {false, false, false, false, false, false};
Boolean [] circleSelect = {false, true, false, false, false, true};

int finishX = 540;
int finishY = 640;
int finishW = 200;
int finishH = 60;
Boolean finishOver = false;

color defaultColor = color(255); //white
color highlightColor = color(255,255,0); //yellow
color selectColor = color(0,255,0); //green

public void drawGui(){
  update(mouseX, mouseY);
  background(51);
  textSize(64);
  fill(255);
  text("Maze Game", 10,70);
  textSize(32);
  text("by Ricky Chai", 10, 120);
  textSize(24);
  text("This is an interative maze generator using depth first search.", 10, 150);
  text("Backtracking is applied here using a stack instead of recursion to avoid stack overflow.", 10, 180);
  
  if(circleSelect[3] && !instantGen){
    fill(255,0,0);
    text("Since the maze is generated using dfs, watching the maze generate will take a while.", 10, circleY-40);
  }
  
  //maze size selection
  textSize(32);
  fill(255);
  strokeWeight(2);
  stroke(0);
  text("Maze Size:", 10,circleY+10);
  
  //S button
  if(circleSelect[0]) fill(selectColor);
  else if(circleOver[0]) fill(highlightColor);
  else fill(defaultColor); 
  ellipse(circleX[0], circleY, 50, 50);
  
  //M button
  if(circleSelect[1]) fill(selectColor);
  else if(circleOver[1]) fill(highlightColor);
  else fill(defaultColor);
  ellipse(circleX[1], circleY, 50, 50);
  
  //L button
  if(circleSelect[2]) fill(selectColor);
  else if(circleOver[2]) fill(highlightColor);
  else fill(defaultColor); 
  ellipse(circleX[2], circleY, 50, 50);
  
  //XL button
  if(circleSelect[3]) fill(selectColor);
  else if(circleOver[3]) fill(highlightColor);
  else fill(defaultColor);
  ellipse(circleX[3], circleY, 50, 50);
  
  //text for maze size buttons
  fill(0,0,0);
  text("S", circleX[0]-8, circleY+12);
  text("M", circleX[1]-14, circleY+12);
  text("L", circleX[2]-8, circleY+12);
  text("XL", circleX[3]-17, circleY+12);
  
  //instant generate toggle buttons
  fill(255);
  text("Instant Generation?:", 10,570);
  
  if(circleSelect[4]) fill(selectColor);
  else if(circleOver[4]) fill(highlightColor);
  else fill(255);
  ellipse(circleX[4],circleY2,50,50);
  
  if(circleSelect[5]) fill(selectColor);
  else if(circleOver[5]) fill(highlightColor);
  else fill(255);
  ellipse(circleX[5],circleY2,50,50);
  
  //text for generate toggle buttons
  fill(0,0,0);
  text("Y", 351,570);
  text("N", 409,570);
  
  //settings finished button
  if(finishOver) fill(highlightColor);
  else fill(defaultColor);
  rect(finishX,finishY,finishW,finishH);
  fill(0,0,0);
  text("play", finishX+(finishW/3), finishY+(finishH/2)+10);
  
}

public Boolean overCircle(int x, int y, int diameter){
  float disX = x - mouseX;
  float disY = y - mouseY;
  if(sqrt(sq(disX) + sq(disY)) < diameter/2) //eq for a circle
    return true;
  return false;
}

public Boolean overRect(int x, int y, int w, int h){
  if(mouseX >= x && mouseX <= x+w && mouseY >= y && mouseY <= y+h) return true;
  return false;
}

public void update(int x, int y){
  System.out.println(mouseX + " " + mouseY);
  if(overCircle(circleX[0], circleY, 50)){
    circleOver[0] = true;
    circleOver[1] = false;
    circleOver[2] = false;
    circleOver[3] = false;
    circleOver[4] = false;
    circleOver[5] = false;
    finishOver = false;
  }
  else if(overCircle(circleX[1], circleY, 50)){
    circleOver[1] =  true;
    circleOver[0] = false;
    circleOver[2] = false;
    circleOver[3] = false;
    circleOver[4] = false;
    circleOver[5] = false;
    finishOver = false;
  }
  else if(overCircle(circleX[2], circleY, 50)){
    circleOver[2] = true;
    circleOver[0] = false;
    circleOver[1] = false;
    circleOver[3] = false;
    circleOver[4] = false;
    circleOver[5] = false;
    finishOver = false;
  }
  else if(overCircle(circleX[3], circleY, 50)){
    circleOver[2] = false;
    circleOver[0] = false;
    circleOver[1] = false;
    circleOver[3] = true;
    circleOver[4] = false;
    circleOver[5] = false;
    finishOver = false;
  }
  else if(overCircle(circleX[4], circleY2, 50)){
    circleOver[2] = false;
    circleOver[0] = false;
    circleOver[1] = false;
    circleOver[3] = false;
    circleOver[4] = true;
    circleOver[5] = false;
    finishOver = false;
  }
  else if(overCircle(circleX[5], circleY2, 50)){
    circleOver[2] = false;
    circleOver[0] = false;
    circleOver[1] = false;
    circleOver[3] = false;
    circleOver[4] = false;
    circleOver[5] = true;
    finishOver = false;
  }
  else if(overRect(finishX, finishY, finishW, finishH)){
    finishOver = true;
    circleOver[0] = false;
    circleOver[1] = false;
    circleOver[2] = false;
    circleOver[3] = false;
  }
  else{
    circleOver[0] = false;
    circleOver[1] = false;
    circleOver[2] = false;
    circleOver[3] = false;
    circleOver[4] = false;
    circleOver[5] = false;
    finishOver = false;
  }
}
