void gameOverMode() {
  // Table decorations
  noFill();
  stroke(lineColor);
  strokeWeight(3);
  rect(3, 3, width - 6, height - 6);

  stroke(220, 238, 255, 40);
  strokeWeight(2);
  ellipse(width/2, height/2, 220, 220);

  stroke(220, 238, 255, 20);
  strokeWeight(3);
  line(width/2, 0, width/2, height);

  // Scores
  textAlign(CENTER, CENTER);
  textSize(52);
  fill(leftColor);
  text(leftScore, width/2 - 120, 55);
  fill(lineColor);
  text("-", width/2, 55);
  fill(rightColor);
  text(rightScore, width/2 + 120, 55);

  // Winner announcement
  boolean leftWins = leftScore > rightScore;
  color winColor = leftWins ? leftColor : rightColor;
  String winText = leftWins ? "RED WINS" : "BLUE WINS";

  fill(winColor);
  textSize(80);
  text(winText, width/2, height/2 - 10);

  // Return prompt
  fill(lineColor);
  textSize(22);
  text("click to return to menu", width/2, height - 75);
}
