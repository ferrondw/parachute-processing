class Cluster{
  
 // cluster settings
 int objectSize = 50; // size (width/height) of a single block in the cluster in pixels
 int spawnPadding = 60; // padding in pixels from the left/right of the screen where clusters cannot spawn
 
 int minHorizontalVelocity = 3; // min and max of the horizontal velocity, can be randomly negated (so it should always remain positive)
 int maxHorizontalVelocity = 8;
 
 int minVerticalVelocity = 4; // min and max of the vertical velocity (should also remain positive, otherwise objects will rise up)
 int maxVerticalVelocity = 7;
 
 float bobbingSpeed = 1f; // how fast the object should bob (scale in and out)
 float bobbingSizeMultiplier = 6f; // how much to multiple the scaling of the bobbing, thus makes the resulting cluster bob in and out more dramatically
 
 float randomPitchOffset = 0.5f; // how much to randomly offset the rate/pitch of the sound effects from 0 to this
 
 String sprite = "bird.png"; // sprite used as the cluster object
 
 
 // internals, do not touch!
 private PVector position = new PVector();
 private int _timer;
 private float _scale;
 private PVector _velocity = new PVector();
 private PImage _clusterImage;
 
 public Cluster(){
   position = new PVector(random(spawnPadding, _screenSize.x - spawnPadding), -objectSize * 0.5f);
   _velocity = new PVector(random(minHorizontalVelocity, maxHorizontalVelocity) * randomNegate(), random(minVerticalVelocity, maxVerticalVelocity));
   _clusterImage = loadImage(sprite);
 }
 
 // update internal states for the timer, position, and flips the cluster when touching an edge
 void update(){
   _timer++;
   _scale = calculateScale();
   
   position = calculatePosition();
   
   if(touchingPlayer()){
     score++;
     damnSound.rate(1 + (random(randomPitchOffset) * randomNegate()));
     damnSound.play();
     onDestroy();
     clusters.remove(this);
   }
   
   if(touchingBottom()){
     deathSound.rate(1 + (random(randomPitchOffset) * randomNegate()));
     deathSound.play();
     onDestroy();
     clusters.remove(this);
   }
   
   if(touchingLeftWall()) _velocity.x = abs(_velocity.x);
   if(touchingRightWall()) _velocity.x = -abs(_velocity.x);
 }
 
 // exclusively renders the cluster, no other logic is applied or changed here
 void render(){
   centeredImage(_clusterImage, position.x, position.y, _scale);
 }
 
 // called when the cluster is going to be destroyed
 void onDestroy(){
   println("ik ben onderaan");
 }
 
 PVector calculatePosition(){
   return new PVector(calculateX(), calculateY());
 }
 
 int calculateX(){
   return int(position.x + _velocity.x);
 }
 
 int calculateY(){
   return int(position.y + _velocity.y);
 }
 
 int calculateScale(){
  return int(objectSize + sin(_timer * bobbingSpeed) * bobbingSizeMultiplier);
 }
 
 boolean touchingLeftWall(){
   return position.x < _scale * 0.5f;
 }
 
 boolean touchingRightWall(){
  return  position.x > _screenSize.x - _scale * 0.5f; 
 }
 
 boolean touchingBottom(){
   return position.y > _screenSize.y + (objectSize * 0.5f);
 }
 
 boolean touchingPlayer(){
   return abs(position.x - player.position.x) < objectSize / 2 && abs(position.y - player.position.y) < objectSize / 2;
 }
}
