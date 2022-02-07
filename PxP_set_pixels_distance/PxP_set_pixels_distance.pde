// The world pixel by pixel 2022
// Daniel Rozin
// Set pixels according to distance from mouse

void setup() {
  size(1000, 700);
}

void draw() {
  loadPixels();                              //get the pixels[] of the window
  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {       // repeat to visit every pixel in window
      float thisDist = dist(x, y, mouseX, mouseY);   // calculate the distance for this pixel to the mouse
      thisDist= map(thisDist,0,width,0,255);         // the distance is a big number so map it to 0-255
      pixels[x+ y*width]= color(thisDist, thisDist, 255);   // calculate the location of the pixel (x,y) in the
    }                                                       // pixel array by the math x+y*width and set the new color
  }
  updatePixels();                                           // wer'e done messing with the pixel, update them
  
  
  // this part just for printing the frame rate - has to happen after we call updatePixels() !
  fill (255);
  rect(80, 80, 150, 40);
  fill (0);
  text("framerate="+frameRate, 100, 100);
}
