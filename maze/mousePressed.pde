void mousePressed() {
  if(!settingsComplete){
    if(circleOver[0] == true){
      circleSelect[0] = true;
      cellSize = 120;
      for (int i = 1; i < circleSelect.length-2; i++)
        circleSelect[i] = false;
    }
    else if(circleOver[1] == true){
      circleSelect[1] = true;
      cellSize = 80;
      for(int i = 0; i < circleSelect.length-2; i++)
        if (i != 1) circleSelect[i] = false;
    }
    else if(circleOver[2] == true){
      circleSelect[2] = true;
      cellSize = 60;
      for(int i = 0; i < circleSelect.length-2; i++)
        if (i != 2) circleSelect[i] = false;
    }
    else if(circleOver[3] == true){
      circleSelect[3] = true;
      cellSize = 20;
      for(int i = 0; i < circleSelect.length-2; i++)
        if (i != 3) circleSelect[i] = false;
    }
    else if(circleOver[4] == true){
      circleSelect[4] = true;
      circleSelect[5] = false;
      instantGen = true;
    }
    else if(circleOver[5] ==  true){
      circleSelect[4] = false;
      circleSelect[5] = true;
      instantGen = false;
    }
    else if(finishOver){
      setUpCells();
      noStroke();
      strokeWeight(1);
      settingsComplete = true;
    }
  }
}
