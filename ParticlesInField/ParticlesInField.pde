//Particle Class
class Particle {
  PVector pos;
  PVector vel;
  PVector acc;
  float  mass;


  Particle(PVector v, float m) {
    pos = v;
    vel = new PVector(random(-0.1,0.1),random(-0.1,0.1));
    acc = new PVector(0,0);
    mass = m;
  }


  void run() {
    update();
    display();
  }
  // updates data of particle
  void update() {
    vel.add(acc);
    pos.add(vel);
  }
  // how the particle looks like
  void display() {
    stroke(255);
    fill(255);
    ellipse(pos.x, pos.y, 4,4);
  }
}

// Multiple particles
//Class Particles {
//  ArrayList<Particle> particles;

//}

// Display setup and draw
ArrayList<Particle> particles;

void setup() {
  size(640, 360);
  particles = new ArrayList<Particle>();
  PVector p = new PVector(0,0);
}


void draw() {
  background(0);
  if (particles !=  null){
    print(particles.size());
  }
  if (particles != null) {
    for (int i = 0; i < particles.size(); i ++) {
    particles.get(i).run();
    }
  }
}


void mousePressed() {
  particles.add(new Particle(new PVector(mouseX, mouseY), 2));
}

/*
void borders() {
    if (position.x < -r) position.x = width+r;
    if (position.y < -r) position.y = height+r;
    if (position.x > width+r) position.x = -r;
    if (position.y > height+r) position.y = -r;
}
*/
