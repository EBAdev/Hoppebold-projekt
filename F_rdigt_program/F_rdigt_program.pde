import controlP5.*;
ControlP5 cp5;
ArrayList <Mover> movers = new ArrayList <Mover>();
int numEnt = 1;

void setup() {
  cp5 = new ControlP5(this);
  cp5.addButton("Restart")
    .setPosition(10, 10)
    .setSize(50, 20)
    ;
  cp5.addSlider("Bolde")
    .setPosition(100, 10)
    .setSize(100, 20)
    .setMax(10)
    .setMin(1)
    .setNumberOfTickMarks(10)
    ;

  for (int i = 0; i < numEnt; i++) {
    float m =3;
    movers.add(new Mover(m, random(width-100), random(height-400)));
  }
}

void settings() {
  size(600, 600);
}

void draw() {
  background(136, 206, 235);
  fill(210, 105, 93);
  triangle(0, 400, 0, 600, 600, 460);
  noStroke();
  rect(0,460,610,210);
  fill(253, 184, 19);
  circle(580, 0, 100);

  for (int i = 0; i < movers.size(); i++) {
    Mover m = movers.get(i);
    PVector Gravity = new PVector(0, 0.9*m.mass);

    float c = 0.1;
    PVector friction = m.velocity.copy();
    friction.mult(-1);
    friction.normalize();
    friction.mult(c);
    for (int j = 0; j < movers.size(); j++) {
      Mover k = movers.get(j);

      if (m != k) {
        PVector g = PVector.sub(m.location, k.location);
        float distanceBetween = g.mag();
        if (distanceBetween <= m.mass*10) {
          m.velocity.add(g.setMag(4));
        }
      }
    }
    m.applyForce(friction);
    m.applyForce(Gravity);
    m.checkEdges();
    m.update();
    m.display();
  }
}

void mouseReleased() {
  if (mouseY > 40) {
    float m =3;
    float bolde = cp5.getController("Bolde").getValue();
    for (int i = 0; i < bolde; i++) {
      movers.add(new Mover(m, mouseX, mouseY));
    }
  }
}

void Restart() {
  movers.clear();
  setup();
}
