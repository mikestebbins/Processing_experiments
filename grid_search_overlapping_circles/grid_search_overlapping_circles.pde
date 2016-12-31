int width_x = 1000;
int height_y = 600;
int gridSize = 0;
int minGridSize = 20;
int maxGridSize = 200;
int delta = 20;
int minDelta = 10;
int maxDelta = 10;
boolean growing = true;
float stepSize = 0.02;
float step = 0.0;

//int groupA_columns = 0;
//int groupA_rows = 0;
//int groupB_columns = 0;
//int groupB_rows = 0;
//int iterations = 0;

void setup() {
  size(1000, 600); 
  background(255);
  //fill(50,50,50);
  //stroke(0);
  noFill();
  frameRate(100);
}

void draw()   {
  
  float value = cos(step) + 1;
  gridSize = (int) map(value, 0.0, 2.0, (float) minGridSize, (float) maxGridSize);
  
  //float adjustedSize = map(gridSize, minGridSize, maxGridSize, -PI/2, PI/2);
  //delta = (int) ((float) delta * adjustedSize);
  
  //if (growing == true)  {  
  //  if (gridSize <= maxGridSize)  {
  //    gridSize = gridSize + delta;
  //  } 
  //  else {
  //    growing = false; 
  //  } 
  //}
    
  //else {  // growing == false, means they are shrinking
  //  if (gridSize > delta)  {
  //    gridSize = gridSize - delta;
  //  } 
  //  else {
  //    growing = true;
  //  }
  //}
  
  makeCircles(gridSize);
  step = step + stepSize;
}

void makeCircles(int gridSize)  {
  background(255);
  
  int groupA_columns = (width_x / gridSize) + 1;
  int groupA_rows = (height_y / gridSize) + 1;
  int groupB_columns = (width_x / gridSize);
  int groupB_rows = (height_y / gridSize);
  int iterations = (groupA_columns * groupA_rows) + (groupB_columns * groupB_rows);
  
  println(groupA_columns);
  println(groupA_rows);
  println(groupB_columns);
  println(groupB_rows);
  println(iterations);
  
  stroke(0);  
  strokeWeight(2);
  for (int i = 0; i < groupA_rows; i++)  {
    for (int j = 0; j < groupA_columns; j++)  {
      int center_x = j*gridSize;
      int center_y = i*gridSize;
      ellipse(center_x,center_y,gridSize,gridSize);
    }
  }  
  
  stroke(255,0,150);
  for (int i = 0; i < groupB_rows; i++)  {
   for (int j = 0; j < groupB_columns; j++)  {
     int center_x = (j*gridSize) + gridSize/2;
     int center_y = (i*gridSize) + gridSize/2;
     ellipse(center_x,center_y,gridSize,gridSize);
   }
 }
}

void keyPressed() {
  noLoop();
}

void keyReleased() {
  loop();
}