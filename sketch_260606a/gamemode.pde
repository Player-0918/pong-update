// Draws the frozen game state — called by both gameMode and pauseMode.
void drawGameElements() {
  // Table border
  stroke(lineColor);
  strokeWeight(4);
  noFill();
  rect(3, 3, width - 6, height - 6);

  // Dashed center line
  stroke(lineColor);
  strokeWeight(2);
  drawDashedLine(width/2, 6, width/2, height - 6, 16);

  // Center circle
  noFill();
  stroke(lineColor);
  strokeWeight(2);
  ellipse(width/2, height/2, 180, 180);

  // Center dot
  fill(lineColor);
  noStroke();
  ellipse(width/2, height/2, 8, 8);

  // Goal zone markers
  strokeWeight(5);
  stroke(leftColor);
  line(5, height/2 - 70, 5, height/2 + 70);
  stroke(rightColor);
  line(width - 5, height/2 - 70, width - 5, height/2 + 70);

  // Puck shadow
  noStroke();
  fill(0, 0, 0, 70);
  ellipse(ballX + 3, ballY + 3, puckR * 2, puckR * 2);
  // Puck body
  fill(puckColor);
  ellipse(ballX, ballY, puckR * 2, puckR * 2);
  // Puck highlight
  fill(255, 255, 255, 130);
  ellipse(ballX - puckR * 0.28, ballY - puckR * 0.28, puckR * 0.55, puckR * 0.55);

  // Left mallet shadow
  fill(0, 0, 0, 70);
  ellipse(leftX + 3, leftY + 3, malletR * 2, malletR * 2);
  // Left mallet body
  fill(leftColor);
  noStroke();
  ellipse(leftX, leftY, malletR * 2, malletR * 2);
  // Left mallet inner ring
  fill(0, 0, 0, 80);
  ellipse(leftX, leftY, malletR * 0.65, malletR * 0.65);
  // Left mallet center handle
  fill(255, 255, 255, 160);
  ellipse(leftX, leftY, malletR * 0.25, malletR * 0.25);

  // Right mallet shadow
  fill(0, 0, 0, 70);
  ellipse(rightX + 3, rightY + 3, malletR * 2, malletR * 2);
  // Right mallet body
  fill(rightColor);
  noStroke();
  ellipse(rightX, rightY, malletR * 2, malletR * 2);
  // Right mallet inner ring
  fill(0, 0, 0, 80);
  ellipse(rightX, rightY, malletR * 0.65, malletR * 0.65);
  // Right mallet center handle
  fill(255, 255, 255, 160);
  ellipse(rightX, rightY, malletR * 0.25, malletR * 0.25);

  // Scores
  textAlign(CENTER, CENTER);
  textSize(52);
  fill(leftColor);
  text(leftScore, width/2 - 120, 52);
  fill(rightColor);
  text(rightScore, width/2 + 120, 52);
}

void drawDashedLine(float x1, float y1, float x2, float y2, float dashLen) {
  float d  = dist(x1, y1, x2, y2);
  float nx = (x2 - x1) / d;
  float ny = (y2 - y1) / d;
  float pos = 0;
  boolean drawing = true;
  while (pos < d) {
    float end = min(pos + dashLen, d);
    if (drawing) {
      line(x1 + nx * pos, y1 + ny * pos, x1 + nx * end, y1 + ny * end);
    }
    pos += dashLen;
    drawing = !drawing;
  }
}

void gameMode() {
  movePaddles();

  if (onePlayer) aiMove();

  if (ballWaiting) {
    if (millis() > resetTimer) ballWaiting = false;
  } else {
    moveBall();
  }

  drawGameElements();

  if (leftScore >= 7 || rightScore >= 7) {
    mode = GAMEOVER;
  }
}
