class Walker
{
   PVector position = new PVector();
   float scale = 100;
   float r = 255;
   float g = 255;
   float b = 255;
   
   void render()
   {
     fill(r, g, b);
     noStroke();
     circle(position.x, position.y, scale);
   }
}
