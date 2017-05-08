import org.openkinect.freenect.*;
import org.openkinect.freenect2.*;
import org.openkinect.processing.*;
import org.openkinect.tests.*;

Kinect kinect;
int esp = 6;
void setup()
{
  size(640, 480, P3D);
  kinect = new Kinect(this);
  kinect.initDepth(); 
  
  fill(255);
  noStroke();
}

void draw()
{
  
  background(0);
  //Depth raw data = numeros entre 0 y 214
  PImage img = kinect.getDepthImage();
   image(img, 0, 0); 
  
  img.loadPixels();
  
  for(int x = 0; x < img.width; x+= esp){
    for(int y = 0; y < img.height; y+= esp){
      int loc = x + y * img.width;
      
 
      float b = brightness(img.pixels[loc]);
    }
  }
  img.updatePixels();
}
