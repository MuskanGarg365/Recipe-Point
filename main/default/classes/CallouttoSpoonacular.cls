public with sharing class CallouttoSpoonacular {
    @AuraEnabled
    public static String getRandomRecipe(){
   
    Http http = new Http();
    HttpRequest request = new HttpRequest();
    request.setEndpoint('https://api.spoonacular.com/recipes/random?apiKey=2851d77a07324b4cb53d1117313dee4e');
    request.setMethod('GET');
    HttpResponse response = http.send(request);
    system.debug('Response code is ' + response.getStatusCode());
    // If the request is successful, parse the JSON response.
        if(response.getStatusCode() == 200) {
        System.debug('API authentication succeed');
        system.debug(response.getBody());
        
    }
        return response.getBody();
    }
    // c-get-Recipe-Info
    
    // Get recipe by ingredients
     @AuraEnabled
    public static String getRecipeByIngredients(String ingredient){
         system.debug('ing in comsole is '+ingredient);
    Http http = new Http();
    HttpRequest request = new HttpRequest();
    request.setEndpoint('https://api.spoonacular.com/recipes/findByIngredients?apiKey=2851d77a07324b4cb53d1117313dee4e&ingredients='+ingredient);
    request.setMethod('GET');
    HttpResponse response = http.send(request);
    system.debug('Response code is ' + response.getStatusCode());
    if(response.getStatusCode() == 200) {
        System.debug('API authentication succeed');
        system.debug(response.getBody());
        
}
        return response.getBody();
    }
    
    @AuraEnabled
    public static String getRecipeInformation(String recipeId){
      Http http = new Http();
    HttpRequest request = new HttpRequest();
    request.setEndpoint('https://api.spoonacular.com/recipes/'+recipeId+'/information?apiKey=2851d77a07324b4cb53d1117313dee4e&includeNutrition=false');
    // request.setEndpoint('https://api.spoonacular.com/recipes/716429/information?apiKey=2851d77a07324b4cb53d1117313dee4e&includeNutrition=false');
    request.setMethod('GET');
    HttpResponse response = http.send(request);
    system.debug('Response code is ' + response.getStatusCode());
    if(response.getStatusCode() == 200) {
        System.debug('API authentication succeed');
        system.debug(response.getBody());
        
}
        return response.getBody();  
    }
}
