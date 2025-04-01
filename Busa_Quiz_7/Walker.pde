class Walker
{
   public PVector position = new PVector();
   public PVector velocity = new PVector();
   public PVector acceleration = new PVector();
   
   public float maxVelocity = 10;
   public float scale = 50;
   
   public Walker()
   {
     fill(155);
     circle(position.x, position.y, scale);
   }
   
   public void update(PVector direction)
   {
     this.velocity.add(direction);
     
     this.velocity.limit(maxVelocity);
     this.position.add(this.velocity);
   }
   
   void render()
   {
     //fill(r, g, b);
     //noStroke();
     circle(position.x, position.y, scale);
   }
   
   public void checkEdges() //why?
   {
     if (this.position.x > Window.right)
     {
       this.position.x = Window.left;
     }
     else if (this.position.x < Window.left)
     {
       this.position.x = Window.right;
     }
     
     if (this.position.y > Window.top)
     {
       this.position.y = Window.bottom;
     }
     else if (this.position.y < Window.bottom)
     {
       this.position.y = Window.top;
     }
   }
}
