// The world pixel by pixel 2019
// Daniel Rozin
// using a sine wave to get rich color transitions

void setup() {
  size(1000, 800);  
}  

void draw() {
  background (0);
  loadPixels();                                      // get the pixels[] of the window

  for (int x= 0; x< width; x++) {                   
    for (int y= 0; y< height; y++) {                     // repeat through all pixels
      float sinX = sin(x/(mouseX+1.0));           // calculate a number based on the horizontal (X) position
      sinX =map (sinX, -1, 1, 0, 255);                 // of the pixel and the mouse , then map it to 0-255
         
      float sinY = sin(y/(mouseY+1.0));           // do the same with the vertical position of the pioxel and mouseY
      sinY =map (sinY, -1, 1, 0, 255);
      
      int thisPixel = x+y*width;                       // find where this pixel lives in the pixels[]
      pixels[thisPixel]= color(0, sinY, sinX);         // set a color based on the two new numbers we calculated as G and B
    }
  }
  updatePixels();                                      // update the pixels[]
  println(frameRate);
}