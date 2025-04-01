class Walker
{
   public PVector position = new PVector();
   public PVector velocity = new PVector();
   public PVector acceleration = new PVector();
   
   public float maxVelocity = 10;
   public float scale = 15;
   public float mass = 1;
   
   public float r = 255, g = 255, b = 255;
   
   public void applyForce(PVector force)
   {
     PVector f = PVector.div(force, mass);
     this.acceleration.add(f);
   }
   
   public void update()
   {
     this.velocity.add(this.acceleration);
     this.velocity.limit(maxVelocity);
     this.position.add(this.velocity);
     
     this.acceleration.mult(0);
   }
   
   void render()
   {
     fill(r, g, b);
     circle(position.x, position.y, scale);
   }
   
   public void checkPosition()
   {
     if (this.position.x >= Window.right)
     {
       this.velocity.x *= -1;
       this.position.x = Window.right;
     }
     else if (this.position.x <= Window.left)
     {
       this.velocity.x *= 1;
       this.position.x = Window.left;
     }
     
     if (this.position.y >= Window.top)
     {
       this.velocity.y *= 1;
       this.position.y = Window.top;
     }
     else if (this.position.y <= Window.bottom)
     {
       this.velocity.y *= -1;
       this.position.y = Window.bottom;
     }
   }
}
