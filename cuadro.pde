class Cuadro {
Body body;
  float w;
  float h;

Cuadro(float x, float y) {
    w = random(5, 15);
    h = random(5, 15);
    makeBody(new Vec2(x, y), w, h);
  }
  void killBody() {
    box2d.destroyBody(body);
  }
   boolean done() {
     Vec2 pos = box2d.getBodyPixelCoord(body);
      if (pos.y > height+w*h) {
      killBody();
      return true;
    }
    return false;
     }
    void attract(float x,float y) {
    Vec2 worldTarget = box2d.coordPixelsToWorld(x,y);   
    Vec2 bodyVec = body.getWorldCenter();
    worldTarget.subLocal(bodyVec);
    worldTarget.normalize();
    worldTarget.mulLocal((float) 50);
    body.applyForce(worldTarget, bodyVec);
  }
  void display() {
    Vec2 pos = box2d.getBodyPixelCoord(body);
     float a = body.getAngle();
    
   rectMode(CENTER);
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(-a);
    fill(random(0,255),random(0,255), random(0,255));
    rect(0, 0, w, h);
    popMatrix();
  }
  void makeBody(Vec2 center, float w_, float h_) {
    PolygonShape sd = new PolygonShape();
    float box2dW = box2d.scalarPixelsToWorld(w_/2);
    float box2dH = box2d.scalarPixelsToWorld(h_/2);
    sd.setAsBox(box2dW, box2dH);
    
    FixtureDef fd = new FixtureDef();
    fd.shape = sd;
    
    /*fd.density = 1;
    fd.friction = 0.5;
    fd.restitution = 0.8;*/
    
  if(key=='1'||key=='1'){
     box2d.setGravity(0, -0.5);
     fd.density = 10;

    }
     if(key=='2'||key=='2'){
     box2d.setGravity(0, 5);
     fd.density = 20;
     
    }
     if(key=='3'||key=='3'){
     box2d.setGravity(0, -50);
     fd.density = 15;
     
    }
  
    
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(center));
    
    body = box2d.createBody(bd);
    body.createFixture(fd);
    
    body.setLinearVelocity(new Vec2(random(-5, 5), random(2, 5)));
    body.setAngularVelocity(random(-5, 5));
    
   
  
  }
}
    
    
