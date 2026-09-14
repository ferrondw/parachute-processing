// shapes and cluster testing
// ferron_dewitte_practicum1

void setup(){
 size(500, 400);
 background(0, 20, 40);
}

void draw(){
 background(0, 20, 40);
 
 // white squares
 fill(255);
 for(int i = 0; i < 3; i++){
   rect(i * 30, i * 30, 30, 30);
 }
 
 // grey rects
 fill(130);
 rect(50, 250, 30, 30);
 rect(50 + 30, 250, 50, 30);
 
 // dark blue circle-box-circle
 fill(70, 70, 250);
 circle(350, 300, 40);
 rect(350 + (40/2), 300 - (40/2), 40, 40);
 circle(350 + 40 + (2 * 40 / 2), 300, 40);
 // 350 + 40 + (2 * 40 / 2) is base + square offset + (2 circle offsets from center * half of radius)
 
 // cyan circles
 fill(20, 120, 250);
 circle(250, 150, 40);
 float angle1 = 45;
 float angle2 = 170;
 circle(250 + (cos(angle1) * 40), 150 + (sin(angle1) * 40), 40);
 circle(250 + (cos(angle1) * 40) + (cos(angle2) * 40), 150 + (sin(angle1) * 40) + (sin(angle2) * 40), 40);
}
