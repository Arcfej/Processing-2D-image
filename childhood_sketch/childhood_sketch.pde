void setup() {
  size(600, 600);
  background(#ffffff);
  noLoop();
}

void draw() {
  stroke(#000000);
  drawHeli(15, 15, 100, #dadada);
  drawHeli(150, 125, 100, #dadada);
  drawHeli(320, 100, 100, #dadada);
  drawHeli(488, 39, 100, #dadada);
}

void drawHeli(int x, int y, int width, color hexColor) {
  float degree = radians(15);                        // angle of the body
  float r = width * sin(degree) / (1 + sin(degree)); // radius of the pilot cabin
  float propHeight = r;                              // height of the top-propellers
  // the body of the helicopter
    float a = sin(degree/2) * 2*r * cos(degree/2);   // distances for the coordinates of the curve ends
    float b = sin(degree/2) * 2*r * sin(degree/2);   // distances for the coordinates of the curve ends
    float c = tan(degree) * (r - a);                 // distance for the foot- and top propeller-collumn
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
  line(x, y + propHeight, x + 3*r, y);
  // back propeller
  line(x + width - 2*a, y + propHeight + 2*r - 15*b, x + width, y + 15*b + propHeight);
  noStroke();
  fill(#000000);
  ellipse(x + width - a, y + propHeight + r, width/50, width/50);
  // carry the person
  stroke(#000000);
  strokeWeight(width/175);
  line(x + 1.5*r, y + propHeight + 2*r - c/2, x + 1.5*r, y + propHeight + 4.5*r);
  shape(createPerson(x + r, y + propHeight + 3.25*r, r));
}

PShape createPerson(float x, float y, float width) {
  noFill();
  stroke(#000000);
  strokeWeight(0.05*width);
  PShape person = createShape(GROUP);
  // head
  person.addChild(createShape(ELLIPSE, x + width/2, y + width/4, width/2, width/2));
  // body
  person.addChild(createShape(LINE, x + width/2, y + width/2, x + width/2, y + 1.5*width));
  // arms
  person.addChild(createShape(LINE, x, y + 0.1*width, x + 0.5*width, y + 0.75*width));
  person.addChild(createShape(LINE, x + width, y + 0.1*width, x + 0.5*width, y + 0.75*width));
  // legs
  person.addChild(createShape(LINE, x + width/2, y + 1.5*width, x, y + 2.5*width));
  person.addChild(createShape(LINE, x + width/2, y + 1.5*width, x + width, y + 2.5*width));
  return person;
}
