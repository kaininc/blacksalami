class Blob {
  float x, y;
  PVector pos, vel; 
  float r; 
  boolean isPlayer;
  int id_num;
  Blob(float _x, float _y, float _r,int _id_num , boolean player) { // if player, id num == 2018
    pos = new PVector(_x, _y); 
    vel = new PVector(0, 0); 
    r = _r;
    isPlayer = player;
    id_num =_id_num;
  } 
  void update() { 
    //if (pos.x < MIN_gamefield_x || pos.x < MAX_gamefield_x || pos.y > MIN_gamefield_y || pos.y < MIN_gamefield_y) {
    // vel = new PVector(0, 0);
    // } else {
    PVector newvel = new PVector(mouseX-width/2, mouseY-height/2); 
    newvel.setMag(3); 
    vel.lerp(newvel, 0.2); 
    pos.add(vel);
    //  }
  } 
  boolean eats(Blob other) { 
    float d = PVector.dist(pos, other.pos); 
    if (d < r + other.r) { 
      float sum = PI * r * r + PI * other.r * other.r; 
      r = sqrt(sum / PI); //r += other.r; return true; } else { return false; } } void show() { fill(255); ellipse(pos.x, pos.y, r*2, r*2); }}
      return true;
    } else {
      return false;
    }
  }

  void respawnBits() {
    blobs.remove(id_num);
    pos.x = random(-width, width); 
    pos.y = random(-height, height);
    //blobs.add(new Blob(pos.x, pos.y, 16,id_num ,false));
    //pos.x = 500;
    //pos.y = 500;
  }

  void show() {
    if (!isPlayer) {
      fill(255);
      ellipse(pos.x, pos.y, r * 2, r * 2);
    } else {
      fill(255);
      ellipse(pos.x, pos.y, r * 2, r * 2);
      image(mateo, pos.x, pos.y, r*2 - (r / 2), r* 2 - (r / 2));
    }
  }
}