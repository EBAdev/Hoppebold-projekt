import controlP5.*;
ControlP5 cp5;

boolean S = true;

void setup() {
  size(600, 600);
background(136,206,235);
    fill(210,105,93);
  triangle(0,400,0,600,800,600);
  fill(253,184,19);
circle(580,0,100);

  cp5 = new ControlP5(this);

  cp5.addButton("Restart")
    .setPosition(10, 10)
    .setSize(20, 20)
    ;
}


void Restart() {
  S  ^= true;
}
