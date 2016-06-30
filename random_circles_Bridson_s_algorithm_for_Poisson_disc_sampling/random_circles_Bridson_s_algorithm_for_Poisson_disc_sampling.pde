// based on code from: https://bl.ocks.org/mbostock/dbb02448b0f93e4c82c3
// and: https://processing.org/tutorials/arrays/
//
// Generate dots at random X/Y locations by generating 10 candidate locations, then seeing which of the 10
// is furthest away from it's nearest neighbor (compared to all currently existing locations)
// more info: https://www.khanacademy.org/computer-programming/mitchells-best-candidate-algorithm/5901958850543616

Circle[] circles; // Declare the array

int numberTotalCircles = 2500;
int numberCandidateCircles = 100;
int circleSize = 5;
int minRadius = 3;
int currentCircle = 0;

PVector[] totalCircles = new PVector[numberTotalCircles];
//PVector[] activeCircles = new PVector[numberActiveCircles];
PVector[] candidateCircles = new PVector[numberCandidateCircles];

float circleX = 0;
float circleY = 0;
int counter = 0;

void setup() {
  size(640, 360); 
  background(255);
  fill(0,0,0);
  noStroke();
//  frameRate(200);
  circles = new Circle[numberTotalCircles]; // Create the array
  for (int i = 0; i < circles.length; i++) {
    circles[i] = new Circle(); // Create each object
  }
}

void draw()   {
  //print("counter = ");
  //println(counter);
   
  if (counter == 0)  {
    circles[currentCircle].start(random(0,width),random(0,height),circleSize);
    println(frameCount);
    currentCircle++;
  }
}
  ///////////////////////////////////////////////////////////////////////////////////////////////////////////
  ///////////////////////////////////////////////////////////////////////////////////////////////////////////
  ///////////////////////////////////////////////////////////////////////////////////////////////////////////
  // pretty much haven't done anything below here.  Need to figure out if I should stick with 
  // Pvectors, or abandon them.  Nice for distance checks.
  
  // this explains how to grab the x, y from each object

  /*
  
  if ((counter != 0) && (counter < numberTotalCircles))  {
    //Generate new random coords arrays
    for (int i = 0; i < numberCandidateCircles; i++)  {
      candidateCircles[i] = new PVector(random(0,width),random(0,height));
    }
    //For each of the new candidate points, test it's distance from each existing point
    float maxDist = 0;
    int maxDistIndex = 9999;
    
    for (int i = 0; i < numberCandidateCircles; i++)  {
      //print("i = ");
      //println(i);
      
      float minDist = 9999;
      int minDistIndex = 9999;
      
      for (int j = 0; j < counter; j++)  {
        //print("j = ");
        //println(j);
        
        PVector v1 = candidateCircles[i];      
        PVector v2 = totalCircles[j];
        
//        //print(v1);
//        //print("    ");
//        //println(v2);
        
        float dist = PVector.dist(v1,v2);
//        println(dist);
        
        if (dist < minDist)  {
          minDist = dist;
          minDistIndex = j;
        }
      }
      
      if (minDist >= maxDist)  {
        maxDist = minDist;
        maxDistIndex = i;  
        //print("maxDist = ");
        //print(maxDist);
        //print("     maxDistIndex = ");
        //println(maxDistIndex);
      }
    }
    
    PVector keeper = candidateCircles[maxDistIndex];
    totalCircles[counter] = keeper;
    float[] f = totalCircles[counter].array();
    ellipse(f[0],f[1],circleSize,circleSize);
  }
  
  if (counter >= numberTotalCircles)  {
    while(true); 
  }
  counter++;
  surface.setTitle(int(frameRate) + " fps");
}

*/