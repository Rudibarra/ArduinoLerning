void setup() {
  pinMode(LED_BUILTIN, OUTPUT);
  Serial.begin(9600);
  Serial.println("Arduino + Wokwi starter is running");
}

void loop() {
  digitalWrite(LED_BUILTIN, HIGH);
  Serial.println("LED on");
  delay(1000);

  digitalWrite(LED_BUILTIN, LOW);
  Serial.println("LED off");
  delay(1000);
}
