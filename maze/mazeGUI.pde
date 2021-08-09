int [] circleX = {220, 280, 340, 400};
int circleY = 60;
Boolean [] circleOver = {false, false, false, false};
Boolean [] circleSelect = {false, true, false, false};

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
  
  //maze size selection
  textSize(32);
  fill(255);
  strokeWeight(2);
  stroke(0);
  text("Maze Size:", 10,70);
  
  if(circleSelect[0]) fill(selectColor);
  else if(circleOver[0]) fill(highlightColor);
  else fill(defaultColor); 
  ellipse(circleX[0], circleY, 50, 50);
  
  if(circleSelect[1]) fill(selectColor);
  else if(circleOver[1]) fill(highlightColor);
  else fill(defaultColor);
  ellipse(circleX[1], circleY, 50, 50);
  
  if(circleSelect[2]) fill(selectColor);
  else if(circleOver[2]) fill(highlightColor);
  else fill(defaultColor); 
  ellipse(circleX[2], circleY, 50, 50);
  
  if(circleSelect[3]) fill(selectColor);
  else if(circleOver[3]) fill(highlightColor);
  else fill(defaultColor);
  ellipse(circleX[3], circleY, 50, 50);
  
  fill(0,0,0);
  text("S", circleX[0]-8, circleY+12);
  text("M", circleX[1]-14, circleY+12);
  text("L", circleX[2]-8, circleY+12);
  text("XL", circleX[3]-17, circleY+12);
  
  //settings finished button
  if(finishOver) fill(highlightColor);
  else fill(defaultColor);
  rect(finishX,finishY,finishW,finishH);
  fill(0,0,0);
  
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
  if(overCircle(circleX[0], circleY, 50)){
    circleOver[0] = true;
    circleOver[1] = false;
    circleOver[2] = false;
    circleOver[3] = false;
    finishOver = false;
  }
  else if(overCircle(circleX[1], circleY, 50)){
    circleOver[1] =  true;
    circleOver[0] = false;
    circleOver[2] = false;
    circleOver[3] = false;
    finishOver = false;
  }
  else if(overCircle(circleX[2], circleY, 50)){
    circleOver[2] = true;
    circleOver[0] = false;
    circleOver[1] = false;
    circleOver[3] = false;
    finishOver = false;
  }
  else if(overCircle(circleX[3], circleY, 50)){
    circleOver[2] = false;
    circleOver[0] = false;
    circleOver[1] = false;
    circleOver[3] = true;
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
    finishOver = false;
  }
}
