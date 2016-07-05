/*
  Arranges an array of objects along two axes.
  The horizontal axis is mapped to index, the vertical axis to color.
*/
 
float[] plot0 = new float[21]; //
float[] plot1 = new float[21]; //

int ballSize = 3;
int leftMargin = 480;
int rightMargin = 630;
int topMargin = 10;
int bottomMargin = 110;
PFont font; // declare font variable of type PFont
int counter=0;

PFont f;
 
void setup() {
  size(640, 510);
  frameRate(2);
  smooth();
   
  // create font from in-memory font
  f = createFont("Arial",10,true); // Arial, 16 point, anti-aliasing on   
}
 
void draw() {
  
  if (counter >=20)  {
    while(true);
    }
    
   else  { 
  background(255);
  
  // axis lines
  stroke(200);
  line(leftMargin,bottomMargin,rightMargin,bottomMargin);
  line(leftMargin,bottomMargin,leftMargin,topMargin);
  
  // vert axix label
  pushMatrix();
  translate(leftMargin - 5,bottomMargin - 20);
  rotate(3*PI/2);
  textFont(f,12);
  fill(80);
  String vertLabel = "radar speed";
  text(vertLabel,0,0); 
  rotate(-3*PI/2);
  translate(0,0);
  popMatrix();
  
  // horz axis label
  pushMatrix();
  translate((leftMargin + rightMargin)/2 - 10,bottomMargin + 15);
  textFont(f,12);
  fill(80);
  String horzLabel = "time";
  text(horzLabel,0,0); 
  translate(0,0);
  popMatrix();
   
  // generate fake data
  plot0[counter] = 50 - counter;
  plot1[counter] = 50 - counter*1.2;
  print(plot0[counter]);
  print("  /  ");
  println(plot1[counter]);
   
  // draw first data set
  for (int i = 0; i < counter; i++) {
     
    float valX = i;
    float valY = plot0[i] - 5;
    
    println("----------------------------------------------");
    print(valX);
    print("  /  ");
    println(valY);
                         
    // map values to x and y axis
    float posX = map(valX, 0, 20, leftMargin+5, rightMargin);
    float posY = map(valY, 0, 100, bottomMargin-10, topMargin);
    
    print(posX);
    print("  /  ");
    println(posY);
    
    noStroke();
    fill(255,0,0);
    ellipse(posX,posY,ballSize,ballSize);
    }
    
      // draw second data set
  for (int i = 0; i < counter; i++) {
     
    float valX = i;
    float valY = plot1[i] - 10;
    
    print(valX);
    print("  /  ");
    println(valY);
                         
    // map values to x and y axis
    float posX = map(valX, 0, 20, leftMargin+5, rightMargin);
    float posY = map(valY, 0, 100, bottomMargin-10, topMargin);
    
    print(posX);
    print("  /  ");
    println(posY);    
    
    noStroke();
    fill(0,255,0);
    ellipse(posX,posY,ballSize,ballSize);
    }
  counter = counter + 1;
}
}