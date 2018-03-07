  import processing.serial.*;

  Serial myPort;       

  void setup () {
    
    fullScreen();

    println(Serial.list());

    myPort = new Serial(this, Serial.list()[0], 9600);

    myPort.bufferUntil('\n');

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
