//Particle Class
class Particle {
  PVector pos;
  PVector vel;
  PVector acc;
  float  mass;
  //float dt;
  float r;

  Particle(PVector v) {
    pos = v;
    vel = new PVector(random(-0.1,0.1),random(-0.1,0.1));
    acc = new PVector(0,0);
    mass = random(-5,5);
    r = 2;
  }

  void run(ArrayList<Particle> particles) {
    update(particles);
    display();
    borders();
  }
  // updates data of particle
  void update(ArrayList<Particle> particles) {
    vel.add(Force(field(particles)));
    pos.add(vel);
  }
  // how the particle looks like
  void display() {
    stroke(255);
    fill(255);
    ellipse(pos.x, pos.y, abs(mass)*r,abs(mass)*r);
  }

  // The field from other particles
  ArrayList<PVector> field(ArrayList<Particle> particles) {
    ArrayList<PVector> extFields = new ArrayList<PVector>();

    for (Particle other : particles) {
      PVector distance = PVector.sub(pos, other.pos);
      if (distance.mag() > 0) {
        extFields.add(distance.normalize().mult(mass).div(distance.magSq()));
      }
    }
    return(extFields);
    }

  // The force the particle notices
  PVector Force(ArrayList<PVector> fields) {
    PVector force = new PVector(0,0);
    for (PVector field : fields){
      force.add(field);
    }
    return(force.div(100));
  }


  // Wrap
  void borders() {
      if (pos.x < -width/2) pos.x = width/2 ;
      if (pos.y < -r) pos.y = height+r;
      if (pos.x > width+r) pos.x = -r;
      if (pos.y > height+r) pos.y = -r;
  }


}

// Display setup and draw
ArrayList<Particle> particles;

void setup() {
  size(640, 360);
  particles = new ArrayList<Particle>();
  PVector p = new PVector(0,0);
}


void draw() {
  background(0);
  if (particles != null) {
    for (Particle all : particles) {
      all.run(particles);
    }
  }
}


void mousePressed() {
  particles.add(new Particle(new PVector(mouseX, mouseY)));
}
