void setup() {
  size(600, 600);
  background(#ffffff);
  noLoop();
}

void draw() {
  stroke(#000000);
  // Helicopter
  int heliX = 10;
  int heliY = 10;
  
  fill(#444444);
  drawHeli(heliX, heliY, 500);
}

void drawHeli(int x, int y, float width) {
  // angle of the body
  float degree = 15 * PI / 180;
  // radius of the pilot cabin
  float r = width * sin(degree) / (2 + 2 * sin(degree));
  // height of the top-propellers
  float propHeight = r;
  // the body of the helicopter
    // distances for the coordinates of the curve ends
    float a = sin(degree/2) * 2*r * cos(degree/2);
    float b = sin(degree/2) * 2*r * sin(degree/2);
    // distance for the foot- and top propeller-collumn
    float c = tan(degree) * (r - a);
    // distance for the quadraticVertex controlPoint
    float d = r * tan(degree/2);
    beginShape();
    vertex(x + r + a, y + 2*r - b + propHeight);
    quadraticVertex(x + r + d, y + 2*r + propHeight, x + r, y + 2*r + propHeight);
    quadraticVertex(x, y + 2*r + propHeight, x, y + r + propHeight);
    quadraticVertex(x, y + propHeight, x + r, y + propHeight);
    quadraticVertex(x + r + d, y + propHeight, x + r + a, y + b + propHeight);
    vertex(x + r + a, y + b + propHeight);
    vertex(x + width/2, y + r + propHeight);
    endShape(CLOSE);
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
