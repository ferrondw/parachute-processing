class Cluster{
  
  // cluster settings
 int objectSize = 30; // width of a single block in pixels
 int spawnPadding = 60; // padding from the left/right of the screen where clusters cannot spawn
 PVector velocityXMinMax = new PVector(4, 10); // min and max of the velocity's X axis, can be randomly negated
 PVector velocityYMinMax = new PVector(2, 4); // min and max of the velocity's Y axis or its 'gravity'
 float bobbingSpeed = 0.2f; // how fast the object should bob using a sine wave
 float bobbingSizeMultiplier = 4; // how much to multiply the output of the sine wave to make the bobbing bigger/smaller
 
 
 
 private int _timer;
 private float _scale;
 private PVector _position = new PVector();
 private PVector _velocity = new PVector();
 
 public Cluster(){
   _position = new PVector(random(spawnPadding, _screenSize.x - spawnPadding), -objectSize * 0.5f);
   _velocity = new PVector(random(velocityXMinMax.x, velocityXMinMax.y) * randomNegate(), random(velocityYMinMax.x, velocityYMinMax.y));
 }
 
 // update internal states for the timer, position, and flips the cluster when touching an edge
 void update(){
   _timer++;
   _scale = calculateScale();
   
   _position = calculatePosition();
   
   if(touchingSide()){
    _velocity.x *= -1; 
   }
 }
 
 // exclusively renders the cluster, no other logic is applied or changed here
 void render(){
   circle(_position.x - _scale, _position.y, _scale);
   centeredRect(_position.x, _position.y, _scale);
   circle(_position.x + _scale, _position.y, _scale);
 }
 
 // called when the cluster is going to be destroyed
 void onDestroy(){
   println("ik ben onderaan");
 }
 
 PVector calculatePosition(){
   return new PVector(calculateX(), calculateY());
 }
 
 int calculateX(){
   return int(_position.x + _velocity.x);
 }
 
 int calculateY(){
   return int(_position.y + _velocity.y);
 }
 
 int calculateScale(){
  return int(objectSize + sin(_timer * bobbingSpeed) * bobbingSizeMultiplier);
 }
 
 boolean touchingSide(){
   return _position.x < _scale * 1.5f || _position.x > _screenSize.x - _scale * 1.5f;
 }
 
 boolean touchingBottom(){
   return _position.y > _screenSize.y + (objectSize * 0.5f);
 }
}
