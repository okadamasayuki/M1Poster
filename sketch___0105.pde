PImage img_A;
PImage img_B;
PImage img_C;
PImage img_K;
PImage img_X;
PImage [] imgs= new PImage [5];

int random_r;
int random_l;

int dot_radius=15;
int dot_x;
int dot_y;

void setup() {
  fullScreen();
  img_A = loadImage("A.png");  // 140 × 145
  img_B = loadImage("B.png");
  img_C = loadImage("C.png");
  img_K = loadImage("K.png");
  img_X = loadImage("X.png");
  
  imgs[0]=img_A;
  imgs[1]=img_B;
  imgs[2]=img_C;
  imgs[3]=img_K;
  imgs[4]=img_X;
  
  random_r = int(random(5));
  random_l = int(random(5));
  print(random_r);
  println(random_l);
  
  dot_x = int(random(dot_radius,width/2-dot_radius));
  dot_y = int(random(dot_radius,height-dot_radius));
}
 
void draw() {
  background(255);
  image(imgs[random_r], 3*width/4-145/2, height/2-140/2);
  image(imgs[random_l], width/4-145/2, height/2-140/2);
  ellipse(dot_x,dot_y,dot_radius,dot_radius);
  fill(255,0,0);
  noStroke();
  
  if( millis()%250 == 0 ){ // 1/1000
    random_r = int(random(5));
    random_l = int(random(5));
      print(random_r);
      println(random_l);
  }
  
}
