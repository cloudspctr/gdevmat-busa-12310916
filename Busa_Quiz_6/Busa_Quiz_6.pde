void setup()
{
  camera(0, 0, Window.eyeZ, 0, 0 ,0 , 0, -1, 0);
  size (1080, 720, P3D);
}

PVector mousePos()
{
  float x = mouseX - Window.widthPx / 2;
  float y = -(mouseY - Window.heightPx / 2);
  return new PVector(x, y);
}

void draw()
{
  println(mousePos().x + " " + mousePos().y);
  background(130);
  PVector mouseA = mousePos();
  PVector mouseB = mousePos();
  PVector mouseC = mousePos();
  mouseA.div(3);
  mouseB.mult(2);
  mouseC.mult(2);
  
  //outer
  strokeWeight(20);
  stroke(255, 0, 0);
  line(0, 0, mouseB.x, mouseB.y);
  
  //inner
  strokeWeight(8);
  stroke(255, 255, 255);
  line(0, 0, mouseC.x, mouseC.y);
  
  //handle
  strokeWeight(16);
  stroke(0, 0, 0);
  line(0, 0, mouseA.x, mouseA.y);
  
  strokeWeight(20);
  stroke(255, 0, 0);
  line(0, 0, -mouseB.x, -mouseB.y);
  
  //inner
  strokeWeight(8);
  stroke(255, 255, 255);
  line(0, 0, -mouseC.x, -mouseC.y);
  
  //handle
  strokeWeight(16);
  stroke(0, 0, 0);
  line(0, 0, -mouseA.x, -mouseA.y);
  
}
