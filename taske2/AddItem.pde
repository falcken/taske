class AddItem {
  float posX, posY, b, h, posX2, b2, h2, sc;
  
  int n = 0;

  String name="";
  String w = "";
  String v = "";
  String newitemname = "";
  String newitemv = "";
  String newitemw = "";

  boolean show, show2, typingname, typingw, typingv;
  

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
      fill(0);
      text("Navn (maks. 24 tegn)", posX2+10, posY+50, 230, 25);
      fill(c4);
      rect(posX2+10, posY+75, 230, 25);
      fill(0);
      if (name != null) {
        text(name, posX2+10, posY+75, 230, 25);
      }
      fill(0);
      text("Værdi (maks. 99 kr)", posX2+10, posY+125, 230, 25);
      fill(c5);
      rect(posX2+10, posY+150, 230, 25);
      fill(0);
      if (v != null) {
        text(v+" kr", posX2+10, posY+150, 230, 25);
      }
      fill(0);
      text("Vægt (maks. 999 kg)", posX2+10, posY+200, 230, 25);
      fill(c6);
      rect(posX2+10, posY+225, 230, 25);
      fill(0);
      if (w != null) {
        text(w+" kg", posX2+10, posY+225, 230, 25);
      }
      fill(c7);
      rect(posX2+75, posY+265, 100, 35);
      fill(0);
      text("Run", posX2+75, posY+265, 100, 35);
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
    if (!typingname) {
      if (mouseX > posX2+10 && mouseX < posX2+10+230 && mouseY > posY+75 && mouseY < posY+75+25) {
        c4 = 175;
      } else {
        c4 = 255;
      }
    }
    if (!typingv) {
      if (mouseX > posX2+10 && mouseX < posX2+10+230 && mouseY > posY+150 && mouseY < posY+150+25) {
        c5 = 175;
      } else {
        c5 = 255;
      }
    }
    if (!typingw) {
      if (mouseX > posX2+10 && mouseX < posX2+10+230 && mouseY > posY+225 && mouseY < posY+225+25) {
        c6 = 175;
      } else {
        c6 = 255;
      }
    }
    if (mouseX > posX2+75 && mouseX < posX2+75+100 && mouseY > posY+265 && mouseY < posY+265+35) {
      c7 = 175;
    } else {
      c7 = 255;
    }
    if (mousePressed) {
      typingname = false;
      typingv = false;
      typingw = false;
      //println(mouseX, mouseY);
      if (show) {
        if (mouseX > posX && mouseX < posX+b && mouseY > posY && mouseY < posY+h) {
          //println("CLICK");
          show = false;
          show2 = true;
        }
      }
      if (show2) {
        if (mouseX > posX+28 && mouseX < posX+28+sc && mouseY > posY+5 && mouseY < posY+5+sc) {
          show = true;
          show2 = false;
        }
        if (mouseX > posX2+10 && mouseX < posX2+10+230 && mouseY > posY+75 && mouseY < posY+75+25) {
          typingname = true;
        }
        if (mouseX > posX2+10 && mouseX < posX2+10+230 && mouseY > posY+150 && mouseY < posY+150+25) {
          typingv = true;
        }
        if (mouseX > posX2+10 && mouseX < posX2+10+230 && mouseY > posY+225 && mouseY < posY+225+25) {
          typingw = true;
        }
        if (mouseX > posX2+75 && mouseX < posX2+75+100 && mouseY > posY+265 && mouseY < posY+265+35) {
          if(name != "" && v != "" && w != ""){
          newitemname = name;
          name = "";
          newitemv = v;
          v = "";
          newitemw = w;
          w = "";
          show = true;
          show2 = false;
          n++;
          restart = true;
          println("name: "+newitemname+" value: "+newitemv+" weight: "+newitemw);
          }
        }
        if (typingname) {
          c4 = 175;
          c5 = 255;
          c6 = 255;
        }
        if (typingv) {
          c4 = 255;
          c5 = 175;
          c6 = 255;
        }
        if (typingw) {
          c4 = 255;
          c5 = 255;
          c6 = 175;
        }
      }
    }
  }
}
