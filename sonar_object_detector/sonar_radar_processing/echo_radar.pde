import processing.serial.*;
import java.util.*;

Serial port;

float angle = PI;
float movement = radians(1);
float distance = 0;

String val;
float[] serialVal = new float[2];
int serialCount = 0;
float temp1, temp2;


void setup() {


  printArray(Serial.list());
  port = new Serial(this, Serial.list()[0], 9600);
  size(1000, 500);

  background(0);
  translate(500, 0);
  
  stroke(color(0, 250, 0));
  fill(0);
  arc(0, height, width, width, PI + radians(30), TWO_PI - radians(30), PIE); 

}

void draw() {
  translate(500, 0);
  

  if (port.available()>0) {
    val = port.readStringUntil('\n');

    if (serialCount < 2 && val != null) {

      serialVal[serialCount] = Float.parseFloat(val);
      serialCount++;
    }
    
    if (serialCount == 2) {
      angle = PI + radians(30) + radians((int)serialVal[1]);
      distance = serialVal[0];
      //line(0, height, (width/2) * cos(angle), 500 +(width/2) * sin(angle));
      circle( (distance*20)*cos(angle), 500 + (distance*20) * sin(angle), 1);
      serialCount = 0;
    }
  }
}
