class Player{
  
  int followSmoothing = 6; // how much time it will take in order for the player to get to the cursor position
  int playerScale = 40; // size of the player sprite in pixels
  String sprite = "player.png"; // filename that is loaded as the player sprite
  int distanceFromBottom = 60; // how many pixels the player is from the bottom of the screen in pixels
  
  // internals, do not touch!
  PVector position;
  private PVector _positionLastFrame;
  private float _positionDelta;
  private PImage _playerImage;
  
  public Player(){
   _playerImage = loadImage(sprite);
   position = new PVector(_screenSize.x / 2, _screenSize.y - distanceFromBottom);
   _positionLastFrame = new PVector(-1, -1);
  }
  
  void update(){    
    var travelDistance = (mouseX - position.x) / followSmoothing;
    position.x += travelDistance;
    _positionDelta = position.x - _positionLastFrame.x;
    _positionLastFrame.x = position.x;
  }
  
  void render(){
    text(_positionDelta, position.x, _screenSize.y - 80);
    fill(abs(_positionDelta) * 40);
    centeredImage(_playerImage, position.x, position.y, playerScale);
  }
}
