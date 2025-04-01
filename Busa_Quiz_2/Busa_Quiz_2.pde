Walker myWalker = new Walker();
Walker enemyWalker = new Walker();

void setup()
{
  size(1280, 720, P3D); //set windows size
  camera (0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
}

void draw()
{
  fill(random(255), random(255), random(255), random(50, 100));
  noStroke();
  
  myWalker.render();
  enemyWalker.render();
  
  myWalker.randomWalk();
  enemyWalker.randomWalkBiased();
}
