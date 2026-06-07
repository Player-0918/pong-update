void mousePressed() {
  // intro
  if (mode == INTRO) {
    // 1 Player Button
    if (mouseX > 220 && mouseX < 400 &&
      mouseY > 300 && mouseY < 380) {
      onePlayer = true;
      resetGame();
      mode = GAME;
    }

    // 2 Player Button
    if (mouseX > 500 && mouseX < 680 &&
      mouseY > 300 && mouseY < 380) {
      onePlayer = false;
      resetGame();
      mode = GAME;
    }
  }

  // game to pause
  else if (mode == GAME) {
    mode = PAUSE;
  }

  // pause to game
  else if (mode == PAUSE) {
    mode = GAME;
  }

  // game over to intro
  else if (mode == GAMEOVER) {
    resetGame();
    mode = INTRO;
  }
}
