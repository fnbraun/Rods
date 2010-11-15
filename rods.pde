/**
 * Rods. 
 */
 
int rlen = 40;  //rod length 
float x1,y1,x2,y2; 
float angle=0;
//int rods_drawn=0;
//int MAX=10;

//Rod[] rods = new Rod[MAX]; 
ArrayList rods;



void setup(){
  frameRate(30);
size(200, 200);
  stroke(200);
   rods = new ArrayList();  // Create an empty ArrayList

  

}

void draw(){
  background(0);
  text("experimental branch",30,50);
  text(angle,30,30);
  
  float min_distance=1e3;
  int nearest_i=-1;
  for (int i = rods.size()-1; i >= 0; i--) { 
    Rod rod = (Rod) rods.get(i);
    rod.draw();
    float distance=rod.distance();
    if (distance< min_distance) {min_distance=distance; nearest_i=i;}
     }

   //text(nearest_i,100,100);
    if (nearest_i>-1&&min_distance<5){
    stroke(100);
    Rod rod = (Rod) rods.get(nearest_i);
    rod.draw();
    stroke(200);}
   
  /*
  for (int i = 0; i < rods_drawn; i++) { 
  text(i+": "+rods[i].distance(),100,100+i*10);
  rods[i].draw();}
 */ 
}


void mousePressed() {
  
  x1=mouseX;y1=mouseY;
}

void mouseReleased() {
 x2=mouseX;y2=mouseY;
  angle=degrees(atan((y1-y2)/(x2-x1)));
  if (x2-x1<1) angle+=180;
  if (angle<0) angle+=360;
  
  rods.add(new Rod(0.5*(x1+x2),0.5*(y1+y2),angle));
  
   /* if (rods_drawn<MAX) {
    rods[rods_drawn]= new Rod(0.5*(x1+x2),0.5*(y1+y2),angle);
    rods_drawn++; 
  } */
}

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


