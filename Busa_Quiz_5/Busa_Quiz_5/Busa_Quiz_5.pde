void setup()
{
  size (1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0 ,0 , 0, -1, 0);
}

Walker bounceball = new Walker();

void draw()
{
  background(255);
  
  bounceball.moveAndBounce();
  
  fill(182,52,100);
  bounceball.render();
}
