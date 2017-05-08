// Daniel Shiffman
// Kinect Point Cloud example

// https://github.com/shiffman/OpenKinect-for-Processing
// http://shiffman.net/p5/kinect/

import org.openkinect.freenect.*;
import org.openkinect.processing.*;

// Kinect Library object
Kinect kinect;

float deg;
float min = 0;
float max = 600;

PImage img;


void setup() {
  // Rendering in P3D
  size(600, 480);
  kinect = new Kinect(this);
  kinect.initDepth();

  img = createImage( kinect.width, kinect.height, RGB);
  noStroke();
}

void draw() {
  background(0);
  img.loadPixels();
  int[] depth = kinect.getRawDepth();

  //usar mouse para calibrar umbral
  // min = map(mouseX, 0, width, 0, 2048);
  //max = map(mouseY, 0, height, 0, 2048);


  float sumX = 0;
  float sumY = 0;
  float totalPix = 0;

  for (int x = 0; x < kinect.width; x ++) {
    for (int y = 0; y < kinect.height; y ++) {
      int offset = x + y*kinect.width;
      int d = depth[offset];


      if ( d > min && d < max) {
        //los pixeles que identifica
        img.pixels[offset] = color(255);
        sumX += x;
        sumY += y;
        totalPix++;
      } else {
        img.pixels[offset] = color(0);
      }
    }
  }

  img.updatePixels();
  image(img, 0, 0);

  float promX = sumX / totalPix;
  float promY = sumY / totalPix;

  fill(255, 255, 0);
  ellipse( promX, promY, 40, 40);
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      deg++;
    } else if (keyCode == DOWN) {
      deg--;
    }
    deg = constrain(deg, 0, 30);
    kinect.setTilt(deg);
  }
}
