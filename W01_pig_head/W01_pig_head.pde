void setup () {
  size(400, 400);
  
}


void draw() {
  background(125,50,80);
  fill(245, 169, 111);
  noStroke();
  //ellipse(200, 200, 300, 300);
  rect(50, 50, 300, 300);
  stroke(255,0,0);
  ellipse(200, 200, 200, 100);
  fill(0);
  ellipse(160, 200, 20, 50);
  ellipse(240, 200, 20, 50);
  
  //eye
  int tmp_move = constrain(mouseX, 130, 270);
  ellipse(tmp_move-40, 140, 10, 10);
  ellipse(tmp_move+40, 140, 10, 10);
  
}
