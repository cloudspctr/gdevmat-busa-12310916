public class Walker
{
   public float x;
   public float y;
   public float r, g, b;
   public float tx = 0, ty = 10000;
   public float tr = 255, tg = 255, tb = 255;
   public float perlinScale = 0;
   public float tscale = 0;
   
   void render()
   {
     perlinScale = map(noise(tscale), 0, 1, 5, 150);
     circle(x, y, perlinScale);
     tscale += 0.01;
   }
   
   void perlinWalk()
   {
     x = map(noise(tx), 0, 1, -(width/2.0), (width/2.0));
     y = map(noise(ty), 0, 1, -(height/2.0), (height/2.0));
     
     tx += 0.01f;
     ty += 0.01f;
   }
   
   void design()
   {
     r = map(noise(tr), 0, 1, 0, 255);
     g = map(noise(tg), 0, 1, 0, 255);
     b = map(noise(tb), 0, 1, 0, 255);
     
     fill(r,g,b);
     noStroke();
     
     tr += 0.04;
     tg += 0.15;
     tb += 0.09;
     
     /*
     if (tr < 0)
     {
       tr = 255;
     }
     if (tg < 0)
     {
       tg = 255;
     }
     if (tb < 255)
     {
       tb = 255;
     }
     */
   }
}
