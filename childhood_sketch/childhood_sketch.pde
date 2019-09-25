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
  
  drawHeli(heliX, heliY, 1200);
}

void drawHeli(int x, int y, float size) {
  // angle of the body
  float degree = 15 * PI / 180;
  // radius of the pilot cabin
  float r = size * sin(degree) / (2 + 2 * sin(degree));
  // height of the top-propellers
  float propHeight = r;
  // the pilot cabin
  arc(x + r, y + r + propHeight, 2*r, 2*r, HALF_PI - degree, 3*HALF_PI + degree);
  // the tail of the heli
  float a = sin(degree/2) * 2*r * cos(degree/2);
  float b = sin(degree/2) * 2*r * sin(degree/2);
  float c = tan(degree) * (r - a);
  line(x + r + a, y + b +propHeight, x + size/2, y + r + propHeight);
  line(x + r + a, y + 2*r - b + propHeight, x + size/2, y + r + propHeight);
  // foot of the heli
  line(x + r, y + 2*r + propHeight, x + r, y + 2.5*r + propHeight);
  line(x + 2*r, y + 2*r - c - b + propHeight, x + 2*r, y + 2.5*r + propHeight);
  line(x, y + 2.5*r + propHeight, x + 3*r, y + 2.5*r + propHeight);
  // top propeller
  line(x + 1.5*r, y + propHeight/2, x + 1.5*r, y + propHeight + c/2);
  line(x, y, x + 3*r, y + propHeight);
  line(x, y + propHeight, x + 3*r, x);
  // back propeller
  //line 
}
