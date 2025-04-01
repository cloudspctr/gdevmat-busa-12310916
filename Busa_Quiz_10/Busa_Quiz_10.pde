Walker[] walkers = new Walker[10];
Liquid ocean = new Liquid(0, -100, Window.right, Window.bottom, 0.1f);
PVector wind = new PVector(0.1, 0);

void setup()
{
  size (1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0 ,0 , 0, -1, 0);
  int posX;
  
  for (int i = 0; i < 10; i++)
  {
    walkers[i] = new Walker();
    walkers[i].mass = 10-i;
    walkers[i].scale = walkers[i].mass * 10;
    
    posX = 2 * (Window.windowWidth / 12) * (i - 5);
    walkers[i].position = new PVector(posX, 300);
    
    walkers[i].r = random(0, 255);
    walkers[i].g = random(0, 255);
    walkers[i].b = random(0, 255);
    walkers[i].render();
  }
}

void draw()
{
  background(255);
  
  ocean.render();
  for (Walker w: walkers)
  {
    w.render();
    w.update();
    w.applyForce(wind);

    PVector gravity = new PVector(0, -0.15 * w.mass);
    w.applyForce(gravity);
    
    float mew = 0.1f;
    float normal = 1;
    float frictionMag = mew * normal;
    PVector friction = w.velocity.copy();
    
    w.applyForce(friction.mult(-1).normalize().mult(frictionMag));
    
    w.checkPosition();
    if (ocean.isCollidingWith(w))
    {
      PVector dragForce = ocean.calculateDragForce(w);
      w.applyForce(dragForce);
      w.velocity.x = 0;
    }
  }
}

void mouseClicked()
{
  setup();
  draw();
}
