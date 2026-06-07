int mode;

final int INTRO    = 0;
final int GAME     = 1;
final int PAUSE    = 2;
final int GAMEOVER = 3;

// Puck
float ballX, ballY;
float ballVX, ballVY;
float puckR = 18;

// Mallets
float leftX  = 65;
float leftY;
float rightX;
float rightY;

float malletR    = 35;
float paddleSpeed = 6;

// Scores
int leftScore  = 0;
int rightScore = 0;

// Controls
boolean wPressed, sPressed;
boolean upPressed, downPressed;

// Mode
boolean onePlayer = true;

// Reset timer
int     resetTimer  = 0;
boolean ballWaiting = false;

// Colors
color bgColor    = #0B1929;
color lineColor  = #DCEEFF;
color leftColor  = #E63946;
color rightColor = #457B9D;
color puckColor  = #FFD700;
color textColor  = #F1FAEE;

void setup() {
  size(900, 600);
  rightX = width - 65;
  mode = INTRO;
  resetGame();
}

void draw() {
  background(bgColor);

  if (mode == INTRO) {
    introMode();
  } else if (mode == GAME) {
    gameMode();
  } else if (mode == PAUSE) {
    pauseMode();
  } else if (mode == GAMEOVER) {
    gameOverMode();
  }
}
