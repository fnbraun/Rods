
class NematicSimulation {
  
float del=0.01;  
float temp;
ArrayList system;


  NematicSimulation(ArrayList system,float temperature){
  this.system=system;
  this.temp=temperature;
  }
  
  
  void step(){
        
    float[] df_dtheta  = new float[system.size()];

    for (int i = system.size()-1; i >= 0; i--) { 
    
      Rod particle=(Rod) system.get(i);
            
       df_dtheta[i]= (interactionEnergy(del,i)-interactionEnergy(0,i))/del;
    }
       
        
  }
  
  float interactionEnergy(float dtheta,int j){
     
     float interaction_fe=0;
    
     Rod particle0=(Rod) system.get(j);
      
     float theta0=particle0.theta+dtheta;
     PVector r0=particle0.midpoint;
     
    for (int i = system.size()-1; i >= 0; i--) { 
      
     if (i!=j){ 
      
     Rod surrounding_particle=(Rod) system.get(i);
     
     //interaction_fe+= 
            }
     }
     return 0;
  
      }

}
