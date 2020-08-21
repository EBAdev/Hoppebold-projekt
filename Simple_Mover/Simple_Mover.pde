Mover[] movers = new Mover[10];

void setup() {
  size(600, 200);
  for (int i = 0; i < movers.length; i++) {
    float m =random(0.1, 5);
    movers[i] = new Mover(m, random(width-100), height-m*5);
  }
}
PVector moveRight = new PVector(4,0);
void draw() {
  background(255);


  
  for (int i = 0; i < movers.length; i++) {
    if (mousePressed){
    movers[i].applyForce(moveRight);
    }
    movers[i].checkEdges();
    movers[i].update();
    movers[i].display();
  }
}
