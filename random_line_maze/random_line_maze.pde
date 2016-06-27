
ArrayList traces = new ArrayList();
Boolean md = true;
int number_of_traces = 10;
int number_of_loops = 10000;
int loop_counter = 0;

int max_growth_length_x = 640; 
int max_growth_length_y = 450; 

int min_line_length = 5;
int max_line_length = 55;
 
int min_framerate = 100; 
 
void setup(){
  size(640,450);
  background(255);
  smooth();
  //noStroke();
  strokeWeight(5);
  strokeCap(ROUND);
  frameRate(min_framerate);
}

void draw(){
/*
if(md){
    for(int f=0; f<=size; f+=1){
      //for(int g=0; g<height; g+=height/10){
      traces.add(new Trace((int)random(0,width),(int)random(0,height)) );
      //}
    }
  }
 */
 
 if(md==true)  {
  for (int f=0; f<number_of_traces; f++)  {
    traces.add(new Trace((int)random(0,width),(int)random(0,height)) );    
  }
  md = false;
 }
 
 if(loop_counter >= number_of_loops)  {
     background(255);
     ArrayList traces = new ArrayList();
     md = true;
     loop_counter = 0;
 }
  
  //fill(255,10);
  //rect(-1,1,width+1,height+1);
  //background(255);
 // noiseDetail(8,0);
  //noiseSeed(1);
  for(int i=traces.size()-1; i>0; i--) {
    Trace t = (Trace)traces.get(i);
    t.update();
  }
  loop_counter = loop_counter + 1; 
  println(traces.size());
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
  for(int i=traces.size()-1; i>0; i--){
    Trace t = (Trace)traces.get(i);
    //p.x = random(width);
    //p.y = random(height);
    traces.remove(i);
  }
  //saveFrame("perlin####.png");
}
 
class Trace { 
  int current_x,current_y,new_x=0, new_y=0;
 
  boolean next_horz = true; // false = vertical, true = horiontal  
  boolean next_down = true; // false = down, true = up
  boolean next_right = true; // false = left, true = right

//  int min_line_length = 10;
//  int max_line_length = 10;
 
  Trace(int current_x, int current_y) {
    this.current_x = current_x;
    this.current_y = current_y;
  }
 
  void update()  {
    
  this.new_x = this.current_x;
  this.new_y = this.current_y;
  
  if (this.next_horz == true) {
    
    if (this.next_right == true)  {
      this.new_x = this.current_x + (int) random(min_line_length,max_line_length);
    }
    else  {
      this.new_x = this.current_x - (int) random(min_line_length,max_line_length);
    }
    
    if ((this.new_x >= max_growth_length_x) || (new_x <= 0))  {
      this.next_right = !this.next_right; 
    }
    
  }
  
  else  {
    
    if (this.next_down == true)  {
      this.new_y = this.current_y + (int) random(min_line_length,max_line_length);
    }
    else  {
      this.new_y = this.current_y - (int) random(min_line_length,max_line_length);      
    }
    
    if ((this.new_y >= max_growth_length_y) || (this.new_y <= 0))  {
      this.next_down = !this.next_down; 
    }
    }
   
    line(this.current_x,this.current_y,this.new_x,this.new_y);
    this.current_x = this.new_x;
    this.current_y = this.new_y;
    stroke(random(50,50));
    this.next_horz = !this.next_horz;
  }
}