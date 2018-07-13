//Tabia Smith

//Set up the strings
String screenscore;
String youwin;
String youlose;
String timer;
String timesup;

//Declare font
PFont AppleSDGothicNeo;

int score =0;
int timeleft = 15;
int randomadd = 0;
int count = 20;
 
Sprite sArray[];
Sprite Array1[];
Sprite Array2[];


Sprite addsprite;

boolean winner = false;
boolean loser = false;
boolean refresh = false;
boolean respawn = false;

void setup() {
  

size(600, 600);
background(0);  
smooth();
frameRate(30); 
//Create three instances of the sprites

float r, g, b, a;

//this count is he number of sprites originally drawn

int stars = 50;

//add to the list of sprites, the number of sprites in the list is the count
 sArray = new Sprite[count];
 addsprite = new Sprite(random(0,width), random (0, height));
 
//iterate over the array of sprites
 for (int i = 0; i<count; i++) {
   //for each sprie in the array, add it ad a random location
   sArray[i] = new Sprite(random(0,width), random(0, height));
  
    r = random(0, 255);
    g = random(0, 255);
    b = random(0, 255);
    a = 0;

    
  }
  
 AppleSDGothicNeo = loadFont("AppleSDGothicNeo-Heavy-20.vlw");
 
 textFont(AppleSDGothicNeo, 20);
 }
 
 
 void draw() {
   
 background(0);
 
 timer= "Time: " + timeleft;
 fill(199,21,133);
 text(timer, 500, 560);

// at 30 fps,  at each second subtract 1 from the time
 if(frameCount% 30 ==0){
   timeleft -=1;
   }
   
 if (timeleft ==-1 && sArray.length >=1 ) {
   timeleft = 0;
   timesup = "Times up! You missed some aliens! Press 'r' to play again!";
   fill (199, 21, 133);
   text(timesup, 20, 300);
   textAlign(CENTER); 
   noLoop();
 }
 
 screenscore = "Score: " + score;
 fill(199,21,133);
 text(screenscore, 10, 560);
 

 
for (int i = 0; i < sArray.length; i++) {
 // Update each sprites's position with dot notation
    
   sArray[i].update();
 // Draw each sprite on the screen
   sArray[i].display();
   }


  
   
 //YOU WIN
 if (winner) {
   youwin = "YOU WIN! Press 'r' to play again!";
   fill(random(0, 255), 21, 133);
   text(youwin, 130, 300);
   noLoop();
   }
   
  if (sArray.length ==0 ) {
      winner = true;         
   }
   
   //YOU LOSE
  if(loser) {
    youlose = "YOU LOSE:(";
    fill (199, 21, 133);
    text(youlose, width/2, height/2);
    textAlign(CENTER);
    noLoop();

   }
  if(sArray.length >= 50) {
    loser = true;
   }
   
   
 }

   
   
 

void mousePressed() {
  
  for (int i = 0; i < sArray.length; i++) {  
  
  if (sArray[i].checkBoundingBox(mouseX, mouseY) == true) { // if the user clicks within the area of the first sprite
  score+=10; // add 10 points to the total score
  println("Yay! you clicked the sprite located at", sArray[i].getx(),"and", sArray[i].gety(),".", "Your total score is",score);
  
  //sArray = (Sprite[]) concat ((subset (sArray,0,i), subset(sArray, i+1, sArray.length - (i+1))));
  Sprite[] Array1= (Sprite[]) subset (sArray,0,i);
  
  Sprite[] Array2 = (Sprite[]) subset(sArray, i+1, sArray.length - (i+1));
  
  sArray = (Sprite[]) concat(Array1, Array2);

  }else{ 
    println("You missed! try again"); //if the user misses the sprite print this
  }
}
}

void keyPressed(){
  if (key == 'r'){
   refresh = true;
   
   if (refresh) {
     timeleft = 15;
     score = 0;
     setup();
     loop();
   }
  }
}
