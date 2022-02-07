// The world pixel by pixel 2022
// Daniel Rozin
// paints a circle of  pixels on the window under the mouse
int brushRadius= 30;
void setup() {
  size(1000, 800);
  background(0);                                   // lets start with black
}

void draw() {
}                                    // were not doing anything in draw()

void mouseDragged() {                                 // we paint only when the mouse is dragged
  loadPixels();                                        // load the pixels array of the window
  for (int x = mouseX-brushRadius; x < mouseX+ brushRadius; x++) {       // vist all x and y pixels in a range of
    for (int y = mouseY-brushRadius; y < mouseY+ brushRadius; y++) {     // mouseX and mouseY +- brushRadius 
      if (x>0 && x < width && y > 0 && y < height) {                     // make sure you are inside the window
        float distanceToMouse= dist(mouseX, mouseY, x, y);               // calculate distance of each pixel to the mouse
        if (distanceToMouse< brushRadius) {                             // only paint if we are inside the radius
          int pixelUnderMouse= (x+y*width);        // calculate the position in the pixel array of the pixel x y 
          pixels[pixelUnderMouse]= color(x % 255, y% 255, 0);          // set the pixel to a new color relative to x and y
        }
      }
    }
  }
  updatePixels();                                     //  must call updatePixels once were done messing with pixels[]
}
