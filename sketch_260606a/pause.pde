void pauseMode() {
  // Draw frozen game state (no logic update)
  drawGameElements();

  // Dark overlay
  fill(0, 0, 0, 160);
  noStroke();
  rect(0, 0, width, height);

  // Pause text
  fill(lineColor);
  textAlign(CENTER, CENTER);
  textSize(88);
  text("PAUSED", width/2, height/2 - 24);

  textSize(22);
  fill(160, 190, 220);
  text("click to resume", width/2, height/2 + 56);
}
