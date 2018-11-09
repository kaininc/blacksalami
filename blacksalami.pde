PImage mateo, blackSalami, startscreen01, error_custom_in_beta2, wait;
String area = "start";
SearchMouse mouse = new SearchMouse();
int MIN_gamefield_x = -600, MIN_gamefield_y = -500, MAX_gamefield_x = 600, MAX_gamefield_y = 500; 
boolean config = true;


Blob blob; 
ArrayList<Blob> blobs;
float zoom = 1; 
//Array Blobs

void setup() { 
  size(600, 500); 
  wait = loadImage("imgs/errors/wait.PNG");
  background(wait);
  config();


  startscreen01 = loadImage("imgs/start_screen01.PNG");
  mateo = loadImage("imgs/avatars/mateo.png");
  blackSalami = loadImage("imgs/avatars/blackSalami.png");
  error_custom_in_beta2 = loadImage("imgs/errors/custom_in_beta2.PNG");
} 
void draw() { 
  if (area == "start") {
    background(startscreen01);
    if (mousePressed) {
      mouse.checkClick(181, 289, 257, 52 ); // main menu start
      if (mouse.clicked == 1) {
        area = "gamescreen";
        mouse.clicked = 0;
      }
      mouse.checkClick(180, 350, 257, 50); //main menu customize 
      if (mouse.clicked == 1) {
        area = "customize";
        mouse.clicked = 0;
      }
    }
  }



  if (area == "gamescreen") {
    background(0); 
    translate(width/2, height/2); 
    float newzoom = 64 / blob.r; 
    zoom = lerp(zoom, newzoom, 0.1); 
    scale(zoom); 
    translate(-blob.pos.x, -blob.pos.y); 
    for (int i = blobs.size()-1; i >=0; i--) { 
      blobs.get(i).show(); 
      if (blob.eats(blobs.get(i))) { 
        blobs.remove(i);
        blobs.get(i).respawnBits();
      }
    } 
    blob.show(); 
    blob.update();
  }
  //end of gamescreen

  if (area == "customize") {
    background(error_custom_in_beta2);
    if (mousePressed) {
    }
  }
}



void config() {
  blob = new Blob(0, 0, 64, 2018, true); 
  blobs = new ArrayList<Blob>(); 
  for (int i = 0; i < 9000; i++) { 
    float x = random(-width, width); 
    float y = random(-height, height); 
    blobs.add(new Blob(x, y, 16, i, false));
  }
  config = false;
}