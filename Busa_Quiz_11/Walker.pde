class Walker
{
   public PVector position = new PVector();
   public PVector velocity = new PVector();
   public PVector acceleration = new PVector();
   
   public float maxVelocity = 10;
   public float scale = 15;
   public float mass = 1;
   
   public float gravConst = 1;
   
   public float r = 255, g = 255, b = 255, a = 255;
   
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
     fill(r, g, b, a);
     noStroke();
     circle(position.x, position.y, scale);
   }
   
   public PVector calculateAttraction(Walker walker)
   {
     PVector force = PVector.sub(this.position, walker.position);
     float distance = force.mag();
     force.normalize();
     
     distance = constrain(distance, 5, 20);
     
     float strength = (this.gravConst * this.mass * walker.mass) / (distance * distance);
     force.mult(strength);
     
     return force;
   }
}
