class DNA {
  int MAX_WEIGHT = 5000;
  int weight = 0;
  float value = 0;
  int[] genes;
  float fitness, maxvalue, v;
  ArrayList<Item> possibleItems = new ArrayList<Item>();
  float maxValue = 0;

  DNA() {
    genes = new int[24];
    for (int i = 0; i < json.size(); i++) {
      genes[i] = int(random(0, 2));
    }
    
    for(int i = 0; i < json.size(); i++) {
      JSONObject item = json.getJSONObject(i);

      String name = item.getString("Navn");
      int weight = parseInt(item.getString("Vaegt"));
      int price = parseInt(item.getString("Kroner"));

      possibleItems.add(new Item(weight, price, name));
    }
  }

  void fitness() {
    value = 0;
    weight = 0;
    
    for(int i = 0; i < genes.length; i++) {
      if (genes[i] == 1) {
        value += possibleItems.get(i).price;
        weight += possibleItems.get(i).weight;
      }
    }
    
    v = value/1432;
    if (weight < 5000){
      fitness = pow(v,2);
    } else {
      fitness = 0;
    }
  }

  void mutate(float mutationRate) {
    for (int i = 0; i < genes.length; i++) {
      if (random(1) < mutationRate) {
        genes[i] = int(random(1));
        mutations++;
      }
    }
  }

    // The function receives one argument (DNA) and returns DNA.
  DNA crossover(DNA partner) {

    DNA child = new DNA();

    int midpoint = int(random(genes.length));

    for (int i = 0; i < genes.length; i++) {
      if (i > midpoint) {
        child.genes[i] = genes[i];
      } else {
        child.genes[i] = partner.genes[i];
      }
    }
    return child;
  }

  String allPhrases() {
    String everything = "";
    
    int displayLimit = min(population.length,50);
    
    
    for (int i = 0; i < displayLimit; i++) {
      everything += fitness + "\n";
    }
    return everything;
   }
}
