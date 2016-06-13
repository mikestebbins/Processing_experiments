
ArrayList points = new ArrayList();
Boolean md = false;
int size = 10;
int current_x = 0;
int current_y = 0;
int max_growth_length_x = 1280; 
int max_growth_length_y = 900; 
int loop_count= 0;
int max_lines = 500;
 
void setup(){
  size(1280,900);
  background(255);
  smooth();
  //noStroke();
  strokeWeight(5);
  strokeCap(ROUND);
}

void draw() {
  int new_x = (int) random(max_growth_length_x);
  int new_y = (int) random(max_growth_length_y);
  
  line(current_x,current_y,new_x,new_y);
  stroke(random(50,100));
  current_x = new_x;
  current_y = new_y;
  loop_count ++;
  if (loop_count >= max_lines) {
    background(255);
    loop_count = 0;
  }
}


 /*
void draw(){
  if(md){
    for(int f=0; f<size; f+=1){
      //for(int g=0; g<height; g+=height/10){
      points.add(new Point(random(0,width),random(0,height)) );
      //}
    }
  }
  //fill(255,10);
  //rect(-1,1,width+1,height+1);
  //background(255);
  noiseDetail(8,0);
  //noiseSeed(1);
  for(int i=points.size()-1; i>0; i--){
    Point p = (Point)points.get(i);
    p.update();
    if(p.finished){
      points.remove(i);
    }
  }
   
  println(points.size());
}
 
void mousePressed(){
  md = true;
}
void mouseReleased(){
  md = false;
}
void keyPressed(){
  background(255);
  noiseSeed(round(random(1000)));
  for(int i=points.size()-1; i>0; i--){
    Point p = (Point)points.get(i);
    //p.x = random(width);
    //p.y = random(height);
    points.remove(i);
  }
  //saveFrame("perlin####.png");
}
 
class Point { 
  float x,y,xv = 0, yv = 0;
  float maxSpeed = 3000000;
 
  Boolean finished = false;
 
  Point(float x, float y){
    this.x = x;
    this.y = y;
  }
 
  void update(){
    stroke(0,16);
    float r = random(1);
    this.xv = cos(  noise(this.x*.01,this.y*.01)*TWO_PI  );
    this.yv = -sin(  noise(this.x*.01,this.y*.01)*TWO_PI  );
 
    if(this.x>width){
      //this.x = 1;
      this.finished = true;
    }
    else if(this.x<0){
      //this.x = width-1;
      this.finished = true;
    }
    if(this.y>height){
      //this.y = 1;
      this.finished = true;
    }
    else if(this.y<0){
      //this.y = height-1;
      this.finished = true;
    }
 
    if(this.xv>maxSpeed){
      this.xv = maxSpeed;
    }
    else if(this.xv<-maxSpeed){
      this.xv = -maxSpeed;
    }
    if(this.yv>maxSpeed){
      this.yv = maxSpeed;
    }
    else if(this.yv<-maxSpeed){
      this.yv = -maxSpeed;
    }
 
    this.x += this.xv;
    this.y += this.yv;
 
    line(this.x+this.xv, this.y+this.yv,this.x,this.y );
  }
 
}
*/