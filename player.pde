class Player{
  int movementSpeed = 10;
  int position = int(_screenSize.x) / 2;
  
  void update(){    
    
  }
  
  void render(){
    centeredRect(position, _screenSize.y - 50, 40);
  }
}
