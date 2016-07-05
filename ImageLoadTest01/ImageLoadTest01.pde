/**
 * Load and Display 
 * 
 * Images can be loaded and displayed to the screen at their actual size
 * or any other size. 
 */
 
// The next line is needed if running in JavaScript Mode with Processing.js
/* @pjs preload="moonwalk.jpg"; */ 

PImage img;  // Declare variable "a" of type PImage

void setup() {
  size(1920, 1080);
  background(0);
  // The image file must be in the data folder of the current sketch 
  // to load successfully
  img = loadImage("Dtd_resized_14.png");  // Load the image into the program  
}

void draw() {
  // Displays the image at its actual size at point (0,0)

  image(img, 100, 100);
  //img.resize(0,230);
  // Displays the image at point (0, height/2) at half of its size
 // image(img, 0, height/2, img.width/2, img.height/2);
}
