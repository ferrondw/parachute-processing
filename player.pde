class Player{
  int movementSpeed = 10;
  int position = int(screenSize.x) / 2;
  
  void update(){    
    render();
  }
  
  void render(){
    centeredRect(position, screenSize.y - 50, 40);
  }
}
