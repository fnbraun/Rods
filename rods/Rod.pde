class Rod {
  float xmid,ymid,xl,yl,xh,yh,theta; 
  
  // Constructor
  Rod(float x_set, float y_set, float theta_set) {
    xmid = x_set; ymid=y_set; 
    theta=radians(theta_set);
    float dx=0.5*rlen*cos(theta);
   float dy=0.5*rlen*sin(theta);
   xl=xmid-dx;yl=ymid+dy;
   xh=xmid+dx;yh=ymid-dy;
  }


  void draw() 
  {        
 //  line(x-dx,y+dy,x+dx,y-dy);
   line(xl,yl,xh,yh); 
     }
     
     float distance()
     {
        float ax=mouseX-xl;
        float ay=mouseY-yl;
        
        float bx=xh-xl;
        float by=yh-yl;
        
        if (ax*bx+ay*by<0) return mag(ax,ay);
        if (ax*bx+ay*by>bx*bx+by*by) return dist(ax,ay,bx,by);    
        return abs(ax*by-ay*bx)/mag(bx,by);
            }
     
}


