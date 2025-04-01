float a = 0.0;
float inc = TWO_PI/25.0;
float prev_x = 0, prev_y = 50, x, y;

void setup()
{
  size(1280, 720, P3D); //set windows size
  camera (0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
}

//kinda like the MAIN func
void draw()
{
  background(0);
  
  drawCartesianPlane();
  drawLinearFunction();
  drawQuadraticFunction();
  drawCircle();
  drawWave();
}

void drawCartesianPlane()
{
  strokeWeight(1); //every code below this line will be affected;
  color white = color(255, 255, 255);
  fill(white);
  stroke(white);
  line(200, 0, -200, 0);
  line(0, 200, 0, -200);
  
  for (int i = -200; i <= 200; i += 10)
  {
    line(i, -5, i, 5);
    line(-5, i, 5, i);
  }
}

void drawLinearFunction()
{
  color purple = color(255,0,255);
  fill(purple);
  stroke(purple);
  
  for(int x = -100; x <= 100; x++)
  {
    circle(x, (x*-5) + 30, 5);
  }
}

void drawQuadraticFunction()
{
  color yellow = color(255,255,0);
  fill(yellow);
  stroke(yellow);
  
  for (float x = -300; x <= 300; x+=0.1f)
  {
    circle(x * 10, ((float)Math.pow(x, 2) - (x * 15) - 3), 5);
  }
}

void drawCircle()
{
  color white = color(255,255,255);
  fill(white);
  stroke(white);
  float radius = 50.0f;
  
  for (int x = 0; x <= 360; x++)
  {
    circle((float)Math.cos(x) * radius, (float)Math.sin(x) * radius, 5);
  }
}

void drawWave()
{
  color green = color(0,255,0);
  fill(green);
  noStroke();
  
  for(float i=-200; i<= 200; i+=0.1f)
  {
    circle(i, (float)Math.sin(i*0.22f) * 16, 5);
  }
}
