/**
 * Rods. 
 */
 
ArrayList nematic_particle_ensemble;
RodCanvas canvas;


void setup(){
  frameRate(30);
  size(200, 200);
  stroke(200);
  noFill();
  
  nematic_particle_ensemble = new ArrayList();  // Create an empty ArrayList

  canvas= new RodCanvas(nematic_particle_ensemble,40);

}

void draw(){
  background(0);
  
  text("Drag to Draw",30,50);
   
 canvas.draw();
 
}

void mousePressed() {
  
 canvas.mousePressed();        
  
 
}

void mouseReleased() {   
  
  canvas.mouseReleased();
     
}


