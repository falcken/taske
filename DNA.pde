class DNA {
  int MAX_WEIGHT = 5000;
  int weight = 0;
  int value = 0;
  ArrayList<Item> genes = new ArrayList<Item>();

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
    while (this.weight < 5000 && possibleItems.size() > 0) {
      int random = int(random(possibleItems.size()));
      
      Item i = possibleItems.get(random); 
      if (weight + i.weight < 5000) {
        genes.add(i); 
        weight = weight + int(i.weight);
        value = value + int(i.price);
      }
      
      //println("weight: "+weight);
      possibleItems.remove(random);
    }
    

  }
  
  
  void fitness(){
    for (int i = 0; i < genes.size(); i++) {
      println(genes.get(i).name);
    }
  }
  
}
