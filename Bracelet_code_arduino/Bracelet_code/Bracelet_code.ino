int sensorValue = 0;  // variable to store the value coming from the sensor
float ambientSound = 326;
int PwmMotor1 = 0;  //Pwm value output to motors
int PwmMotor2 = 0;
int rangeDiff = 0;  //Difference between the ambient sound and the sensor sound measure
int countAverageLoop = 0;  //How many interactions to calculate the average of the sound measure
int averageMeasure = 0;  // Sum of the sound measures in an interval


int Motor1 = 9;      //Pin to motor (doesn't care what motor)
int Motor2 = 11;     //Pin to another motor
int sensorPin = A0;  //Analog input from sensor

void setup() {
  Serial.begin(9600);
}

void loop() {
  // read the value from the sensor
  sensorValue = analogRead(sensorPin);

  //Serial.println(sensorValue);
  
  delay(1);

  //apply a filter on the ambient sound
  ambientSound = ambientSound*0.8 + sensorValue*0.2;

  //make the difference between the ambient sound and the sensor measure
  rangeDiff = abs(sensorValue - ambientSound);

  //Gain apply to motor
  PwmMotor1 = rangeDiff*20 + 0;

  //Saturator 
  if (PwmMotor1 > 255)
  {
    PwmMotor1 = 255;
  }
  
  PwmMotor2 = PwmMotor1;

  //Write on the motors using PWM
  analogWrite(Motor1, PwmMotor1);
  analogWrite(Motor2, PwmMotor2);

  //make the average of the sensors value
  //this part is for the control of the intensity of sound
  //and help the system to use a good range measurament 
  //the numbers are used on the processing software
  if (countAverageLoop >= 1000)
  {

    if (averageMeasure/countAverageLoop > 25)
    {
    //  Serial.println("POR FAVOR | DIMINUA O VOLUME | MANTENHA DISTÂNCIA DA ORIGEM DO SOM");
        Serial.println("1");
    }
    else if (averageMeasure/countAverageLoop < 8 && averageMeasure/countAverageLoop > 0)
    {
    //  Serial.println("POR FAVOR | AUMENTE O VOLUME | APROXIME-SE DA DISTÂNCIA DA ORIGEM DO SOM");
        Serial.println("2");
    }
    else if (averageMeasure/countAverageLoop == 0)
    {
    //  Serial.println("SEM MÚSICA");
        Serial.println("3");
    }
    else
    {
    //  Serial.println("INTENSIDADE SONORA IDEAL");
        Serial.println("4");
    }

    countAverageLoop = 1;
    averageMeasure = 0;
    
  }
  else
  {
    countAverageLoop++;
    averageMeasure = abs(sensorValue - ambientSound) +  averageMeasure;
  }

}
