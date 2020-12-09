JSONArray json;
DNA[] population;
AddItem additem;
float mutationRate = 0.01;
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

int bestBag = 0;
int startTime = 0;

boolean stop = false;
boolean possibleBest = false;

void setup() {
  json = loadJSONArray("data.json");
  
  size(640, 360);
  f = createFont("Courier", 32, true);


  population = new DNA[100];

  for (int i = 0; i < population.length; i++) {
    population[i] = new DNA();
    population[i].fitness();
  }
  additem = new AddItem();
  startTime = millis();
}

void draw() {
 
  
  if (!stop) {
    for (int i = 0; i < population.length; i++) {
      population[i].fitness();
      //println(population[i].fitness, population[i].value, population[i].weight);

      if (population[i].fitness > maxFitness) {
        maxFitness = population[i].fitness;
        bestValue = population[i].value;
        bestWeight = population[i].weight;
        bestTime = millis()-startTime;
        bestIteration = iteration;

        bestBag = i;

        //println(maxFitness, population[i].value, population[i].weight, mutations, iteration);
      }

      /*if (iteration > bestIteration + 198) {
        stop = true;
        possibleBest = false;
      }*/

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
    displayInfo();
    ui.showGraph();
  }

   additem.display();
   additem.knap();

}

void displayInfo() {
  background(255);
  // Display current status of populationation
  float answer = maxFitness;
  textFont(f);
  textAlign(LEFT);
  fill(0);


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

  if (possibleBest && !stop) {
    fill(255, 69, 0);
    textSize(24);
    text("Muligt optimal! (bekræfter)", 50, 125);
    fill(0);
  } else if (stop) {
    fill(0, 255, 0);
    textSize(24);
    text("Optimal, efter "+bestIteration+" generationer!", 50, 125);
    fill(0);
  }

  textSize(18);
  text("total generations:     " + iteration + " ("+bestIteration+")", 20, 160);
  text("bedste fitness:        " + answer, 20, 180);
  text("bedste vægt:           " + bestWeight, 20, 200);
  text("mutation rate:         " + (mutationRate * 100) + "%", 20, 220);
}
