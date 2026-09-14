// conditions
// ferron_dewitte_practicum3

PVector screenSize = new PVector(540, 350);

Player player = new Player();
ArrayList<Cluster> clusters = new ArrayList<Cluster>();

private int _timer;

void setup(){
 size(540, 350);
 fill(0);
}

void draw(){
 _timer++;
 if(_timer % 50 == 0){
   clusters.add(new Cluster(0));
 }
  
 background(120, 130, 125);
 
 for(int i = 0; i < clusters.size(); i++){
  clusters.get(i).update(); 
 }
 
 player.update();
}
