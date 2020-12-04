class DNA {
  int MAX_WEIGHT = 5000;
  int weight = 0;
  int value = 0;
  ArrayList<Item> genes = new ArrayList<Item>();
  float fitness;

  DNA() {
    // LOAD POSSIBLE ITEMS
    ArrayList<Item> possibleItems = new ArrayList<Item>();
    for (int i = 0; i < json.size(); i++) {
      JSONObject item = json.getJSONObject(i);

      String name = item.getString("Navn");
      int weight = parseInt(item.getString("Vaegt"));
      int price = parseInt(item.getString("Kroner"));

      possibleItems.add(new Item(weight, price, name));
      //println("added: "+weight, price, name);
    }

    // FILL DNA WITH RANDOM ITEMS
    int n = int(random(possibleItems.size()));
    print(n);
    for (int i = 0; i < n; i++){
      int random = int(random(possibleItems.size()));

      Item u = possibleItems.get(random);
      genes.add(u);
      weight = weight + int(u.weight);
      value = value + int(u.price);

      // REMOVE ITEM AFTEN PUT IN BAG OR IF IT WONT FIT
      possibleItems.remove(random);
      println(genes.size());
    }

  }

  void fitness(){
    fitness = pow((float(value)/float(weight)*100),2);
  }

  void mutate(float mutationRate){
      if(random(1) < mutationRate){
      //genes.clear;
    }
  }

    // The function receives one argument (DNA) and returns DNA.
  /*DNA crossover(DNA partner) {

    DNA child = new DNA();

    int midpoint = int(random(genes.size()));

    for (int i = 0; i < genes.size(); i++) {
      if (i > midpoint) {
        child.genes.get(i).name = genes.get(i).name;
        child.genes.get(i).price = genes.get(i).price;
        child.genes.get(i).weight = genes.get(i).weight;
      } else {
        child.genes.get(i).name = partner.genes.get(i).name;
        child.genes.get(i).price = partner.genes.get(i).price;
        child.genes.get(i).weight = partner.genes.get(i).weight;
      }
    }

    return child;
  }

}
