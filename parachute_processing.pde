// shapes and cluster scaling
// ferron_dewitte_practicum2

float baseX = random(100, 300);
float baseY = random(100, 300);

int bobbingScale = 30;
float bobbingSpeed = random(0.05f, 0.2f);

float objectScale = random(15, 50);

private int _time = 0;

void setup(){
 size(500, 400);
 background(0, 20, 40);
}

void draw(){
 _time++;
 float scaleSine = scaledSine(10, bobbingSpeed);
 float scale = objectScale + scaleSine;
 float bobbingOffsetY = scaledSine(bobbingScale, bobbingSpeed);
 background(0, 20, 40);
 
 
 fill(70, 70, 250);
 circle(baseX - scaleSine, baseY + bobbingOffsetY, scale);
 centeredRect(baseX + objectScale, baseY + bobbingOffsetY, scale);
 circle(baseX + objectScale*2 + scaleSine, baseY + bobbingOffsetY, scale);
}

float scaledSine(float scale, float speed){
  return scale * sin(_time * speed);
}

float scaledCosine(float scale, float speed){
  return scale * cos(_time * speed);
}

void centeredRect(float centerX, float centerY, float scale){
  rect(centerX - (scale * 0.5f), centerY - (scale * 0.5f), scale, scale);
}
