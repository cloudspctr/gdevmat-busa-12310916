Walker[] walkers = new Walker[10];
PVector wind = new PVector(0.15, 0);
PVector gravity = new PVector(0, -0.4);

void setup()
{
  size (1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0 ,0 , 0, -1, 0);
  
  for (int i = 0; i < 10; i++)
  {
    walkers[i] = new Walker();
    walkers[i].position = new PVector(-500, 200);
    
    walkers[i].mass = 10-i;
    walkers[i].scale = walkers[i].mass * 15;
    walkers[i].r = random(0, 255);
    walkers[i].g = random(0, 255);
    walkers[i].b = random(0, 255);
    walkers[i].render();
  }
}

void draw()
{
  background(80);
  
  for (Walker w: walkers)
  {
    w.render();
    w.update();
    w.applyForce(gravity);
    w.applyForce(wind);
  
    w.checkEdges();
  }
}
