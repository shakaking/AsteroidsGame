SpaceShip ship;
ArrayList<Bullet> pewpew;
ArrayList<Asteroid> balls;
float gravity = 1.01;
boolean LEFTIsPressed = false;
boolean RIGHTIsPressed = false;
boolean UPIsPressed = false;
Star[] starfield = new Star[400];
PImage earth;

public void setup(){
  size(949,534);
  earth = loadImage("earth.jpg");
  ship = new SpaceShip();
  pewpew = new ArrayList<Bullet>();
  for(int i=0; i < starfield.length; i++){
    starfield[i] = new Star();
  }
  balls = new ArrayList<Asteroid>();
  for(int p=0; p < 25; p++){
    balls.add(new Asteroid());
  }
}
public void draw() 
{
  background(earth);
  for (int i=0; i< starfield.length; i++){
      stroke(1);
      starfield[i].show();
      noStroke();
    }

  if(UPIsPressed == true){
    ship.accelerate(0.2);
  }
  if(LEFTIsPressed == true){
    ship.rotate(-10);
  }
  if(RIGHTIsPressed == true){
    ship.rotate(10);
  }
  ship.show();
  ship.move();
  for (int s=0; s<balls.size(); s++){
    fill(100);
    balls.get(s).show();
    balls.get(s).move();
    if(dist(ship.getX(), ship.getY(), balls.get(s).getX(), balls.get(s).getY())<20){
      noLoop();
      textSize(30);
      fill(255,0,0);
      text("YOU CRASHED! GAME OVER. refresh to restart", 150,267);
    }
  }
  for(int b = 0; b< pewpew.size(); b++){
    fill(0,255,0);
    pewpew.get(b).show();
    pewpew.get(b).move();
  for (int q=0; q < balls.size(); q++){
    if(dist(pewpew.get(b).getX(), pewpew.get(b).getY(), balls.get(q).getX(), balls.get(q).getY())<20){
      balls.remove(q);
      break;
    }
  }
 }
}

public void keyPressed(){
  if(key == ' '){
      pewpew.add(new Bullet(ship));
    }
    if (keyCode == UP) {
      UPIsPressed = true;
    }
    else if (keyCode == LEFT){
      LEFTIsPressed = true;
    }
    else if (keyCode == RIGHT){
      RIGHTIsPressed = true;
    }
      if (keyCode == DOWN){
      ship.setX((int)(Math.random()*1000));
      ship.setY((int)(Math.random()*650));
      ship.setDirectionX(0);
      ship.setDirectionY(0);
      ship.setPointDirection((int)(Math.random()*360));
    }
}

public void keyReleased(){
  if(keyCode == UP ){
    UPIsPressed = false;
  }
  else if(keyCode == LEFT){
    LEFTIsPressed = false;
  }
  else if(keyCode == RIGHT){
    RIGHTIsPressed = false;
  }
}

class Bullet extends Floater{
  Bullet(SpaceShip ship){
    myCenterX = ship.getX();
    myCenterY = ship.getY();
    myPointDirection = ship.getPointDirection();
    double dRadians = myPointDirection*(Math.PI/180);
    myDirectionX = 5 * Math.cos(dRadians) + ship.getDirectionX();
    myDirectionY = 5 * Math.sin(dRadians) + ship.getDirectionY();
  }
  public void setX(int x){myCenterX = x;}
  public int getX(){return (int)myCenterX;}  
  public void setY(int y){myCenterY = y;}
  public int getY(){return (int)myCenterY;};  
  public void setDirectionX(double x){myDirectionX = x;}
  public double getDirectionX(){return (double)myDirectionX;}  
  public void setDirectionY(double y){myDirectionY = y;}   
  public double getDirectionY(){return (double)myDirectionY;};  
  public void setPointDirection(int degrees){myPointDirection = degrees;}  
  public double getPointDirection(){return (int)myPointDirection;} 

  public void show(){
    noStroke();
    fill(0,255,0);
    ellipse((float)myCenterX, (float)myCenterY, 7,7);
    myCenterX= myCenterX + 0.1;
    myCenterY= myCenterY + 0.1;
  }
  public void move(){
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY; 
  }
}

class SpaceShip extends Floater  {   
  SpaceShip(){
    corners = 3;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = -8;
    yCorners[0] = -8;
    xCorners[1] = 16;
    yCorners[1] = 0;
    xCorners[2] = -8;
    yCorners[2] = 8;
    myCenterX = 300;
    myCenterY = 300;
  }
  public void setX(int x){myCenterX = x;}
  public int getX(){return (int)myCenterX;}  
  public void setY(int y){myCenterY = y;}
  public int getY(){return (int)myCenterY;};  
  public void setDirectionX(double x){myDirectionX = x;}
  public double getDirectionX(){return (double)myDirectionX;}  
  public void setDirectionY(double y){myDirectionY = y;}   
  public double getDirectionY(){return (double)myDirectionY;};  
  public void setPointDirection(int degrees){myPointDirection = degrees;}  
  public double getPointDirection(){return (int)myPointDirection;} 
}

class Asteroid extends Floater{
  private int nDegreesOfRotation, speed;
  Asteroid(){
    corners = 4;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = -15;
    yCorners[0] = -15;
    xCorners[1] = -15;
    yCorners[1] = 15;
    xCorners[2] = 15;
    yCorners[2] = 15;
    xCorners[3] = 15;
    yCorners[3] = -15;
    myDirectionX = (Math.random()*5-2.5);
    myDirectionY = (Math.random()*5-2.5);
    myCenterX = (Math.random()*width);
    myCenterY = (Math.random()*height);
    nDegreesOfRotation= (int)(Math.random()*3)-1;
  }
  public void setX(int x){myCenterX = x;}
  public int getX(){return (int)myCenterX;}  
  public void setY(int y){myCenterY = y;}
  public int getY(){return (int)myCenterY;};  
  public void setDirectionX(double x){myDirectionX = x;}
  public double getDirectionX(){return (double)myDirectionX;}  
  public void setDirectionY(double y){myDirectionY = y;}   
  public double getDirectionY(){return (double)myDirectionY;};  
  public void setPointDirection(int degrees){myPointDirection = degrees;}  
  public double getPointDirection(){return (int)myPointDirection;} 

  public void move() {
     myCenterX += myDirectionX;
     myCenterY += myDirectionY;
     if(myCenterX >width){     
      myCenterX = 0;    
    }    
    else if (myCenterX<0){     
      myCenterX = width;    
    }    
    if(myCenterY >height){    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0){     
      myCenterY = height;    
    }   
  }   
}


abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x);  
  abstract public int getX();   
  abstract public void setY(int y);   
  abstract public int getY();   
  abstract public void setDirectionX(double x);   
  abstract public double getDirectionX();   
  abstract public void setDirectionY(double y);   
  abstract public double getDirectionY();   
  abstract public void setPointDirection(int degrees);   
  abstract public double getPointDirection(); 

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   
  public void rotate (int nDegreesOfRotation)   {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
  }   
  public void move ()  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;  
    myDirectionX = myDirectionX/gravity;
    myDirectionY = myDirectionY/gravity;   

    //wrap around screen    
    if(myCenterX >width){     
      myCenterX = 0;    
    }    
    else if (myCenterX<0){     
      myCenterX = width;    
    }    
    if(myCenterY >height){    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0){     
      myCenterY = height;    
    }   
  }   
  public void show ()  {               
    stroke(255);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
  }   
} 

class Star{
  private int myX, myY;
  public Star(){
    myX = (int)(Math.random()*1000);
    myY = (int)(Math.random()*700);
  }
  public void show(){
    fill(255);
    ellipse(myX, myY, 3, 3);
  }
}