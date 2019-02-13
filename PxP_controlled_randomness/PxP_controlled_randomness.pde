// The world pixel by pixel 2019
// Daniel Rozin
// using a combination of randomness and user interaction to create colors

void setup() {
  size(1000, 800);
}      
void draw() {
  background (0);
  loadPixels();                                      // get the pixels[] of the window
 //randomSeed(1);                                    // if you seed the random the same it will not flicker
  for (int x= 0; x< width; x++) {             
    for (int y= 0; y< height; y++) {                     // repeat through all pixels
      int thisPixel = x+y*width;     
      float randi = random (height);                       // randomize a number beween 0 and height
      float distanceToMouse= dist( mouseX, mouseY, x, y);   // calculate the distance between the mouse and the pixel
      float distanceToNotMouse= dist( (width-mouseX), (height-mouseY), x, y); 
      if (randi> distanceToMouse)pixels[thisPixel]= color(0, 255, 0);  // only if the random number is bigger than the distance
      if (randi> distanceToNotMouse)pixels[thisPixel]= color(255, 0, 0); // then we set the color, otherwise it stays black
     }
  }


  updatePixels();                                      // update the pixels[]
}