void aiMove() {
  if (ballY < rightY - 8) rightY -= 5;
  else if (ballY > rightY + 8) rightY += 5;

  rightY = constrain(rightY, malletR, height - malletR);
}
