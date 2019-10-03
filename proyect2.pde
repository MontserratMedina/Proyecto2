import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import ddf.minim.*;
Minim reproductor1;
AudioSample s1,s2,s3;

Box2DProcessing box2d;

ArrayList<Cuadro> cuadros;
ArrayList<Limite> limites;
flujoPantallas uno;

void setup() {
  uno = new flujoPantallas();
  reproductor1= new Minim(this);
  s1=reproductor1.loadSample("s1.mp3",512);
  s2=reproductor1.loadSample("s2.mp3",512);
  s3=reproductor1.loadSample("s3.mp3",512);
  size(1020,650);
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0, -10);
  cuadros= new ArrayList<Cuadro>();
  limites= new ArrayList<Limite>();

  limites.add(new Limite(390,100,50,50));
  limites.add(new Limite(590,130,50,50));
  limites.add(new Limite(485,259,50,50));
  limites.add(new Limite(536,259,50,50));
  limites.add(new Limite(697,319,50,50));
  limites.add(new Limite(227,259,50,50));
  limites.add(new Limite(257,309,50,50));
  limites.add(new Limite(500,409,50,50));
  limites.add(new Limite(500,600,500,10));
  
  }


void draw() {
  background(255);
  uno.display();
  box2d.step();
textSize(15);
text("A brief inquiry into online relationships", 10, 40); 

textSize(30);
text("HOW ", 355, 150); 
text("TO", 570, 180);
text("DRAW", 470, 310);
text("P", 182, 270);
text("E", 207, 320);
text("TRI", 475, 459);
text("CHOR", 655, 370);
textSize(15);
text("Instrucciones", 770, 400); 
text("1.-Presione la tecla 1", 770, 420); 
text("Puede dejar el click presionado", 770, 438); 
text("generando punto de atracción", 770, 456); 
text("2.-Presione la tecla 2", 770, 474); 
text("(Con click presionado guie ", 770, 492); 
text("las particulas para que la pantalla", 770, 510); 
text("quede limpia)", 770, 528); 
text("3.-Presione la tecla 3", 770, 546); 
text("4.-Presione esc para salir", 770, 564); 
text("(Si no ejecuta correctamente", 770, 582); 
text("vuelva a intentar)", 770,600);

     if (random(1) < 0.2) {
    Cuadro p = new Cuadro(width/2,30);
    cuadros.add(p);
     }
  
  if (mousePressed) {
    for (Cuadro b: cuadros) {
     b.attract(mouseX,mouseY);
    }
  }
  for (Limite wall: limites) {
    wall.display();
  }
for (Cuadro b: cuadros) {
    b.display();
  }
   for (int i = cuadros.size()-1; i >= 0; i--) {
    Cuadro b = cuadros.get(i);
    if (b.done()) {
      cuadros.remove(i);
    }
  }

 

}
 void keyPressed(){
  if(key=='1'||key=='1'){
     s1.trigger();
    
   }
    if(key=='2'||key=='2'){
     s2.trigger();
     uno.cambioPantalla();
   }
    if(key=='3'||key=='3'){
     s3.trigger();
     uno.cambioPantalla();
   }

 
  
}
 
