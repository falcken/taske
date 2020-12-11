class UI {
  float posX, posY, max, min;
  float current;
  float[] buffer = new float[175];  
  
  UI(float posX, float posY, float max, float min) {
    this.posX = posX;
    this.posY = posY;
    this.max = max;
    this.min = min;
    
    for (int i = 0; i < buffer.length; i++) {
      buffer[i] = 0;
    }
  }
  
  void showGraph() {
    fill(240, 240, 240);
    rect(posX, posY, 175, 100);
    float mappedBest = map(maxFitness, 0, 0.67, 0, 100);
    //println(bestValue, mappedBest);
    if (!bestFound) {
      for (int i = 0; i < buffer.length; i++) {
        if (i < buffer.length-1) {
          buffer[i] = buffer[i+1];
        } else {
          buffer[i] = mappedBest;
        }
      }
    }
    
    for (int i = 0; i < buffer.length; i++) {
      fill(255, 0, 0);
      noStroke();
      rect(posX+i, posY-buffer[i]+100, 1, 1);
    }
  }
}
