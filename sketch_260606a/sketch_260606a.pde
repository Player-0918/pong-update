void moveBall() {
  ballX += ballVX;
  ballY += ballVY;

  // Top and bottom wall bounce
  if (ballY - puckR <= 0) {
    ballY = puckR;
    ballVY = abs(ballVY);
  } else if (ballY + puckR >= height) {
    ballY = height - puckR;
    ballVY = -abs(ballVY);
  }

  // Left mallet collision (circle-circle)
  if (ballVX < 0) {
    float dx = ballX - leftX;
    float dy = ballY - leftY;
    float d  = sqrt(dx*dx + dy*dy);
    float minDist = malletR + puckR;

    if (d > 0 && d < minDist) {
      float nx = dx / d;
      float ny = dy / d;

      // Push puck outside mallet
      ballX = leftX + nx * (minDist + 1);
      ballY = leftY + ny * (minDist + 1);

      // Reflect velocity off collision normal
      float dot = ballVX * nx + ballVY * ny;
      ballVX -= 2 * dot * nx;
      ballVY -= 2 * dot * ny;

      // Guarantee rightward motion and clamp vertical speed
      if (ballVX < 5) ballVX = 5;
      ballVY = constrain(ballVY, -8, 8);
    }
  }

  // Right mallet collision (circle-circle)
  if (ballVX > 0) {
    float dx = ballX - rightX;
    float dy = ballY - rightY;
    float d  = sqrt(dx*dx + dy*dy);
    float minDist = malletR + puckR;

    if (d > 0 && d < minDist) {
      float nx = dx / d;
      float ny = dy / d;

      ballX = rightX + nx * (minDist + 1);
      ballY = rightY + ny * (minDist + 1);

      float dot = ballVX * nx + ballVY * ny;
      ballVX -= 2 * dot * nx;
      ballVY -= 2 * dot * ny;

      // Guarantee leftward motion and clamp vertical speed
      if (ballVX > -5) ballVX = -5;
      ballVY = constrain(ballVY, -8, 8);
    }
  }

  // Score: puck exits right side
  if (ballX > width) {
    leftScore++;
    resetBall();
  }

  // Score: puck exits left side
  if (ballX < 0) {
    rightScore++;
    resetBall();
  }
}

void resetBall() {
  ballX = width / 2;
  ballY = height / 2;

  ballVX = random(1) < 0.5 ? 6 : -6;
  ballVY = random(-3, 3);

  resetTimer  = millis() + 600;
  ballWaiting = true;
}
