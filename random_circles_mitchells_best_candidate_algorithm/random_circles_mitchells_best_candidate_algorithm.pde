// Generate dots at random X/Y locations by generating 10 candidate locations, then seeing which of the 10
// is furthest away from it's nearest neighbor (compared to all currently existing locations)
// more info: https://www.khanacademy.org/computer-programming/mitchells-best-candidate-algorithm/5901958850543616

int numberActiveCircles = 1000;
int numberCandidateCircles = 10;
int circleSize = 5;

PVector[] activeCircles = new PVector[numberActiveCircles];
PVector[] candidateCircles = new PVector[numberCandidateCircles];

float circleX = 0;
float circleY = 0;
int counter = 0;

void setup() {
  size(640, 360); 
  background(255);
  fill(0,0,0);
  noStroke();
  frameRate(100);
}


void draw()   {
  //print("counter = ");
  //println(counter);
   
  if (counter == 0)  {
    activeCircles[counter] = new PVector(random(0,width),random(0,height));  
    float[] f = activeCircles[counter].array();
    ellipse(f[0],f[1],circleSize,circleSize);
  }
  
  if ((counter != 0) && (counter < numberActiveCircles))  {
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
        PVector v2 = activeCircles[j];
        
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
    activeCircles[counter] = keeper;
    float[] f = activeCircles[counter].array();
    ellipse(f[0],f[1],circleSize,circleSize);
  }
  
  if (counter >= numberActiveCircles)  {
    while(true); 
  }
  counter++;
}


/*
void draw()  {  
  if (counter <= numberActiveCircles)  {
    fill(0,0,0);
    noStroke();
    //float circleSize = random(5, 50);
    activeCircles[counter] = new PVector(random(0,width),random(0,height));
    float[] f = activeCircles[counter].array();
    ellipse(f[0],f[1],circleSize,circleSize);
    counter++;
  }
}
*/