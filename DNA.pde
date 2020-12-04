class DNA {
  int MAX_WEIGHT = 5000;
  int weight = 0;
  int value = 0;
  ArrayList<Item> genes = new ArrayList<Item>();
  ArrayList<Item> possibleItems = new ArrayList<Item>();
  ArrayList<Item> possibleMutations = new ArrayList<Item>();
  float fitness, maxvalue, v;
  
  float calcWeight = 0;
  float calcValue = 0;

  DNA() {
    // LOAD POSSIBLE ITEMS
    for (int i = 0; i < json.size(); i++) {
      JSONObject item = json.getJSONObject(i);

      String name = item.getString("Navn");
      int weight = parseInt(item.getString("Vaegt"));
      int price = parseInt(item.getString("Kroner"));

      possibleItems.add(new Item(weight, price, name));
      possibleMutations.add(new Item(weight, price, name));

      //println("added: "+weight, price, name);
    }
    for (int u = 0; u < possibleItems.size(); u++){
      maxvalue += possibleItems.get(u).price;
    }
    println(maxvalue);

    // FILL DNA WITH RANDOM ITEMS
    int n = int(random(possibleItems.size()));
    for (int i = 0; i < n; i++){
      int random = int(random(possibleItems.size()));
      
      Item u = possibleItems.get(random); 
      genes.add(u);
      weight = weight + int(u.weight);
      value = value + int(u.price);

      // REMOVE ITEM AFTEN PUT IN BAG OR IF IT WONT FIT
      possibleItems.remove(random);
    }

  }

  void fitness(){
    v = float(value)/maxvalue;
    if (weight < 5000){
      fitness = pow(v*100,2);
    } else {
      fitness = 0;
    }
    
  }

  void mutate(float mutationRate){
    for (int i = 0; i < genes.size(); i++){
      if (random(1) > mutationRate){
        int random = int(random(possibleMutations.size()));
        genes.get(i).name = possibleMutations.get(random).name;
        genes.get(i).price = possibleMutations.get(random).price;
        genes.get(i).weight = possibleMutations.get(random).weight;
      }
    }
  }

    // The function receives one argument (DNA) and returns DNA.
  DNA crossover(DNA partner) {

    DNA child = new DNA();
    child.genes.clear();

    int midpoint = int(random(genes.size()));
    int midpointPartner = int(random(partner.genes.size()));

    for (int i = 0; i < genes.size(); i++) {
      if (i > midpoint) {
        child.genes.add(genes.get(i));
      }
    }
    
    for (int i = 0; i < partner.genes.size(); i++) {
      if (i > midpointPartner) {
        child.genes.add(partner.genes.get(i));
      }
    }

    return child;
  }
  
  void calcParams() {
    for (int i = 0; i < genes.size(); i++) {
      float w = genes.get(i).weight;
      float p = genes.get(i).price;
      
      calcWeight = calcWeight + w;
      calcValue = calcValue + p;
    }
    
  }

}
