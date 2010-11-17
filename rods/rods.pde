/**
 * Rods. 
 */
 
int rlen = 40;  //rod length 
float x1,y1,x2,y2; 

PVector mouse_ref;
boolean mouseover=false;
boolean grip=false;
String gripmode;
int selected_i;

Rod selected_rod;

ArrayList rods;



void setup(){
  frameRate(30);
size(200, 200);
  stroke(200);
   rods = new ArrayList();  // Create an empty ArrayList

  

}

void draw(){
  background(0);
  
  text("Drag to Draw",30,50);
  

  for (int i = rods.size()-1; i >= 0; i--) { 
    Rod rod = (Rod) rods.get(i);
    rod.draw();
             
 }

     if (grip) updateGrip();
     else mouseover=checkForMouseover();
     
       
}


void updateGrip(){
  
   selected_rod.highlight();
   if (gripmode=="orient") selected_rod.orient(); else  selected_rod.move();
   
  
  
}

boolean checkForMouseover(){
    float min_distance=1e3;
    int nearest_i=-1;
      
    for (int i = rods.size()-1; i >= 0; i--) { 
                           Rod rod = (Rod) rods.get(i);
                           float distance=rod.distance();
                      if (distance< min_distance) {min_distance=distance; nearest_i=i;}
                                 }
 
    if (min_distance<2){                         
                          selected_rod = (Rod) rods.get(nearest_i);
                          selected_rod.highlight();
                          return true;
                        }
       return false;
                 
  }

void mousePressed() {
  
  mouse_ref=new PVector(mouseX,mouseY);
 
  if (!mouseover) return;
  
  grip=true; 
  
  if (PVector.dist(selected_rod.midpoint,mouse_ref)<10) gripmode="translate"; else gripmode="orient";
        
  
 
}

void mouseReleased() {
    
  
  if (!grip){  
  
     PVector mouse_now=new PVector(mouseX, mouseY);
     PVector mouse_swipe=PVector.sub(mouse_now,mouse_ref);
     PVector midpoint=PVector.mult(PVector.add(mouse_now,mouse_ref),0.5);
   
   rods.add(new Rod(midpoint,atan(-mouse_swipe.y/mouse_swipe.x)));
  }
  
  grip=false;
  
   
}


