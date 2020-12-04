JSONArray json;
DNA[] population;

void setup() {
  json = loadJSONArray("data.json");

  size(640, 360);
 
  population = new DNA[1];
  for (int i = 0; i < population.length; i++) {
    population[i] = new DNA();
  }
}
