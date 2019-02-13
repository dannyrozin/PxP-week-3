// The world pixel by pixel 2019
// Daniel Rozin
// paints one pixel on the window under the mouse

void setup() {
  size(1000, 800);
 background(0);                                   // lets start with black
}

void draw() {}                                    // were not doing anything in draw()

void mouseDragged(){                                 // we paint only when the mouse is dragged
 loadPixels();                                        // load the pixels array of the window 
  int pixelUnderMouse= (mouseX+mouseY*width);        // calculate the position in the pixel array of the pixel under the mouse
  pixels[pixelUnderMouse]= color(255,255,0);          // set the pixel under the mouse in a new red color
  updatePixels();                                     //  must call updatePixels oce were done messing with pixels[]  
}