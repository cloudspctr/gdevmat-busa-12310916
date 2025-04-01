Walker[] walkers = new Walker[10];

void setup()
{
  size (1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0 ,0 , 0, -1, 0);
  
  for (int i = 0; i < 10; i++)
  {
    walkers[i] = new Walker();
    walkers[i].position = new PVector(random(Window.bottom, Window.top), random(Window.left, Window.right));
    walkers[i].mass = random(3, 10);
    walkers[i].scale = walkers[i].mass * 10;
    
    walkers[i].r = random(0, 255);
    walkers[i].g = random(0, 255);
    walkers[i].b = random(0, 255);
    walkers[i].a = 150;
  }
}

void draw()
{
  background(0);
  
  for (int i = 0; i < 10; i++)
  {
    walkers[i].render();
    walkers[i].update();
    for (int j = 0; j < 10; j++)
    {
      if (i != j)
      {
        walkers[i].applyForce(walkers[j].calculateAttraction(walkers[i]));
        //walkers[j].applyForce(walkers[i].calculateAttraction(walkers[j]));
      }
    }
  }
}

void mouseClicked()
{
  setup();
  draw();
}
