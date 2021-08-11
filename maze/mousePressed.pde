void mousePressed() { //<>// //<>//
  if(!playing){
    if(circleOver[0] == true){
      circleSelect[0] = true;
      cellSize = 120;
      buttonOffsetY = 30;
      textButtonOffsetY = -30;
      for (int i = 1; i < circleSelect.length-2; i++)
        circleSelect[i] = false;
    }
    else if(circleOver[1] == true){
      circleSelect[1] = true;
      cellSize = 80;
      buttonOffsetY = 10;
      textButtonOffsetY = 10;
      for(int i = 0; i < circleSelect.length-2; i++)
        if (i != 1) circleSelect[i] = false;
    }
    else if(circleOver[2] == true){
      circleSelect[2] = true;
      cellSize = 60;
      buttonOffsetY = 0;
      textButtonOffsetY = 30;
      for(int i = 0; i < circleSelect.length-2; i++)
        if (i != 2) circleSelect[i] = false;
    }
    else if(circleOver[3] == true){
      circleSelect[3] = true;
      cellSize = 10;
      buttonOffsetY = 0;
      textButtonOffsetY = 30;
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
    else if(finishOver){ //play button
      noStroke();
      strokeWeight(1);
      finishOver = false;
      settingsComplete = true;
      generating = true;
      setUpCells();
    }
  }
  if(playing){
    if(gameButtonOver[0]){
      //start pathfinding from player location
      if(!solved){
        solving = true;
        bfsMaze(player, myCells);
        solved = true;
      }
    }
    if(gameButtonOver[1]){
      //do nothing for now -todo: implement other pathfinding algorithms
      //if(algoIndex == 3) algoIndex = 0;
      //else algoIndex++;
    }
    if(gameButtonOver[2]){ //main menu button
      playing = false;
      settingsComplete = false;
      gameButtonOver[2] = false;
      solved = false;
      solving = false;
    }
  }
}
