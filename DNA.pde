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

    // The child is a new instance of DNA.
    // Note that the DNA is generated randomly in the constructor,
    // but we will overwrite it below with DNA from parents.
    DNA child = new DNA();

    // Picking a random “midpoint” in the genes array
    int midpoint = int(random(genes.length));

    for (int i = 0; i < genes.length; i++) {
      //[full] Before midpoint copy genes from one parent, after midpoint copy genes from the other parent
      if (i > midpoint) child.genes[i] = genes[i];
      else child.genes[i] = partner.genes[i];
      //[end]
    }
  }*/
  
}
