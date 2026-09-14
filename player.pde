class Player{
  int movementSpeed = 10;
  float position = int(_screenSize.x) / 2;
  
  void update(){    
    var dist = mouseX - position;
    var playerSpeed = dist / 10f;
    position += playerSpeed;
  }
  
  void render(){
    centeredRect(position, _screenSize.y - 50, 40);
  }
}
