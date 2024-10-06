int joyX = A0; 
int joyy = A3; 
int xValue = 0; 
int yValue = 0;
const int buton = 2;
int deger = 0;

void setup() {
  Serial.begin(9600);  
  pinMode(buton,INPUT_PULLUP);
}

void loop() {
  
  xValue = analogRead(joyX);
  yValue = analogRead(joyy);
  deger = digitalRead(buton);
  
  
  if (xValue < 100) {
    Serial.println('a'); 
  } 
  else if (xValue > 1000) {
    Serial.println('d');  
  }
  
  else if (yValue < 100) {
    Serial.println('w');  
  } 
  else if (yValue > 1000) {
    Serial.println('s');  
  }
  else if (deger == LOW) {
    Serial.println('c'); 
  }
  

  


  
  delay(100);  
}