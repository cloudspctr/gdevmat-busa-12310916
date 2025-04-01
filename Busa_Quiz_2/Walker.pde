class Walker
{
   float x;
   float y;
   void render()
   {
     circle(x, y, 30);
   }
   
   void randomWalk()
   {
     int rng = int(random(4));
     
     if (rng == 0)
     {
       y+=10;
     }
     else if (rng == 1)
     {
       y-=10;
     }
     else if (rng == 2)
     {
       x+=10;
     }
     else if (rng == 3)
     {
       x-=10;
     }
   }
   
   void randomWalkBiased()
   {
     int rng = int(random(100));
     
     if (rng <= 20)
     {
       y+=10;
     }
     else if (rng <= 40)
     {
       y-=10;
     }
     else if (rng <= 60)
     {
       x+=10;
     }
     else if (rng > 60)
     {
       x-=10;
     }
   }
}
