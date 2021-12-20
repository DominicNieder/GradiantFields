
int dim;

void setup() {
  size(840, 640);
  dim = width/3;
  background(0);
  colorMode(HSB, 250, 100, 100);
  noStroke();
  ellipseMode(RADIUS);
  frameRate(1);
}

void draw() {
  background(0);
  for (int x = 0; x <= width; x+=dim) {
    drawGradient(x, height);
  }
}

void drawGradient(float x, float y) {
  int radius = dim;
  float h = random(0, 360);
  for (int  r=radius; r > 0; --r) {
    fill(h, 100, 100);
    ellipse(x, y, r, r);
    h = (h + 1) % 360;
  }
}
