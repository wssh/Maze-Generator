void mousePressed() {
  if(!settingsComplete){
    if(circleOver[0] == true){
      circleSelect[0] = true;
      cellSize = 120;
      for (int i = 1; i < circleSelect.length; i++)
        circleSelect[i] = false;
    }
    else if(circleOver[1] == true){
      circleSelect[1] = true;
      cellSize = 80;
      for(int i = 0; i < circleSelect.length; i++)
        if (i != 1) circleSelect[i] = false;
    }
    else if(circleOver[2] == true){
      circleSelect[2] = true;
      cellSize = 60;
      for(int i = 0; i < circleSelect.length; i++)
        if (i != 2) circleSelect[i] = false;
    }
    else if(circleOver[3] == true){
      circleSelect[3] = true;
      cellSize = 20;
      for(int i = 0; i < circleSelect.length; i++)
        if (i != 3) circleSelect[i] = false;
    }
    else if(finishOver){
      setUpCells();
      noStroke();
      strokeWeight(1);
      settingsComplete = true;
    }
  }
}
