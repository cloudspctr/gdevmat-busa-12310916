Walker[] walkers = new Walker[100];

PVector mousePos()
{
  float x = mouseX - Window.widthPx / 2;
  float y = -(mouseY - Window.heightPx / 2);
  
  return new PVector(x, y);
}

void setup()
{
  size (1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0 ,0 , 0, -1, 0);
  
  for (int i = 0; i < 100; i++)
  {
    float size = random(20, 50);
    
    walkers[i] = new Walker();
    walkers[i].position = new PVector(random(Window.bottom, Window.top), random(Window.left, Window.right));
    
    walkers[i].scale = size;
  }
}

void draw()
{
  background(80);
  
  for (Walker w: walkers)
  {
    w.render();
    
    PVector direction = PVector.sub(mousePos(), w.position);
    direction.normalize().mult(0.2);
    
    w.update(direction);
  }
}
