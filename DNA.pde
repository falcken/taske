class DNA {
  int MAX_WEIGHT = 5000;
  int value = 0;
  ArrayList<Item> genes = new ArrayList<Item>();

  DNA() {
    // FILL DNA WITH RANDOM ITEMS
    for (int i = 0; i < json.size(); i++) {

      JSONObject item = json.getJSONObject(i); 
      String name = item.getString("Navn");
      
      if (this.value >= 5000) {
        
      }
    }
  }
  
  void fitness(){
    
  }
  
}
