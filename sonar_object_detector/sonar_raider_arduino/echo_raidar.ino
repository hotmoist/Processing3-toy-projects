#include <Servo.h>

Servo ms;

int echoPin = 12;
int trigPin = 13;
int angle = 0;
float angleMove = radians(1);

void setup() {
  Serial.begin(9600);
  ms.attach(9);
  pinMode(trigPin, OUTPUT);
  pinMode(echoPin, INPUT);

}

void loop() {
  digitalWrite(trigPin, LOW);
  digitalWrite(echoPin, LOW);
  delayMicroseconds(2);
  digitalWrite(trigPin, HIGH);
  delayMicroseconds(10);
  digitalWrite(trigPin, LOW);

  unsigned long duration = pulseIn(echoPin, HIGH);
 
  float distance = ((float)(340 * duration) / 10000) / 2;

  Serial.println(distance);
//  Serial.println("cm");
 


  angle += degrees(angleMove);

  if (angle >= degrees(radians(120))) {
    
    angleMove = -1*radians(1);
  }

  if ( angle <= degrees(radians(0))) {
    
    angleMove = radians(1);
  }

  ms.write(angle);
  //Serial.print("각도 : ");
  Serial.println(angle);

 // Serial.write(distance);
 // Serial.write(angle);
   
  delay(100);
}
