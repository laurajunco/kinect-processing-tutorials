import org.openkinect.freenect.*;
import org.openkinect.processing.*;

Kinect kinect;
PImage img;


void setup() {
  size(600, 480);
  kinect = new Kinect(this);
  kinect.initVideo();
}

void draw()
{
  img = kinect.getVideoImage();
  image(img, 0, 0);
  img.loadPixels();

  int sumX = 0;
  int sumY = 0;
  int totalPix = 0;
  
  for ( int x = 0; x < img.width; x++ ) {
    for ( int y = 0; y < img.height; y++ )
    {
      int loc = x +  y * img.width;

      
      if (brightness(img.pixels[loc]) > 250 )
      {
        
        fill(0);
        
        sumX += x;
        sumY += y;
        totalPix++;
      }
    }
  }
  float promX = sumX / (totalPix +1);
  float promY = sumY / (totalPix +1);
  
  img.updatePixels();
  ellipse(promX, promY, 50, 50);
}
