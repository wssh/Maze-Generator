enum Movement{
  goUp,
  goDown,
  goLeft,
  goRight
}

void keyPressed() {
  if (keyCode == DOWN){
    if(isMovementValid(player, Movement.goDown, myCells)){
      player.moveDown();
    }
  }
  else if (keyCode == UP){
    if(isMovementValid(player, Movement.goUp, myCells))
      player.moveUp();
  }
  else if (keyCode == LEFT){
    if(isMovementValid(player, Movement.goLeft, myCells))
      player.moveLeft();
  }
  else if (keyCode == RIGHT){
    if(isMovementValid(player, Movement.goRight, myCells))
      player.moveRight();
  }
}
