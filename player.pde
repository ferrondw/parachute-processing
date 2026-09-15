class Player{
  
  int followSmoothing = 10; // how much time it will take in order for the player to get to the cursor position
  
  
  // internals, do not touch!
  private float _position = 0;
  private float _positionLastFrame = 0;
  private float _positionDelta;
  
  void update(){    
    var travelDistance = (mouseX - _position) / followSmoothing;
    _position += travelDistance;
    _positionDelta = _position - _positionLastFrame;
    _positionLastFrame = _position;
  }
  
  void render(){
    fill(_positionDelta > 0f ? 0 : 255);
    centeredRect(_position, _screenSize.y - 50, 40);
    text(_positionDelta, _position, _screenSize.y - 80);
  }
}
