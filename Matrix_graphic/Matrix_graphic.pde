
Numbers[][] nums;
Numbers[][] nums2;

long time = 0;

void setup() {
  size(7000, 1050, P3D);
  nums = new Numbers[height*60][width];
  nums2 = new Numbers[height][width];

  for (int j = 0; j < width/20; j++) {
    int k = (int)random(-1500, -500);
    int k2 = (int)random(-1500, -500);
    int t = (int)random(-1500, 1500);
    int t2 = (int)random(-1500, 1500);
    for (int i = 0; i < height/20; i++) {
      nums[i][j] = new Numbers( j*20, i*20 + t, k);
      nums2[i][j] = new Numbers( j*20, i*20 + t2, k2);
    }
  }
}

void draw() {
  background(0);
  // noStroke();

  fill(0, 255, 0);
  
   if (time % 5 <= 3) { 
    pushMatrix();

    stroke(0, 255, 0);
    strokeWeight(10);
    line(width/2 - 220, height/2 - 100, width/2 + 220, height/2 - 100 );
    line(width/2 - 220, height/2 -30, width/2 + 220, height/2-30 );
    line(width/2 - 220, height/2 - 100, width/2 - 220, height/2 -30 );
    line(width/2 + 220, height/2 -100, width/2 + 220, height/2 - 30 );

    textSize(50);
    text("SYSTEM FAILURE", width/2 -200, height/2 - 50);
    delay(50);

    popMatrix();
  }
  

  for (int j = 0; j < width/20; j++) {

    int k = (int)random(-3000, -1000);
    int t = (int)random(-1500, 1500);

    int k2 = (int)random(-3000, -2000);
    int t2 = (int)random(-1500, 1500);


    for (int i = 0; i < height/20; i++) {

      if (nums[i][j] != null) {

        nums[i][j].text_num();

        if (nums[i][j].getZ() > 800) {
          nums[i][j] = new Numbers(j*20, i*20 + t, k);
        }

        nums[i][j].increaseZ();
      }

      if (nums2[i][j] != null) {

        nums2[i][j].text_num();

        if (nums2[i][j].getZ() > 800) {
          nums2[i][j] = new Numbers(j*20, i*20 + t2, k2);
        }

        nums2[i][j].increaseZ();
      }
    }
  }

  time++;

 
  delay(10);
}
