class Circle  {
 float x, y;
 float diameter;
 boolean on = false;
 
 void start(float xpos, float ypos, float diam) {
   x = xpos;
   y = ypos; 
   diameter = diam;
   on = true;
   ellipse(x,y,diameter,diameter);
  }
 
}