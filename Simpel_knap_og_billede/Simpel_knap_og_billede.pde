import controlP5.*;
ControlP5 cp5;

boolean S = true;
PImage billede;

void setup() {
  billede =loadImage("baggrund.jpg");
  size(225, 224);

  cp5 = new ControlP5(this);

  cp5.addButton("Noget_vildt")
    .setPosition(width/2-30, 10)
    .setSize(60, 20)
    ;
}

void draw() {
  if (S) {
    background(0);
  } else {
    image(billede, 0, 0, width, height);
  }
}

void Noget_vildt() {
  S  ^= true;
}
