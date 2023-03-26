//pj
int posx = 45;
int posy = 325;
int alt = 50;
int anc = 50;


//mov
boolean up = false;
boolean left = false;
boolean right = false;
boolean down = false;
int movx = 5;
int movy = 15;
int agac = 24;

//physics
int g = 5;
int acelfo = (int) random(5, 10);
int acelmo = (int) random(5, 15);
int acelo = (int) random (5, 12);

//obstacle
int oposx = 1600;
int oposy = 310;

//middleObstacle

int moposx = 1200;
int moposy = 275;

//flyingObstacle
int foposx = 800;
int foposy = 235;

//back

int windy = (int) random(50, 80);
int windy1 = (int) random(80, 110);
int windy2 = (int) random(110, 140);
int windy3 = (int) random(140, 170);
int windy4 = (int) random(170, 200);
int windy5 = (int) random(200, 230);
int windx = (int) random(800, 900);
int windx1 = (int) random(850, 950);
int windx2 = (int) random(900, 1000);
int windx3 = (int) random(950, 1050);
int windx4 = (int) random(1000, 1100);
int windx5 = (int) random(1050, 1150);

void setup() {
  size(800, 400);
}

//interacciones

boolean isColliding() {
  boolean result = false;
  if (posx + anc/2 >= oposx && posy + alt/2 > oposy         && posx - anc/2 <= oposx +20 && posy + alt/2 > oposy ||
    posx + anc/2 >= foposx && posy - alt/2 < foposy + 10    && posx - anc/2 <= foposx + 40 && posy - alt/2 < foposy + 10 ||
    posx + anc/2 >= moposx && posy + alt/2 > moposy         && posx - anc/2 <= moposx + 60 && posy - alt/2 < moposy + 40) {
    result = true;
    acelfo *= 0;
    acelmo *= 0;
    acelo *= 0;
    movx *= 0;
    movy *= 0;
    g *= 0;
    agac *= 0;
  }
  return result;
}


boolean gravedad() {
  boolean gravity = false;
  if (posy + alt/2 != 350) {
    posy += g;
    gravity = true;
  } else {
    g += 0;
  }
  return gravity;
}

void movimientos() {
  if (posx <= anc/2) {
    posx += movx;
  }
  if (posx >= 800 - anc/2) {
    posx -= movx;
  }
  if (up && !left && !right) {
    posy -= movy;
  }
  if (up && left && !right) {
    posy -= movy;
    posx -= movx;
  }
  if (up && right && !left) {
    posy -= movy;
    posx += movx;
  }
  if (left && !right && !up) {
    posx -= movx;
  }
  if (right && !left && !up) {
    posx += movx;
  }
}


void keyPressed() {
  if (keyCode == UP || keyCode == 'w' || keyCode == 'W') {
    up = true;
  }
  if (keyCode == DOWN || keyCode == 's' || keyCode == 'S') {
    if (posy <= 325) {
      g += 5 ;
      alt -= agac;
      posy += agac/2;
    }
  }
  if (keyCode == RIGHT || keyCode == 'd' || keyCode == 'D') {
    right = true;
  }
  if (keyCode == LEFT || keyCode == 'a' || keyCode == 'A') {
    left = true;
  }
  if (keyCode == 'r' || keyCode == 'R') {
    posx = 50;
    posy = 325;
    alt = 50;
    movx = 5;
    movy = 15;
    g = 5;
    oposx = 1600;
    foposx = 800;
    moposx = 1200;
    acelmo = (int) random(5, 10);
    acelfo = (int) random(5, 12);
    acelo = (int) random(5, 15);
    agac = 24;
  }
}

void keyReleased() {
  if (keyCode == UP || keyCode == 'w' || keyCode == 'W') {
    up = false;
  }
  if (keyCode == DOWN || keyCode == 's' || keyCode == 'S') {
    g = 5;
    alt = 50;
  }
  if (keyCode == RIGHT || keyCode == 'd' || keyCode == 'D') {
    right = false;
  }
  if (keyCode == LEFT || keyCode == 'a' || keyCode == 'A') {
    left = false;
  }
}


//obstaculos

void middleObstacle () {
  rect(moposx, moposy, 60, 40);
  moposx -= acelmo;
  if (moposx <= -40) {
    moposx = (int) random(800, 870);
    acelmo = (int) random(5, 15);
  }
}

void flyingObstacle () {
  rect(foposx, foposy, 40, 20);
  foposx -= acelfo;
  if (foposx <= -440) {
    foposx = (int) random(900, 940);
    acelfo = (int) random(5, 10);
  }
}

void obstacle() {
  rect(oposx, oposy, 20, 40);
  oposx -= acelo;
  if (oposx <= -840) {
    oposx = (int) random(970, 1040);
    acelo = (int) random(5, 15);
  }
}

//juego

void randObs() {
  int s = second();
  if (s % 10 == 0) {
    int r = (int) random(1, 6);
    if      (r == 1 || r == 4) obstacle();
    else if (r == 2 || r == 5) middleObstacle();
    else if (r == 3 || r == 6) flyingObstacle();
  }
}

void ground() {
  rect(0, 350, 800, 400);
  if (posy + alt/2 >= 350) {
    posy = 350 - alt/2;
  }
}

void back() {
  fill(0, 0, 30);
  rect(0, 0, 800, 350);
  line(windx, windy, windx - 10, windy);
  windx -= 5;
  line(windx1, windy1, windx1 - 10, windy1);
  windx1 -= 5;
  line(windx2, windy2, windx2 - 10, windy2);
  windx2 -= 5;
  line(windx3, windy3, windx3 - 10, windy3);
  windx3 -= 5;
  line(windx4, windy4, windx4 - 10, windy4);
  windx4 -= 5;
  line(windx5, windy5, windx5 - 10, windy5);
  windx5 -= 5;
  if (windx  <= random(0, -50))   windx  = 800;
  if (windx1 <= random(-10, -70))  windx1 = 850;
  if (windx2 <= random(-40, -110)) windx2 = 820;
  if (windx3 <= random(-70, -90))  windx3 = 860;
  if (windx4 <= random(-20, -100)) windx4 = 910;
  if (windx5 <= random(-60, -130)) windx5 = 890;
}

void draw() {
  stroke(255, 40);
  back();
  stroke(0);
  fill(0, 0, 250);
  ellipse(posx, posy, 50, alt);
  //tope de salto
  if (posy <= 220) {
    posy = 220;
    up = false;
  }
  //Mantener agachado
  if (alt <= 24) {
    alt = 24;
    posy = 337;
  }
  //cancelación de salto
  if (up == false && posy != 325) {
    movy *= 0;
  } else if (posy == 325) {
    movy = 15;
  }
  movimientos();
  gravedad();
  fill(65, 0, 0);
  ground();
  fill(255, 0, 0);
  flyingObstacle();
  fill(255, 255, 0);
  middleObstacle();
  fill(255, 0, 255);
  obstacle();
  //randObs();
  isColliding();
}
