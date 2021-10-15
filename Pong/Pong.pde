float x;
float y;
float a;
float z;
float c, d;
float moveC;
float moveD;
int point1 = 0;
int point2 = 0;

void setup()
{
  size(600, 600);
  rectMode(CENTER);
  textSize(50);

  x = 20;
  y = 60;
  a = 580;
  z = 60;
  c = width/2;
  d = height/2;
  moveC = -4;
  moveD = -4;
}

void draw()
{
  background(0);
  fill(229,250,8);
  rect(x, y, 20, 60);
  fill(229,250,8);
  rect(a, z, 20, 60);
  fill(255);
  rect(width/2, height/2, 10, 600);
  fill(229,250,8);
  rect(width/2,height/2,10,300);
  fill(255);
  ellipse(c, d, 15, 15);
  points();

  c = c + moveC;
  d = d + moveD;

  //making it bounce off the top and bottom
  if (d > height) {
    moveD = -moveD;
  } else if ( d < 0) {
    moveD = -moveD;
  }
  
  //making it repeat 
  if ( c > width){
    setup();
    point1 = point1 + 1;
    moveC = -moveC;
  }else if ( c < 0){
    setup();
    point2 = point2 + 1;
  }

  // making it bounce off the rect
  if (c-7.5 < x+10 && d-7.5 < y+30 && d+7.5 > y-30 ) {
    if (moveC < 0) {
      moveC = -moveC;
    }
  }
  if (c+7.5 > a-10 && d+7.5 > z-30 && d-7.5 < z+30 ) {
    if (moveC > 0) {
      moveC = -moveC;
    }
  }
//Announcing winner  
  if (point1 == 3){
    moveC = 0;
    moveD = 0;
    text("WIN",100,450);
  }
  
  if (point2 == 3){
    moveC = 0;
    moveD = 0;
    text("WIN",400,450);
  }

}

void points(){
  fill(255);
  text(point1,150,60);
  text(point2,450,60);
}

void keyPressed()
{
  if (key == 'a') {
    y = y - 10;
  } else if (key == 'd') {
    y = y + 10;
  }


  if (key == 'j') {
    z = z - 10;
  } else if (key == 'l') {
    z = z + 10;
  }
}
