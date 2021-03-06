/* autogenerated by Processing revision 1277 on 2021-12-20 */
import processing.core.*;
import processing.data.*;
import processing.event.*;
import processing.opengl.*;

import java.util.HashMap;
import java.util.ArrayList;
import java.io.File;
import java.io.BufferedReader;
import java.io.PrintWriter;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.IOException;

public class floury extends PApplet {


int dim;

 public void setup() {
  /* size commented out by preprocessor */;
  dim = width/3;
  background(0);
  colorMode(HSB, 250, 100, 100);
  noStroke();
  ellipseMode(RADIUS);
  frameRate(1);
}

 public void draw() {
  background(0);
  for (int x = 0; x <= width; x+=dim) {
    drawGradient(x, height);
  }
}

 public void drawGradient(float x, float y) {
  int radius = dim;
  float h = random(0, 360);
  for (int  r=radius; r > 0; --r) {
    fill(h, 100, 100);
    ellipse(x, y, r, r);
    h = (h + 1) % 360;
  }
}


  public void settings() { size(840, 640); }

  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "floury" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
