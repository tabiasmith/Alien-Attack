class Sprite {
// Define our class variables 

 float x=0;
 float y=0;
 float xoffset = 0;
 float yoffset = 0;
 int bodysize = 35; //set the size of the sprites
 
  // Define our constructors
  
 Sprite(){ // this contructor makes the sprite location the middle of the screen
   x= width/2;
   y = height/2;
 }
   
Sprite(float xinit, float yinit) { // this determines the x and y
  x = xinit;
  y = yinit;
}

  // Draw the sprite to the screen
void display() {
  if (frameCount <=10 && frameCount >=0){ // for the first 10 frames (we set framerate to 30)
   draw_sprite (x, y); // draw the first sprite face
   
  }else if (frameCount <=20 && frameCount >10){ // for the next 10 frames (11-20)
  draw_sprite2(x, y);//draw the second sprite face
  
  }else if (frameCount <=30 && frameCount >20){//for the next 10 frames (21-30)
  draw_sprite3(x,y);
  
  } else {
    frameCount = 0; //set the framecount back to zero
  }
}

  // Update the sprite's position
void update() {
  xoffset = (random(-20, 20) + xoffset)/2 ;
  yoffset = (random(-20, 20) + yoffset)/2;
    
    // Check on the x coordinate    
    if((x+xoffset)<0){
      x = 0;
      
    }else if ((x + xoffset) > width) { 
      x = width;
      
    }else{
      x += xoffset;
      
    }
    // Check on the y coordinate
    if((y+yoffset)<0){
      y = 0;
      
     } else if ((y + yoffset) > height) {   
     y = height;
     
     }else{
     y += yoffset;
     }
  }  
 
 //check the bounding box area of the sprite
 boolean checkBoundingBox(float mx, float my) {
   
   //i am using the formula for the sprite's space helment size (bodysize*1.8) for the length of the boundingbox
    if (((mx < (x + (bodysize*1.8)/2)) && (mx > (x - (bodysize*1.8)/2))) &&
   
    //I am using the formula for leg length and the helment size (i added .1 to account for the torso bc i didnt know how to calculate sprite's length exactly)
       ((my < (y + (bodysize*1.9 +(bodysize/2)/2))) && (my > (y - (bodysize*1.9 +(bodysize/2)/2))))) {
         
         return  true;
       } else { 
         return  false;
     }
 } 
 //move the sprite to a new random location
 void respawn(){
     x = random(0,width);
     y =random(0,height);
     
 }
 
 
 // Getter functions
 float getx() { 
   return x;
  }
 float gety() { 
   return y;
  }
  
  
  //Different Sprites
  
  
  //first face smiling
  void draw_sprite (float x, float y) {   
    // space helmet
    stroke(250,250,250); 
    fill(250,250,250);
    ellipse(x,y,bodysize*1.8,bodysize*1.8);
    
    //body
    stroke(255,105,180);//right leg
    fill(255,105,180);
    rect(x+bodysize/10, y+bodysize, bodysize/3, bodysize/2); 
    
    rect(x+bodysize/5, y+bodysize/1.35, bodysize/2, bodysize/3);//right arm
       
    stroke(255,192,203);//rest of body light pink
    fill(255,192,203); 
    ellipse(x,y,bodysize,bodysize); //head
    rect(x-(bodysize/2), y, bodysize, bodysize-bodysize/4); //torso
    arc(x, y+bodysize-bodysize/4, bodysize, bodysize, 0,PI);//bottom
    
    rect(x-bodysize/2, y+bodysize, bodysize/3, bodysize/2); //left leg
    rect(x-bodysize/1.5, y+bodysize/1.35, bodysize/2, bodysize/3);//left arm
  
    //eye
   stroke(255,255,255); 
   fill(255,255,255);
    ellipse(x, y, bodysize/2,bodysize/2); // eye whites
    fill(0);
    ellipse(x,y,bodysize/4,bodysize/4);//iris
    
    fill(255,105,180);// eye lid
    stroke(255,105,180); 
    arc(x, y+5, bodysize/2,bodysize/2, 0,PI);
    
    //mouth
    stroke(0);
    fill(0); 
    arc(x, y+bodysize/2, bodysize/4, bodysize/4, 0, PI+QUARTER_PI, OPEN); 
    
    //helmet line
    stroke(250,250,250); 
    line(x-(bodysize/2), y+bodysize/1.35, x+bodysize/2, y+bodysize/1.35);    
          
  }
  
  //second face surpised
  void draw_sprite2 (float x, float y) {   
    // space helmet
    stroke(250,250,250); 
    fill(250,250,250);
    ellipse(x,y,bodysize*1.8,bodysize*1.8);
    
    //Body
    
    stroke(255,105,180);//right leg
    fill(255,105,180);
    rect(x+bodysize/10, y+bodysize, bodysize/3, bodysize/2); 
    
    rect(x+bodysize/5, y+bodysize/1.35, bodysize/2, bodysize/3);//right arm
       
    stroke(255,192,203);//rest of body light pink
    fill(255,192,203); 
    ellipse(x,y,bodysize,bodysize); //head
    rect(x-(bodysize/2), y, bodysize, bodysize-bodysize/4); //torso
    arc(x, y+bodysize-bodysize/4, bodysize, bodysize, 0,PI);//bottom
    
    rect(x-bodysize/2, y+bodysize, bodysize/3, bodysize/2); //left leg
    rect(x-bodysize/1.5, y+bodysize/1.35, bodysize/2, bodysize/3);//left arm
  
    //eye
   stroke(255,255,255); 
   fill(255,255,255);
    ellipse(x, y, bodysize/2,bodysize/2); // eye whites
    fill(0);
    ellipse(x,y,bodysize/4,bodysize/4);//iris
    
    //mouth
    stroke(0);
    fill(0); 
    ellipse(x, y+bodysize/2, 7,7); 
    
    //helmet line
    stroke(250,250,250); 
    line(x-(bodysize/2), y+bodysize/1.35, x+bodysize/2, y+bodysize/1.35);    
          
  }
  
  //third face 
  void draw_sprite3 (float x, float y) {   
    // space helmet
    stroke(250,250,250); 
    fill(250,250,250);
    ellipse(x,y,bodysize*1.8,bodysize*1.8);
    
    //body
    stroke(255,105,180);//right leg
    fill(255,105,180);
    rect(x+bodysize/10, y+bodysize, bodysize/3, bodysize/2); 
    
    rect(x+bodysize/5, y+bodysize/1.35, bodysize/2, bodysize/3);//right arm
       
    stroke(255,192,203);//rest of body light pink
    fill(255,192,203); 
    ellipse(x,y,bodysize,bodysize); //head
    rect(x-(bodysize/2), y, bodysize, bodysize-bodysize/4); //torso
    arc(x, y+bodysize-bodysize/4, bodysize, bodysize, 0,PI);//bottom
    
    rect(x-bodysize/2, y+bodysize, bodysize/3, bodysize/2); //left leg
    rect(x-bodysize/1.5, y+bodysize/1.35, bodysize/2, bodysize/3);//left arm
  
    //eye
   stroke(255,255,255); 
   fill(255,255,255);
    ellipse(x, y, bodysize/2,bodysize/2); // eye whites
    fill(0);
    ellipse(x,y,bodysize/4,bodysize/4);//iris
    
    fill(255,105,180);// eye lid
    stroke(255,105,180); 
    arc(x, y+5, bodysize/2,bodysize/2, 0,PI);
    
    //mouth
    stroke(0);
    fill(0); 
    ellipse(x, y+bodysize/2, 10,2); 
    
    //helmet line
    stroke(250,250,250); 
    line(x-(bodysize/2), y+bodysize/1.35, x+bodysize/2, y+bodysize/1.35);    
          
  }
}