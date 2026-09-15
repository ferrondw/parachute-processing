// les4: functions
// ferrondw

// feedback practicumopdracht 4 - makkelijk aan te passen (eliza voets)

int ticksToNextSpawn = 50; // how many frames it awaits before spawning a new cluster (running at 20fps)


// internals, do not touch!
PVector _screenSize = new PVector(540, 350);
Player player = new Player();
ArrayList<Cluster> clusters = new ArrayList<Cluster>();

private int _timer;

void setup(){
 size(540, 350);
 textAlign(CENTER);
 fill(0);
}

// timer ticking, cluster updating/rendering, and player input/rendering
void draw(){
  fill(0);
 _timer++;
 if(_timer % ticksToNextSpawn == 0){
   clusters.add(new Cluster());
 }
  
 background(120, 130, 125);
 
 for(int i = 0; i < clusters.size(); i++){
  var cluster = clusters.get(i);
  cluster.update();
  cluster.render();
  
  if(cluster.touchingBottom()){
   cluster.onDestroy();
   clusters.remove(cluster);
  }
 }
 
 player.update();
 player.render();
}
