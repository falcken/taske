JSONArray json;
DNA[] population;
float mutationRate = 0.005;
ArrayList<DNA> matingPool;
int mutations = 0;
int iteration = 0;
PFont f;

float maxFitness = 0;
int bestBag = 0;

void setup() {
  json = loadJSONArray("data.json");

  size(640, 360);
  f = createFont("Courier", 32, true);

  population = new DNA[1000];
  for (int i = 0; i < population.length; i++) {
    population[i] = new DNA();
    population[i].fitness();
  }
}

void draw() {
  for (int i = 0; i < population.length; i++) {
    population[i].fitness();
    
    if (population[i].fitness > maxFitness) {
      maxFitness = population[i].fitness;
      bestBag = i;
      
      println(maxFitness, population[i].value, population[i].weight, mutations, iteration);
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
    iteration++;
  }
}

void displayInfo() {
  background(255);
  // Display current status of populationation
  int answer = population[bestBag].fitness;
  textFont(f);
  textAlign(LEFT);
  fill(0);
  
  
  textSize(24);
  text("Best phrase:",20,30);
  textSize(40);
  text(answer, 20, 100);

  textSize(18);
  text("total generations:     " + population.getGenerations(), 20, 160);
  text("average fitness:       " + nf(population.getAverageFitness(), 0, 2), 20, 180);
  text("total population: " + popmax, 20, 200);
  text("mutation rate:         " + int(mutationRate * 100) + "%", 20, 220);
 
  textSize(10);
  text("All phrases:\n" + population.allPhrases(), 500, 10);
}
