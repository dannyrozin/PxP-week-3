// The world pixel by pixel 2019
// Daniel Rozin
// changing pixel values based on volume of sound from mic
// uses the sound library that needs to be added in import library->add library
import processing.sound.*;
Amplitude amp;
AudioIn in;
int scrollX= 0, scrollY=0;
void setup() {
  size(1000, 800);
  background(255);
  in = new AudioIn(this, 0);             // open libraries
  amp = new Amplitude(this);            
  in.start();                            // start listening to the mic
  amp.input(in);                         // tell it to analize the microphone
  background(0);                         // start with black
}      

void draw() {
  loadPixels();

  float volume= amp.analyze();                        // get the lates analasys of the volume
  volume = map(volume, 0, 0.5, 0, 255);                 // its a small number so map to 255

  scrollX= (scrollX+1)% width;               
  for (int y= 0; y< height; y++) {                     // repeat through a vertical line of pixels
    int thisPixel = scrollX+y*width;                   // find the position of our pixel in the array
    pixels[thisPixel]= color(0, 0, volume);            // set a pixel in the array with a blue color based on the volume
  }

  scrollY= (scrollY+1)% height;                        // do the same for a horizontal line and green
  for (int x= 0; x< width; x++) {
    int thisPixel = x+scrollY*width;
    pixels[thisPixel]= color(0, volume, 0);
  }

  for (int x= 0; x< width; x++) {                     // one more Red horizontal line going up with 
    int thisPixel = x+(height-1-scrollY)*width;
    pixels[thisPixel]= color(volume, 0, 0);
  }
  updatePixels();                                      // update the pixels[]
}

void stop() {                                           // sometimes this helps the sound library to not unexpectedly quit
  in.stop();
} 