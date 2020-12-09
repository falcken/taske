class AddItem {
  float posX, posY, b, h, posX2, b2, h2, sc;

  String name, w, v = "";

  boolean show, show2;

  color c1, c2, c3, c4, c5, c6, c7;

  AddItem() {

    posX = width-50;
    posY = 20;
    b = 30;
    h = 30;
    posX2 = width-250;
    b2 = width;
    h2 = height - 50;
    sc = 15;

    show = true;
    show2= false;

    c1 = 255;
    c2 = 255;
    c3 = 255;
    c4 = 255;
    c5 = 255;
    c6 = 255;
    c7 = 255;
  }

  void display() {
  stroke(0);
    if (show) {
      fill(c1);
      rect(posX, posY, b, h);
      pushMatrix();
      translate(posX, posY);
      line(5, 8, 25, 8);
      line(5, 15, 25, 15);
      line(5, 22, 25, 22);
      popMatrix();
    }
    if (show2) {
      fill(c2);
      rect(posX2, posY, b2, h2);
      pushMatrix();
      fill(0);
      translate(posX2+((b2-posX2)/2), posY+20);
      textAlign(CENTER);
      textSize(14);
      text("Tilføj genstand til taske!", -10, 0);
      popMatrix();
      fill(c3);
      rect(posX+28, posY+5, sc, sc);
      line(posX+28, posY+5, posX+28+sc, posY+5+sc);
      line(posX+28, posY+5+sc, posX+28+sc, posY+5);
      line(posX2, posY+25, b2, posY+25);
      fill(c4);
      rect(posX2+10, posY+75, 230, 25);
      fill(c5);
      rect(posX2+10, posY+150, 230, 25);
      fill(c6);
      rect(posX2+10, posY+225, 230, 25);
      fill(c7);
      rect(posX2+75, posY+265, 100, 35);
    }
  }

  void knap() {
    if (mouseX > posX && mouseX < posX+b && mouseY > posY && mouseY < posY+h) {
      c1 = 175;
    } else {
      c1 = 255;
    }
    if (mouseX > posX+28 && mouseX < posX+28+sc && mouseY > posY+5 && mouseY < posY+5+sc) {
      c3 = 175;
    } else {
      c3 = 255;
    }
    if (mousePressed) {
      println(mouseX, mouseY);
      if (show) {
        if (mouseX > posX && mouseX < posX+b && mouseY > posY && mouseY < posY+h) {
          println("CLICK");
          show = false;
          show2 = true;
        }
      }
      if (show2) {
        if (mouseX > posX+28 && mouseX < posX+28+sc && mouseY > posY+5 && mouseY < posY+5+sc) {
          show = true;
          show2 = false;
        }
      }
    }
  }
}
