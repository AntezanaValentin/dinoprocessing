int posx = 50;
int posy = 325;
int vely = 10;
int acelery = 1;
int g = 10;
int salto = 20;
int oposx = 740;
int oposy = 310;

void setup() {
  size(800, 400);
}

void isColliding(){
  if(posx + 25 == oposx || posy == oposy) {
    posy = 325;
    oposx = 800;
  }
}

void aceleracion() {
  posy += 80;
  //acelery += g;
  //acelery -= salto;
}

void movimientos() {
  posy -= 80;
  //posy -= vely;
  //vely -= acelery;
  //acelery *= 0;
}

void keyPressed() {
  if (keyCode == UP) {
    movimientos();
  }
}
void keyReleased() {
  if (keyCode == UP) {
    aceleracion();
  }
}
void grade() {
  line(0, 350, 800, 350);
  stroke(60);
}

void obstacle() {
  rect(oposx, oposy, 20, 40);
  oposx -= 10;
  if(oposx < 0) {
    oposx = 800;
  }
}

void draw() {
  background(0);
  ellipse(posx, posy, 50, 50);
  if(posy <= 245) {
    posy = 245;
  }
  grade();
  obstacle();
  isColliding();
}
