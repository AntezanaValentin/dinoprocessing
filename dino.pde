//pj
int posx = 45;
int posy = 325;
int alt = 50;

//physics
int vely = 10;
int acelery = 1;
int g = 10;
int salto = 10;
int acelo = 10;

//obstacle
int oposx = 800;
int oposy = 310;

//middleObstacle

int moposx = 800;
int moposy = 275;

//flyingObstacle
int foposx = 800;
int foposy = 235;


void setup() {
  size(800, 400);
}

//interacciones

boolean isColliding() {
  boolean result = false;
  if (posx + 25 >= oposx && posy + alt/2 > oposy         && posx - 25 <= oposx +20 && posy + alt/2 > oposy ||
    posx + 25 >= foposx && posy - alt/2 < foposy + 10  && posx - 25 <= foposx + 40 && posy - alt/2 < foposy + 10 ||
    posx + 25 >= moposx && posy + alt/2 > moposy       && posx - 25 <= moposx + 60 && posy - alt/2 < moposy + 40) {
    result = true;
    //posy = 325;
    //oposx = 1200;
    //foposx = 1600;
    //moposx = 2000;
    acelo *= 0;
    salto *= 0;
  }
  return result;
}

void aceleracion() {
  //acelery += g;
  //acelery -= salto;
}

void movimientos() {
  //posy -= vely;
  //vely -= acelery;
  //acelery *= 0;
}

void keyPressed() {
  if (keyCode == UP) {
    while (posy != 245) {
      posy -= salto;
    }
  }
  if (keyCode == DOWN) {
    alt -= 24;
    posy += 12;
  }
}
void keyReleased() {
  if (keyCode == UP) {
    while (posy != 325) {
      posy += salto;
    }
  }
  if (keyCode == DOWN) {
    alt = 50;
    posy = 325;
  }
}


//obstaculos

void middleObstacle () {
  rect(moposx, moposy, 60, 40);
  moposx -= acelo;
  //if (moposx <= -40) moposx = 1600;
}

void flyingObstacle () {
  rect(foposx, foposy, 40, 20);
  foposx -= acelo;
  //if (foposx <= -440) foposx = 1200;
}



void obstacle() {
  rect(oposx, oposy, 20, 40);
  oposx -= acelo;
  //if (oposx <= -840) oposx = 800;
}

//juego

void randObs() {
  for (int i = 0; i < 100; i++) {
    for (int j = 0; j < 10; j++) {
    }
    int r = (int) random(1, 3);
    if (r == 1) {
      obstacle();
    } else if (r == 2) {
      middleObstacle();
    } else {
      flyingObstacle();
    }
  }
}

void ground() {
  line(0, 350, 800, 350);
  stroke(130, 150, 190);
}

void draw() {
  background(0);
  ellipse(posx, posy, 50, alt);
  if (posy <= 245) {
    posy = 245;
  }
  if (alt <= 24) {
    alt = 24;
    posy = 337;
  }
  ground();
  //flyingObstacle();
  //middleObstacle();
  //obstacle();
  randObs();
  isColliding();
  // print("           ", r);
}
