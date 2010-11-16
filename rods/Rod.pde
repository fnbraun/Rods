class Rod {
  PVector midpoint;
  float theta;
  
  Rod(PVector midpoint, float theta) {
    
    this.midpoint=midpoint; 
    this.theta=theta;
 
   }


  void draw() 
  {        
    pushMatrix();
    translate(midpoint.x,midpoint.y);
    rotate(-theta);
    line(rlen/2,0,-rlen/2,0);
    
    popMatrix(); 
     }
     
    
     float distance()  // from mouse to rod
     {
             
        PVector b = new PVector(rlen*cos(theta),-rlen*sin(theta));
        
        float rodend_x=midpoint.x-0.5*b.x;
        float rodend_y=midpoint.y-0.5*b.y;
       
        PVector a = new PVector(mouseX-rodend_x,mouseY-rodend_y);  // mouse-to-rodend vector
       
        
        if (a.dot(b)<0) return a.mag();
        if (a.dot(b)>b.dot(b)) return a.dist(b);
        
        return a.cross(b).mag()/b.mag();
           
               
       
      }
     
}


