// DON'T-CHANGE-UNLESS-YOU-NEED-TO INPUTS
int bike_width = 6;
int bike_length = 15;
int bike_rad = 2;
float bike_x_position_initial = 320;
float bike_y_position = 210;

int car_width = 14;
int car_length = 30;
int car_rad = 5;
float car_x_position_initial = 10;

int road_centerline_y = 180; 
int road_width = 80; 
int road_stripe_length = 15;
int road_stripe_width = 5;

// MODIFIABLE INPUTS -----------------------------------------------------------------------

float bike_speed = 10; // mph
float car_speed = 35; // mph
float distance_between_car_and_bike = 2; // feet

float radar_cone_angle = 90; // degrees
float radar_cone_length = 98; // feet, range of radar

float timestep = 0.2; // seconds

// CALCULATED INPUTS -----------------------------------------------------------------------
float bike_x_position = bike_x_position_initial;
float car_x_position = car_x_position_initial;
float car_y_position = bike_y_position - bike_width/2 - distance_between_car_and_bike - car_width ;
float time = 0.0; // time counter
float radar_cone_angle_rads = radians(radar_cone_angle);
float mph_to_fps = 1.46667; // convert mph to feet/sec
PVector car,bike,car_to_bike;

void setup() {
  size(640, 360); 
  background(255);
  fill(0,0,0);
  stroke(50,50,50);
  rectMode(CENTER);
  frameRate(10);
}

void draw()  {  
  
  background(255); // clear screen
  
  if (car_x_position >= width)  {
    bike_x_position = bike_x_position_initial;
    car_x_position = car_x_position_initial;
    background(255); // clear screen
    delay(750);
  }
  
  else  {
    bike_x_position = bike_x_position + (bike_speed * mph_to_fps)*timestep;
    car_x_position = car_x_position + (car_speed * mph_to_fps)*timestep;
    float radar_extent_x = bike_x_position - radar_cone_length;
    float radar_extent_y_top = bike_y_position - (tan(radar_cone_angle_rads/2)*radar_cone_length);
    float radar_extent_y_bottom = bike_y_position + (tan(radar_cone_angle_rads/2)*radar_cone_length);
    
    drawRoad();
    drawRadar(radar_extent_x,radar_extent_y_top,radar_extent_y_bottom);
    drawBike();
    drawCar();
    drawRelativeVelocityVector((int)car_x_position,(int)car_y_position,(int)bike_x_position,(int)bike_y_position);
      
    saveFrame("line-######.png");
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
  triangle(bike_x_position,bike_y_position,radar_extent_x,radar_extent_y_top,radar_extent_x,radar_extent_y_bottom);
}

void drawBike()  {
  fill(0,0,0);
  noStroke();
  rect(bike_x_position, bike_y_position,bike_length,bike_width,bike_rad);
}

void drawCar()  {
  fill(0,0,0);
  noStroke();
  rect(car_x_position, car_y_position,car_length,car_width,car_rad);
}

void drawRelativeVelocityVector(int x1, int y1, int x2, int y2) {
  stroke(255,0,0);
  line(x1, y1, x2, y2);
  pushMatrix();
  translate(x2, y2);
  float a = atan2(x1-x2, y2-y1);
  rotate(a);
  line(0, 0, -5, -5);
  line(0, 0, 5, -5);
  popMatrix();
} 