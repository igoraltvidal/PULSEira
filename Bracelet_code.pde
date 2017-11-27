

  import processing.serial.*;

  Serial myPort;        // The serial port
  String inString = "0";
  float inByte = 0;

  void setup () {
    // set the window size:    
    fullScreen();

    // List all the available serial ports
    // if using Processing 2.1 or later, use Serial.printArray()
    println(Serial.list());

    // I know that the first port in the serial list on my Mac is always my
    // Arduino, so I open Serial.list()[0].
    // Open whatever port is the one you're using.
    myPort = new Serial(this, Serial.list()[0], 9600);

    // don't generate a serialEvent() unless you get a newline character:
    myPort.bufferUntil('\n');

    // set initial background:
    background(0);
  }

  void draw () {
    
    if (inByte == 1)
    {
      background(255, 0, 0);
      textSize(100);
      textAlign(CENTER, CENTER);
      text("DIMINUA O VOLUME", displayWidth/2 , 300); 

    }
    else if (inByte == 2)
    {
      background(207, 177, 32);
      textSize(100);
      textAlign(CENTER, CENTER);
      text("AUMENTE O VOLUME", displayWidth/2 , 300); 

    }
    else if (inByte == 3)
    {
      background(0, 0, 0);
      textSize(100);
      textAlign(CENTER, CENTER);
      text("SEM MÚSICA", displayWidth/2 , 300); 

    }
    else if (inByte == 4)
    {
      background(98, 236, 32);
      textSize(100);
      textAlign(CENTER, CENTER);
      text("INTENSIDADE IDEAL", displayWidth/2 , 300); 

    }
    
  }

  void serialEvent (Serial myPort) {
    // get the ASCII string:
    inString = myPort.readStringUntil('\n');
    print(inString);
    inString = trim(inString);
    inByte = float(inString);

  }