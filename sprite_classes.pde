//Tabia Smith

//Set up the string
String screenscore;
String youwin;
String youlose;

//Declare font
PFont AppleSDGothicNeo;

int score =0;

Sprite sArray[];
Sprite Array1[];
Sprite Array2[];


Sprite addsprite;

boolean winner = false;
boolean loser = false;
boolean refresh = false;

void setup() {
size(600, 600);
background(0);  
smooth();
frameRate(30); 
//Create three instances of the sprites

 float r, g, b, a;

//this count is he number of sprites originally drawn
 int count = 20;

//add to the list of sprites, the nummber of sprites in the list is the count
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
 
 screenscore = "Score: " + score;
 fill(199,21,133);
 text(screenscore, 10, 560);
 
  
 
for (int i = 0; i < sArray.length; i++) {
 // Update each sprites's position with dot notation
 

    
   sArray[i].update();
 // Draw each sprite on the screen
   sArray[i].display();
   }

   //println(sArray.length);
  
   
 //YOU WIN
 if (winner) {
   youwin = "YOU WIN!";
   fill (199, 21, 133);
   text(youwin, width/2, height/2);
   textAlign(CENTER);
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
    
//restart the game    
   if (refresh) {
     setup();
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
  }
 }