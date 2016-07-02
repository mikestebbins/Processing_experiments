// DON'T-CHANGE-UNLESS-YOU-NEED-TO INPUTS
int bike_width = 12;
int bike_length = 30;
int bike_rad = 4;
float bike_x_position_initial = 320;
float bike_y_position = 250;

int car_width = 28;
int car_length = 60;
int car_rad = 10;
float car_x_position_initial = 10;

int road_centerline_y = 180; 
int road_width = 160; 
int road_stripe_length = 30;
int road_stripe_width = 10;

// MODIFIABLE INPUTS -----------------------------------------------------------------------

float bike_speed = 10; // mph
float car_speed = 35; // mph
float distance_between_car_and_bike = 2; // feet

float radar_cone_angle = 90; // degrees
float radar_cone_length = 98*2.5; // feet, range of radar

float timestep = 0.1; // seconds

// CALCULATED/SET-UP TYPE INPUTS -----------------------------------------------------------------------
float bike_x_position = bike_x_position_initial;
float car_x_position = car_x_position_initial;
float car_y_position = bike_y_position - bike_width/2 - distance_between_car_and_bike - car_width/2;
float time = 0.0; // time counter
float radar_cone_angle_rads = radians(radar_cone_angle);
float mph_to_fps = 1.46667; // convert mph to feet/sec

String message_1a = " : car's speed (relative to bike, ft/sec)";
String message_2a = " : angle between (deg)";
String message_3a = " : radar-observed speed (ft/sec)";

PVector car = new PVector(car_x_position,car_y_position);
PVector bike = new PVector(bike_x_position,bike_y_position);
PVector car_vel = new PVector(car_speed*mph_to_fps,0);
PVector bike_vel = new PVector(bike_speed*mph_to_fps,0);

boolean output_images = true;
PFont f;

void setup() {
  size(640, 360); 
  background(255);
  fill(0,0,0);
  stroke(50,50,50);
  rectMode(CENTER);
  frameRate(10);
  f = createFont("Arial",16,true); // Arial, 16 point, anti-aliasing on
}

void draw()  {  
  
  background(255); // clear screen
  
  // start over once the car reaches the edge of the screen
  if (car.x >= width)  {
    bike.x = bike_x_position_initial;
    car.x = car_x_position_initial;
    output_images = false;
    background(255); // clear screen
    delay(50);
  }
  
  else  {
    // update positions
    bike.x = bike.x + (bike_speed * mph_to_fps)*timestep;
    car.x = car.x + (car_speed * mph_to_fps)*timestep;
        
    // build the radar triangle
    float radar_extent_x = bike.x - radar_cone_length;
    float radar_extent_y_top = bike.y - (tan(radar_cone_angle_rads/2)*radar_cone_length);
    float radar_extent_y_bottom = bike.y + (tan(radar_cone_angle_rads/2)*radar_cone_length);
    
    // draw all of the "bodies"
    drawRoad();
    drawRadar(radar_extent_x,radar_extent_y_top,radar_extent_y_bottom);
    drawBike();
    drawCar();
    
    PVector car_to_bike = PVector.sub(bike,car);
    PVector car_to_bike_vel = PVector.sub(car_vel,bike_vel);
    float angle_between = degrees(car_to_bike.heading());

    String message_1b = nfp(car_to_bike_vel.x,2,1);
    String message_2b = ("-------");
    String message_3b = ("-------");

    // if the car is within the radar triangle calc some stuff, draw an arrow, and update the text    
    if ((car.x + car_length/2 >= radar_extent_x) && (angle_between <= radar_cone_angle/2))  {
      drawRelativeVelocityVector(car_to_bike, bike);
      message_2b = nfp(angle_between,2,1);
      float relative_speed = car_to_bike_vel.mag() * cos(radians(angle_between));
      message_3b = nfp(relative_speed,2,1);      
    }
    
    // print the text onscreen
    String message_1 = message_1b + message_1a + "\n" + message_2b + message_2a + "\n" + message_3b + message_3a;
    textFont(f,16);
    fill(20);
    text(message_1,10,20);
      
    // output images to use for a video
    if (output_images == true)  {
      saveFrame("line-######.png");
    }
    
    // increment the time counter
    time = time + timestep;
  }
}

void drawRoad()  {
  fill(150,150,150);
  noStroke();
  line(0,(road_centerline_y+road_width/2),width,(road_centerline_y+road_width/2));
  line(0,(road_centerline_y-road_width/2),width,(road_centerline_y-road_width/2));
  
  rect(width/2,height/2,width,road_width);
  
  fill(255,255,255);
  rect(width/2,height/2-(road_width/2-5),width,2);
  rect(width/2,height/2+(road_width/2-5),width,2);


  for (int i = 0; i <= width; i=i+(road_stripe_length*2))  {
    rect(i,height/2,road_stripe_length,road_stripe_width,2);
  } 
}

void drawRadar(float radar_extent_x,float radar_extent_y_top,float radar_extent_y_bottom)  {
  fill(255,0,150,50);
  noStroke();
  //triangle(bike.x,bike.y,radar_extent_x,radar_extent_y_top,radar_extent_x,radar_extent_y_bottom);
  arc(bike.x,bike.y,2*radar_cone_length,2*radar_cone_length,PI-(radar_cone_angle_rads/2),PI+(radar_cone_angle_rads/2));
}

void drawBike()  {
  fill(50,50,50);
  noStroke();
  rect(bike.x, bike.y,bike_length,bike_width,bike_rad);
}

void drawCar()  {
  fill(50,50,50);
  noStroke();
  rect(car.x, car.y,car_length,car_width,car_rad);
}

void drawRelativeVelocityVector(int x1, int y1, int x2, int y2) {
  stroke(255,0,0);
  strokeWeight(4);
  line(x1, y1, x2, y2);
  pushMatrix();
  translate(x2, y2);
  float a = atan2(x1-x2, y2-y1);
  rotate(a);
  line(0, 0, -5, -5);
  line(0, 0, 5, -5);
  popMatrix();
} 

void drawRelativeVelocityVector(PVector car_to_bike, PVector bike) {
  stroke(255,0,0);
  fill(255,0,0);
  float angle = car_to_bike.heading();
  pushMatrix();
  translate(car.x,car.y);
  line(0,0,car_to_bike.x,car_to_bike.y);
  translate(car_to_bike.x,car_to_bike.y);
  rotate(angle);
  noStroke();
  triangle(0,0,-4,-4,-4,4);
  popMatrix();
} 

void keyPressed() {
  noLoop();
}

void keyReleased() {
  loop();
}