JSONArray json;
DNA[] population;
DNA child;
AddItem additem;
float mutationRate = 0.005;
ArrayList<DNA> matingPool;
int mutations = 0;
int iteration = 0;
PFont f;
UI ui = new UI(20, 240, 0, 1200);

float maxFitness = 0;
float bestValue = 0;
float bestWeight = 0;
int bestTime;
int bestIteration;
int populationsize;
String everything = "";

int bestBag = 0;
int startTime = 0;
int counter = 0;

boolean stop = false;
boolean possibleBest = false;
boolean restart = false;
boolean bestFound = false;

void setup() {
  json = loadJSONArray("data.json");

  size(640, 360);
  f = createFont("Courier", 32, true);

  populationsize = 1000;
  population = new DNA[populationsize];

  for (int i = 0; i < population.length; i++) {
    population[i] = new DNA();
    population[i].fitness();
  }
  additem = new AddItem();
  startTime = millis();
}

void draw() {
  if (restart) {
    additemrestart();
  }
if(!restart){
  if (!stop) {
    displayInfo();
    additem.display();
    additem.knap();
    ui.showGraph();

    for (int i = 0; i < population.length; i++) {
      population[i].fitness();
      //println(population[i].fitness, population[i].value, population[i].weight);

      if (population[i].fitness > maxFitness) {
        maxFitness = population[i].fitness;
        bestValue = population[i].value;
        bestWeight = population[i].weight;
        bestTime = millis()-startTime;
        bestIteration = iteration;

        for (int u = 0; u < 24; u++) {
          if (population[i].genes[u] == 1) {
            everything += population[i].possibleItems.get(u).name + "\n";
          }
        }

        bestBag = i;

        //println(maxFitness, population[i].value, population[i].weight, mutations, iteration);
      }

        if (iteration > bestIteration + 198) {
          bestFound = true;
          possibleBest = false;
        }

        if (iteration > bestIteration + 48) {
          possibleBest = true;
        } else {
          possibleBest = false;
        }
      }


      ArrayList<DNA> matingPool = new ArrayList<DNA>();

      for (int i = 0; i < population.length; i++) {
        int n = int(population[i].fitness * 100);
        for (int j = 0; j < n; j++) {
          matingPool.add(population[i]);
        }
      }

      for (int i = 0; i < population.length; i++) {
        int a = int(random(matingPool.size()));
        int b = int(random(matingPool.size()));

        DNA partnerA = matingPool.get(a);
        DNA partnerB = matingPool.get(b);

        DNA child = partnerA.crossover(partnerB);

        child.mutate(mutationRate);

        population[i] = child;
      }

      iteration++;
    }
  }
}
void keyPressed() {
  println("key: " + key + " keyCode: "+keyCode);
  if (additem.typingname) {
    if (key != DELETE && key != BACKSPACE && key != RETURN && key != ENTER && key != TAB && key != 32 && keyCode != 16) {
      if (additem.name.length() < 24) {
        additem.name = additem.name + key;
      }
    }
    println(additem.name);
    if (additem.name != null) {
      if (key == DELETE || key == BACKSPACE) {
        additem.name = additem.name.substring(0, max(0, additem.name.length()-1));
      }
    }
  }
  if (additem.typingv) {
    if (key != DELETE && key != BACKSPACE && key != RETURN && key != ENTER && key != TAB && key != 32 && keyCode != 16) {
      if (additem.v.length() < 2) {
        if (key == '1' || key == '2' || key == '3' || key == '4' || key == '5' || key == '6' || key == '7' || key == '8' || key == '9' || key == '0') {
          additem.v = additem.v + key;
        }
      }
    }
    println(additem.v);
    if (additem.v != null) {
      if (key == DELETE || key == BACKSPACE) {
        additem.v = additem.v.substring(0, max(0, additem.v.length()-1));
      }
    }
  }
  if (additem.typingw) {
    if (key != DELETE && key != BACKSPACE && key != RETURN && key != ENTER && key != TAB && key != 32 && keyCode != 16) {
      if (additem.w.length() < 3) {
        if (key == '1' || key == '2' || key == '3' || key == '4' || key == '5' || key == '6' || key == '7' || key == '8' || key == '9' || key == '0') {
          additem.w = additem.w + key;
        }
      }
    }
    println(additem.w);
    if (additem.w != null) {
      if (key == DELETE || key == BACKSPACE) {
        additem.w = additem.w.substring(0, max(0, additem.w.length()-1));
      }
    }
  }
}

void displayInfo() {
  background(255);
  // Display current status of populationation
  float answer = maxFitness;
  textFont(f);
  textAlign(LEFT);
  fill(0);
  println(everything);


  textSize(24);
  text("Bedste værdi:", 20, 30);
  textSize(40);
  text(bestValue, 20, 100);

  textSize(24);
  text("Tid:", 350, 30);
  if (stop) {
    fill(0, 255, 0);
  }
  textSize(40);
  text(bestTime+" ms", 350, 100);

  if (possibleBest && !bestFound) {
    fill(255, 69, 0);
    textSize(24);
    text("Muligt optimal! (bekræfter)", 50, 125);
    fill(0);
  } else if (bestFound) {
    fill(0, 255, 0);
    textSize(24);
    text("Optimal, efter "+bestIteration+" generationer!", 50, 125);
    fill(0);
  }

  textSize(18);
  if (bestFound) {
      text("total generations:     " +bestIteration, 20, 160);
  } else {
      text("total generations:     " + iteration + " ("+bestIteration+")", 20, 160);
  }
  text("bedste fitness:        " + answer, 20, 180);
  text("bedste vægt:           " + bestWeight, 20, 200);
  text("mutation rate:         " + (mutationRate * 100) + "%", 20, 220);
}

void additemrestart() {
  population = null;
  population = new DNA[populationsize];
  for (int i = 0; i < population.length; i++) {
    population[i] = new DNA();
    population[i].fitness();
  }
  maxFitness = 0;
  bestValue = 0;
  bestWeight = 0;
  bestBag = 0;
  bestIteration = 0;
  iteration = 0;
  startTime = millis();
  restart = false;
  //println(child.genes);
}
