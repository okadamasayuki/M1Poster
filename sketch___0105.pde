PImage img_A;
PImage img_B;
PImage img_C;
PImage img_K;
PImage img_X;
PImage img_black;
PImage [] imgs= new PImage [6];

int random_r;
int random_l;

int dot_radius=15;
int dot_x;
int dot_y;

int i=0;

int [] dot_color = {0,0,0,255};
int dot_color_index;

int start_time;
int initial_nothing_display_sec=2;

PrintWriter file;

int [] A_K= new int [2];
int AKcounter=0;

void setup() {
  file = createWriter(month()+"_"+day()+"_"+hour()+"_"+minute()+"_"+second());
  fullScreen();
  img_A = loadImage("A.png");  // 140 × 145
  img_B = loadImage("B.png");
  img_C = loadImage("C.png");
  img_K = loadImage("K.png");
  img_X = loadImage("X.png");
  img_black = loadImage("black.png");
  
  imgs[0]=img_A;
  imgs[1]=img_B;
  imgs[2]=img_C;
  imgs[3]=img_K;
  imgs[4]=img_X;
  imgs[5]=img_black;
  
  random_r = int(random(5));
  random_l = int(random(5));
  file.println(1+", "+random_l+","+random_r);
  print(random_r);
  println(random_l);
  A_K[0]=random_r;
  
  dot_color_index = int(random(4));
  dot_x = int(random(dot_radius,width/2-dot_radius));
  dot_y = int(random(dot_radius,height-dot_radius));
  start_time=millis();
}
 
void draw() {
  background(0);
  if( millis() > start_time+initial_nothing_display_sec*1000 ){
      image(imgs[random_r], 3*width/4-145/2, height/2-140/2);
      image(imgs[random_l], width/4-145/2, height/2-140/2);
      ellipse(dot_x,dot_y,dot_radius,dot_radius);
      fill(dot_color[dot_color_index],0,0);
      noStroke();
      
      println(millis());
      
      
      if( millis() - (start_time+initial_nothing_display_sec*1000) > i*280+250){ // 1/1000
        random_r=5;
        random_l=5;
        dot_color_index=0;
        if( millis() - (start_time+initial_nothing_display_sec*1000) > (i+1)*280 ){
            random_r = int(random(5));
            random_l = int(random(5));
            A_K[1]=random_r;
            if(A_K[0]==0 && A_K[1]==3){
              AKcounter++;
            }
            A_K[0]=random_r;
            file.println(1+i+", "+random_l+","+random_r);
              print(random_r);
              println(random_l);
            dot_color_index = int(random(4));
            dot_x = int(random(dot_radius,width/2-dot_radius));
            dot_y = int(random(dot_radius,height-dot_radius));
            i=i+1;
            if(i==100){
              file.println();
              file.println("A to K count: "+AKcounter);
              file.flush();
              file.close();
              exit();
            }
        }
        //println("==========================");
      }
  }
  
}
