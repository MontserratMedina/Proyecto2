

class flujoPantallas{
  int estado;

  flujoPantallas(){
    this.estado = 0;
  }

  void display(){
    switch(this.estado){
    case 0:
   
      background(255);
    break;
    case 1:
      background(25);
    break;
    case 2:
     background(random(0,255),0,random(0,255)*cos (10*radians(millis()/100.0)));
  
     break;
  }
  }

  void cambioPantalla(){
    estado++;
  if(estado>3){
    estado = 0;
  }
  }
}
