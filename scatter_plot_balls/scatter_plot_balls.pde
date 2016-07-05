/*
  Arranges an array of objects along two axes.
  The horizontal axis is mapped to index, the vertical axis to color.
*/
 
Ball[] balls = new Ball[30]; // object array
float damping = 0.05;
int cols = 10;
int ballSize = 50;
int leftMargin = 75;
int topMargin = 75;
PFont font; // declare font variable of type PFont
 
void setup() {
  size(640, 510);
  frameRate(60);
  smooth();
   
  // create font from in-memory font
  font = createFont("Helvetica-Bold", 15);
   
  for (int i = 0; i < balls.length; i++) {
    // Ball(int id_, float x_, float y_, color colHue_) {
    balls[i] = new Ball(i, width/2, height/2, random(100));
  }
}
 
void draw() {
  background(0);
   
  // get min/max values for each sort axis and store in array
  float[] minMaxX = new float[2];
  float[] minMaxY = new float[2];
   
  minMaxX = getMinMax("id", balls.length);
  minMaxY = getMinMax("colHue", balls.length);
   
  // draw balls
  for (int i = 0; i < balls.length; i++) {
     
    float offsetX = leftMargin;
    float offsetY = topMargin;
    float plotW = width - leftMargin*2;
    float plotH = height - topMargin*2;
                     
    float valX = balls[i].id;
    float valY = balls[i].colHue;
     
    // map values to x and y axis
    float posX = map(valX, minMaxX[0], minMaxX[1], offsetX, offsetX + plotW);
    float posY = map(valY, minMaxY[0], minMaxY[1], offsetY, offsetY + plotH);
   
    // check if photo is visible
    balls[i].position(posX, posY);
    balls[i].display();
  }
}
 
float[] getMinMax(String sortField, int count) {
   
  // create temporary array to hold sort values
  float tempArray[] = new float[count];
   
  // populate temporary array with sort values
  for (int i = 0; i < balls.length; i++) {
    if (sortField == "id") { // only add to array if photo is visible
      tempArray[i] = balls[i].id;
    } else if (sortField == "colHue") {
      tempArray[i] = balls[i].colHue;
    }
  }
   
  // store minumum and maximum values in array. minMax[0] store minimum; minMax[1] stores maximum
  float[] minMax = new float[2];
   
  minMax[0] = MAX_FLOAT; // MAX_FLOAT is the highest possible float number
  minMax[1] = MIN_FLOAT; // MIN_FLOAT is the lowest possible float number
 
  for (int i = 0; i < tempArray.length; i++) {
     if (tempArray[i] < minMax[0]) { // get minimum
       minMax[0] = tempArray[i];
     }
     if (tempArray[i] > minMax[1]) { // get maximum
       minMax[1] = tempArray[i];
     }
  }
   
  return minMax;
}