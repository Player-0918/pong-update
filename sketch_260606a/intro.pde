void introMode() {
  // Table decorations
  noFill();
  stroke(lineColor);
  strokeWeight(3);
  rect(3, 3, width - 6, height - 6);

  stroke(220, 238, 255, 50);
  strokeWeight(2);
  ellipse(width/2, height/2, 220, 220);

  stroke(220, 238, 255, 25);
  strokeWeight(3);
  line(width/2, 0, width/2, height);

  // Title
  textAlign(CENTER, CENTER);
  fill(lineColor);
  textSize(80);
  text("PONG- BUT AIR HOCKEY ;)", width/2, 140);

  // Subtitle
  textSize(17);
  fill(120, 170, 210);
  text("first to 7 wins", width/2, 215);

  // 1 Player button
  rectMode(CORNER);
  fill(leftColor);
  noStroke();
  rect(220, 300, 180, 80, 12);
  fill(textColor);
  textSize(30);
  text("1 Player", 310, 340);

  // 2 Player button
  fill(rightColor);
  rect(500, 300, 180, 80, 12);
  fill(textColor);
  text("2 Player", 590, 340);

  // Controls hint
  textSize(16);
  fill(100, 150, 190);
  text("Left: W / S          Right: ↑ / ↓", width/2, 500);
}
