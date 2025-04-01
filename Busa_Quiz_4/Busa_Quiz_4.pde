float t = 0;
float r = 0, g = 0, b = 0;
float tr = 255, tg = 255, tb = 255;
Walker perlinWalker = new Walker();

void setup()
{
  size(1280, 720, P3D);
  camera (0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
  background(255);
}

void draw()
{
  perlinWalker.design();
  perlinWalker.perlinWalk();
  perlinWalker.render();
}
