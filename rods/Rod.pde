class Rod {
  PVector midpoint;
  float theta;
//  xl,yl,xh,yh; 
  
  // Constructor
  Rod(PVector midpoint, float theta) {
    
    this.midpoint=midpoint; 
    this.theta=theta;
 
 
 /*   float dx=0.5*rlen*cos(theta);
   float dy=0.5*rlen*sin(theta);
   xl=xmid-dx;yl=ymid+dy;
   xh=xmid+dx;yh=ymid-dy;*/
  }


  void draw() 
  {        
    pushMatrix();
    translate(midpoint.x,midpoint.y);
    rotate(-theta);
    line(rlen/2,0,-rlen/2,0);
    
    popMatrix(); 
     }
     
    
    /* float distance()  // calculate the distance from mouse to rod
     {
              
       
        PVector a = new PVector(mouseX-xl,mouseY-yl);
        PVector b = new PVector(xh-xl,yh-yl);
        
        if (a.dot(b)<0) return a.mag();
        if (a.dot(b)>b.dot(b)) return a.dist(b);
        
        return a.cross(b).mag()/b.mag();
           
               
       
      }*/
     
}


