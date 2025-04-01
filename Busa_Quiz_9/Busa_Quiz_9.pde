Walker[] walkers = new Walker[8];
PVector friction = new PVector();

void setup()
{
  size (1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0 ,0 , 0, -1, 0);
  int posY = 0;
  float mass = 9;
  
  for (int i = 0; i < 8; i++)
  {
    posY = 2 * (Window.windowHeight / 8) * (i - 4);
    
    walkers[i] = new Walker();
    walkers[i].position = new PVector(-500, posY);
    
    walkers[i].mass = mass;
    walkers[i].scale = walkers[i].mass * 10;
    walkers[i].r = random(0, 255);
    walkers[i].g = random(0, 255);
    walkers[i].b = random(0, 255);
    walkers[i].render();
    
    mass--;
  }
}

void draw()
{
  background(80);
  
  for (Walker w: walkers)
  {
    
    friction = w.velocity.copy();
     
    this.friction.mult(-1);
    this.friction.normalize();
    this.friction.mult(w.frictionMag);
    w.applyForce(friction);
    
    w.render();
    w.update();
    
    PVector acceleration = new PVector(0.025 * w.mass, 0); //bonus
    //PVector acceleration = new PVector(0.2, 0); // without bonus
    w.applyForce(acceleration);
  
    w.checkPosition();
  }
}

void mouseClicked()
{
  setup();
  draw();
}
