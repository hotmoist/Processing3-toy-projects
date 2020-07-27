class Numbers {
  final int TEXTSIZE = 20;
  final int SPEED = 30;
  int x, y;
  int z;
  int num;
  
  

  Numbers(int x, int y, int z) {
    this.x = x;
    this.y = y;
    this.z = z;
   
  }

  void text_num() {
    num = (int)random(0, 9);
   // pushMatrix();
    textSize(TEXTSIZE);
    text(num+"", x, y,z);
   // popMatrix();
  }
  
  int getZ(){
    return z;
  }
  
  void increaseZ(){
    z += SPEED;
  }
 
}
