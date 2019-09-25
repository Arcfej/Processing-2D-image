void setup() {
  size(600, 600);
  background(#ffffff);
  noLoop();
}

void draw() {
  stroke(#000000);
  // Helicopter
  int heliX = 0;
  int heliY = 0;
  
  drawHeli(heliX, heliY, 500, #eaeaea);
}

void drawHeli(int x, int y, float width, color hexColor) {
  // angle of the body
  float degree = 15 * PI / 180;
  // radius of the pilot cabin
  float r = width * sin(degree) / (1 + sin(degree));
  // height of the top-propellers
  float propHeight = r;
  // the body of the helicopter
    // distances for the coordinates of the curve ends
    float a = sin(degree/2) * 2*r * cos(degree/2);
    float b = sin(degree/2) * 2*r * sin(degree/2);
    // distance for the foot- and top propeller-collumn
    float c = tan(degree) * (r - a);
    // pilot cabin
    fill(#80EBF0);
    arc(x + r, y + r + propHeight, 2*r, 2*r, HALF_PI - degree, 3*HALF_PI + degree, OPEN);
    // tail
    fill(hexColor);
    beginShape();
    vertex(x + r + a, y + b + propHeight);
    vertex(x + width, y + r + propHeight);
    vertex(x + r + a, y + 2*r - b + propHeight);
    endShape();
  strokeWeight(width/100);
  // foot of the heli
  line(x + r, y + 2*r + propHeight, x + r, y + 2.5*r + propHeight);
  line(x + 2*r, y + 2*r - c - b + propHeight, x + 2*r, y + 2.5*r + propHeight);
  line(x, y + 2.5*r + propHeight, x + 3*r, y + 2.5*r + propHeight);
  // top propeller
  line(x + 1.5*r, y + propHeight/2, x + 1.5*r, y + propHeight + c/2);
  line(x, y, x + 3*r, y + propHeight);
  line(x, y + propHeight, x + 3*r, x);
  // back propeller
  line(x + width - 2*a, y + propHeight + 2*r - 15*b, x + width, y + 15*b + propHeight);
  strokeWeight(1);
  fill(#000000);
  circle(x + width - a, y + propHeight + r, width/45);
}
