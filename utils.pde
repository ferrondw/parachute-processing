// render a rect using the same logic as a circle, giving the center position instead of the top-left corner position
void centeredRect(float centerX, float centerY, float scale){
  rect(centerX - (scale * 0.5f), centerY - (scale * 0.5f), scale, scale);
}

// randomly returns -1 or 1
int randomNegate(){
 return (floor(random(2)) * 2 - 1); 
}
