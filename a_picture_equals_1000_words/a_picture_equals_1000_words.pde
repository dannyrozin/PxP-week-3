// The world pixel by pixel 2019
// Daniel Rozin
// encodes the entire bible into a picture R,G,B,R,G,B,R,G,B
// can take a few seconds to load

String allTheText;
void setup() {
  size(1000, 800);
  String url = "https://ia802708.us.archive.org/13/items/thebibleoldandne00010gut/kjv10.txt";
  String[] rawtext = loadStrings(url);                  // gets the text into an array of strings
  allTheText = join(rawtext, "" );                      // joins everything to a long string
  print(allTheText);
}
void draw() {
  loadPixels();                                          // load the pixels array of the window 

  // this section encodes the text into pixels on the screen
  int countChar=0;
  for (int y= 0; y < height; y++) {                    // go through all pixels of the window
    for (int x= 0; x < width; x++) {
      char R= allTheText.charAt(countChar++);            // get the characters of the bible one by one
      char G= allTheText.charAt(countChar++);
      char B= allTheText.charAt(countChar++);
      pixels[x+y*width]= color(R, G, B);                  // encode every 3 characters into an RGB pixel
    }
  }
  // this section decodes the pixels back to text
  int pixUnderMouse= mouseX+mouseY*height;                 // calculate the position in the pixels array 
  String underMouse= "";                                    // of the mouse position. 
  for (int i=0; i< 20; i++) {                                // lets get 20 pixels = 60 characters
    color thisPixColor = pixels[min(pixUnderMouse, width*height-1)]; // the min()is to make sure we dont access out of the array           
    underMouse+= (char)red(thisPixColor);                  // get the red component and add to our string
    underMouse+=  (char)green(thisPixColor);                // get the green component
    underMouse+=  (char)blue(thisPixColor);                // get the blue component
    for (int x= mouseX+i*18; x<mouseX+18+i*18; x++) {       // this whole thing is just to make the zoomed in 
      for (int y= mouseY; y<mouseY+10; y++) {               // pixels under the mouse
        pixels[min(x+y*width, width*height-1)]= thisPixColor;
      }
    }
    pixUnderMouse++;
  }
  updatePixels();                                           //  must call updatePixels oce were done messing with pixels[]
  fill(255);
  text(underMouse, mouseX, mouseY-3);                       // draw the string to the screen
}