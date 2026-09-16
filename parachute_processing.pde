import processing.sound.*;
// parachute-processing
// ferrondw

// feedback playtest - game was te moeilijk, en moest meer verticaal dan horizontaal lastig zijn
// ik heb de cluster variables aangepast om dit te bereiken

int ticksToNextSpawn = 80; // how many frames it awaits before spawning a new cluster (running at 20fps)


// internals, do not touch!
PVector _screenSize = new PVector(540, 350);
Player player;
ArrayList<Cluster> clusters = new ArrayList<Cluster>();
SoundFile deathSound;
SoundFile damnSound;
int score = 0;

PFont impact;

private int _timer;

void setup(){
 size(540, 350);
 fill(0);
 textAlign(CENTER);
 impact = createFont("impact.ttf", 32);
 deathSound = new SoundFile(this, "die.mp3");
 damnSound = new SoundFile(this, "damn.mp3");
 player = new Player();
}

// timer ticking, cluster updating/rendering, and player input/rendering
void draw(){
  fill(100, 110, 105);
  background(120, 130, 125);
  textFont(impact, 130);
  text(score, _screenSize.x / 2, _screenSize.y / 2);
  fill(0);
  textFont(impact, 12);
  fill(0);
 _timer++;
 if(_timer % ticksToNextSpawn == 0){
   clusters.add(new Cluster());
 }
   
 for(int i = 0; i < clusters.size(); i++){
  var cluster = clusters.get(i);
  cluster.update();
  cluster.render();
 }
 
 player.update();
 player.render();
}
