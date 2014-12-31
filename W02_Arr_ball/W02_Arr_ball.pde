PVector pt;
PVector direct;

PImage img;
PImage ball;
int NUMS = 50;
PVector[] pt_Arr = new PVector[NUMS];
int index = 0;

void setup() {
  size(400, 400);
  pt = new PVector(random(width), random(height));
  direct = new PVector(random(5)-2.5, random(5)-2.5);
  
  for(int i=0; i<NUMS; i++) {
    pt_Arr[i] = new PVector(0,0);
  }
  
  img = loadImage("test.jpg");
  ball = loadImage("ball.png");
}

void draw() {
  background(0);
  image(img, 0,0, width, height);
  //fill(0, 10);
  //rect(0,0, width, height);
  
  float tmp_x = pt.x+direct.x;
  float tmp_y = pt.y+direct.y;
  if(tmp_x>width || tmp_x<0) {
    direct.x = -direct.x;
    
  }
  if(tmp_y>height || tmp_y<0) {
    direct.y = -direct.y;
    
  }
  pt.set(tmp_x, tmp_y);
  pt_Arr[index].set(tmp_x, tmp_y);
  index = (index+1)% NUMS;
  
  for(int i=0; i<NUMS; i++) {
    noFill(); 
    stroke(255, 255-i*0.5);
    //ellipse(pt_Arr[i].x, pt_Arr[i].y, 50-i*0.01, 50-i*0.01);
    image(ball, pt_Arr[i].x-ball.width, pt_Arr[i].y-ball.height, 10, 10);
  }
}
