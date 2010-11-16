/**
 * Rods. 
 */
 
int rlen = 40;  //rod length 
float x1,y1,x2,y2; 
float angle=0;

ArrayList rods;



void setup(){
  frameRate(30);
size(200, 200);
  stroke(200);
   rods = new ArrayList();  // Create an empty ArrayList

  

}

void draw(){
  background(0);
  text(angle,30,30);
  
  text("Drag to Draw",30,50);
  
  float min_distance=1e3;
  int nearest_i=-1;
  for (int i = rods.size()-1; i >= 0; i--) { 
    Rod rod = (Rod) rods.get(i);
    rod.draw();
  }
    
   /* 
    float distance=rod.distance();
    if (distance< min_distance) {min_distance=distance; nearest_i=i;}
     }

    if (nearest_i>-1&&min_distance<5){
    stroke(100);
    Rod rod = (Rod) rods.get(nearest_i);
    rod.draw();
    stroke(200);}
   */
  
}


void mousePressed() {
  
  x1=mouseX;y1=mouseY;
}

void mouseReleased() {
 x2=mouseX;y2=mouseY;
  angle=atan((y1-y2)/(x2-x1));
 // if (x2-x1<1) angle+=PI;
 // if (angle<0) angle+=360;
  
  PVector midpoint=new PVector(0.5*(x1+x2),0.5*(y1+y2));
  
  rods.add(new Rod(midpoint,angle));
  
   
}


