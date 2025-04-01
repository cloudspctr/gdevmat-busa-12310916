Walker blackHole = new Walker();
Walker[] walkers = new Walker[50];

void setup()
{
  size (1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0 ,0 , 0, -1, 0);
  
  for (int i = 0; i < 50; i++)
  {
    float size = random(20, 80);
    float red = random(0, 255);
    float green = random(0, 255);
    float blue = random(0, 255);
    
    walkers[i] = new Walker();
    walkers[i].position = new PVector(random(-Window.widthPx, Window.widthPx), random(-Window.heightPx, Window.heightPx));
    
    walkers[i].scale = size;
    walkers[i].r = red;
    walkers[i].g = green;
    walkers[i].b = blue;
  }
  
  blackHole.position.x = random(-100, 100);
  blackHole.position.y = random(-100, 100);
}

PVector mousePos()
{
  float x = mouseX - Window.windowWidth / 2;
  float y = (mouseY - Window.windowHeight / 2);
  
  return new PVector(x, y);
}

void draw()
{
  background(0);
  
  for (int i = 0; i < 50; i++)
  {
    walkers[i].render();
    
    PVector direction = PVector.sub(blackHole.position, walkers[i].position);
    direction.normalize();
    direction.mult(10.0);
    
    walkers[i].position.add(direction);
  }
    blackHole.render();
}
