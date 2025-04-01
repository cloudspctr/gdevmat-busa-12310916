void setup()
{
  size(1280, 720, P3D); //set windows size
  camera (0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
  background(0);
}

void draw()
{
  float gaussian = randomGaussian();
  float mean = random(20);
  float std = 250;
  float x = std * gaussian + mean;
  
  noStroke();
  fill (random(256), random(256), random(256), random(10, 100));
  
  circle(x, random(-(height/2.0), (height/2.0)), randScale());
  
  if (frameCount == 300)
  {
    background(0); //???
    frameCount = 0;
  }
  println(frameCount);
}

float randScale()
{
  float scale = random(1, 20) * randomGaussian() + random(1, 100);
  return scale;
}

//do bonus
