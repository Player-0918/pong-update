void movePaddles() {
  if (wPressed) leftY -= paddleSpeed;
  if (sPressed) leftY += paddleSpeed;

  if (!onePlayer) {
    if (upPressed)   rightY -= paddleSpeed;
    if (downPressed) rightY += paddleSpeed;
  }

  leftY  = constrain(leftY,  malletR, height - malletR);
  rightY = constrain(rightY, malletR, height - malletR);
}
