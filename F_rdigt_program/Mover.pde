class Mover {

  PVector location;
  PVector velocity;
  PVector acceleration;

  float mass;

  Mover(float m, float x, float y) {
    mass = m;
    location = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
  }


  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    velocity.limit(10);
    acceleration.mult(0);
  }

  void display() {
    stroke(0);
    fill(175);
    ellipse(location.x, location.y, mass*10, mass*10);
  }

  void checkEdges() {
    if (location.x > width) {
      location.x = width;
      velocity.x *= -1;
    } else if (location.x < 0) {
      velocity.x *= -1;
      location.x = 0;
    } else if (location.y > 0.11*location.x+400-mass*5) {
      velocity.y *=-1;
      PVector slope = new PVector(3, 0);
      applyForce(slope);
      location.y = 0.11*location.x+400-mass*5;
    } else if (location.y < 0) {
      velocity.y *= -1;
      location.y = 0;
    }
  }
}
