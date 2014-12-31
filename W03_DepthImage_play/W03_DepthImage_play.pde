import SimpleOpenNI.*;

SimpleOpenNI  context;

int ClosestValue;

PVector ClosestPT;

void setup()
{
  size(640, 480);
  context = new SimpleOpenNI(this);
  if (context.isInit() == false)
  {
    println("Can't init SimpleOpenNI, maybe the camera is not connected!"); 
    exit();
    return;
  }

  // mirror is by default enabled
  context.setMirror(true);

  // enable depthMap generation 
  context.enableDepth();
  
  ClosestPT = new PVector(0,0);
  background(0);
}

void draw()
{
  ClosestValue = 8000;
  // update the cam
  context.update();
  
  int[] depthValues = context.depthMap();
  
  for(int y=0; y<480; y++) { 
    for(int x=0; x<640; x++) {
      int index = x + y*640;
      int currentDepthValue = depthValues[index];
      
      if(currentDepthValue > 0 && currentDepthValue < ClosestValue) {
        ClosestValue = currentDepthValue;
        ClosestPT.set(x,y);
      }
    }
  }
    
    

  // draw depthImageMap
  //image(context.depthImage(), 0, 0);
  fill(0, 10);
  rect(0, 0, width, height);
  fill(255,0,0);
  ellipse(ClosestPT.x, ClosestPT.y, ClosestValue/20, ClosestValue/20);
  println(ClosestValue);
}

