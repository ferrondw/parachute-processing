class Cluster{
 PVector position = new PVector();
 int objectSize = 30;
 PVector direction = new PVector(6, 2);
 int spawnPadding = 60;
 
 private int _amount;
 private int _timer;
 private float _scale;
 
 public Cluster(int amount){
   _amount = amount;
   position = new PVector(random(spawnPadding, random(screenSize.x) - spawnPadding), 0);
   direction = new PVector(random(-5, 5), 0);
 }
 
 void update(){
   _timer++;
   _scale = objectSize + sin(_timer * 0.05f) * 4;
   direction.y += 0.05f;
   
   position.x += direction.x;
   position.y += direction.y;
   
   if(position.x < _scale * 1.5f || position.x > screenSize.x - _scale * 1.5f){
    direction.x *= -1; 
   }
   
   if(position.y > screenSize.y + _scale){
     println("ik ben onderaan");
   }
   
   render();
 }
 
 void render(){
   circle(position.x - _scale, position.y, _scale);
   centeredRect(position.x, position.y, _scale);
   circle(position.x + _scale, position.y, _scale);
 }
 
 void destroy(){
   
 }
}
