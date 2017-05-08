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
  //obtiene the raw data en un arreglo de int
  int[] depth = kinect.getRawDepth();
  
  
  
}
