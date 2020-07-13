import java.util.*;

ArrayList<Dots> list = new ArrayList<Dots>();
int t_case = 0;


void setup() {
  size(1000, 1000, P3D);
  background(0);
}

void draw() {
  translate(500, 500);
  background(0);
  stroke(255);

  line(0, -500, 0, 0, 500, 0);
  line(-500, 0, 0, 500, 0, 0);
  line(0, 0, 500, 0, 0, -500);
  text("(0, -500, 0)", 0, -480, 0);
  text("(0, 500, 0)", 0, 480, 0);
  text("(500, 0, 0)", 430 ,15, 0);
  text("(-500, 0, 0)", -500, 15, 0);

  
  
  if (t_case == 0) {
    float x = random(-200, 200);
    float y = random(-200, 200);
    float z = random(-200, 200);
    int angle = (int)random(0, 360);

    list.add(new Dots(x, y, z, angle));

    for (int i = 0; i < list.size(); i++) {
      list.get(i).draw_dot();
    }

    angle += radians(1);

    if (list.size() > 500) {
      t_case = 1;
    }
  }

  if (t_case == 1) {
    for (int i = 0; i < list.size(); i++) {
      list.get(i).draw_dot();
    }
    
    camera(mouseX*2, 0, mouseY*2, 500, 500, 0, 100, 100, 100 );
  }
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
    
    pushMatrix();    
    translate( r*cos(radians(angle)), this.y, r*sin(radians(angle)));
    noStroke();
    fill(0, 255, 0);
    box(5);
    translate(-r*cos(angle), -this.y, -r*sin(angle));
    if (t_case == 0) {
      angle += 1;
    }
    popMatrix();
  }
}
