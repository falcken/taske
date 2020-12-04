class DNA {
  int MAX_WEIGHT = 5000;
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
    while (this.value <= 5000) {
      Item i = possibleItems.get(int(random(possibleItems.size()))); 
      genes.add(i);   
      
      println("added: "+i.weight, i.price, i.name);
    }
  }
  
  void fitness(){
    for (int i = 0; i < genes.size(); i++) {
      Item u = genes.get(i);
      fitness += u.price/u.weight;
    }
  }
  
}
