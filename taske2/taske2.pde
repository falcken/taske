JSONArray json;
DNA[] population;
float mutationRate = 0.01;
ArrayList<DNA> matingPool;

float maxFitness = 0;

void setup() {
  json = loadJSONArray("data.json");

  size(640, 360);
 
  population = new DNA[1];
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
      
      println(maxFitness, population[i].value, population[i].weight);
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
}
