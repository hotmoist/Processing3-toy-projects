import java.util.*;

ArrayList<Dots> list = new ArrayList<Dots>();

float ty = -200;


void setup() {
  size(1000, 1000, P3D);
  background(0);
  stroke(255);
  translate(500, 500);

  // sphere(10);

  line(0, -500, 0, 0, 500, 0);
  line(-500, 0, 0, 500, 0, 0);
  line(0, 0, 500, 0, 0, -500);
}

void draw() {
  translate(500, 500);
  background(0);
  stroke(255);

  // show coordinate

  line(0, -500, 0, 0, 500, 0);
  line(-500, 0, 0, 500, 0, 0);
  line(0, 0, 500, 0, 0, -500);

  text("(0, -500, 0)", 0, -480, 0);
  text("(0, 500, 0)", 0, 480, 0);
  text("(500, 0, 0)", 430, 15, 0);
  text("(-500, 0, 0)", -500, 15, 0);

  // set xyz and angle
  float x = random(-200, 200);
  // float y = random(-200, 200);


  float z = random(-200, 200);

  int angle = (int)random(0, 360);

  // add Dots to list
  // list.add(new Dots(x, y, z, angle));
  list.add(new Dots(x, ty, z, angle));

  for (int i = 0; i < list.size(); i++) {
    list.get(i).draw_dot();
  }

  // same as rotation of the mortor
  angle += radians(1);

  //delay(50);
}

class Dots {
  float x, y, z;
  float angle;

  Dots(float x, float y, float z, float angle) {
    this.x = x;
    this.y = y;
    this.z = z;
    this.angle = angle;
  }

  void draw_dot() {
    float r = dist(this.x, this.z, 0, 0);

    if ( angle % 360 == 0) {
      if ( ty < 200) {
        ty+= 0.1;
      }
    }

    pushMatrix();    
    translate( r*cos(radians(angle)), this.y, r*sin(radians(angle)));
    noStroke();
    fill(0, 255, 0);
    box(5);
    translate(-r*cos(angle), -this.y, -r*sin(angle));
    angle += 1;
    popMatrix();
  }
}
