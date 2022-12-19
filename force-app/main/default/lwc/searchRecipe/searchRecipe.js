import { LightningElement, track, wire } from 'lwc';
import getRandomRecipe from '@salesforce/apex/CallouttoSpoonacular.getRandomRecipe';
import getRecipeByIngredients from '@salesforce/apex/CallouttoSpoonacular.getRecipeByIngredients';


export default class SearchRecipe extends LightningElement {
    
    recipes = [];
    fetchRandomRecipe() {
        console.log('Hit random recipe search button');
      getRandomRecipe()
        .then((data) => {
          this.recipes =
            JSON.parse(data) && JSON.parse(data).recipes
              ? JSON.parse(data).recipes
              : [];
        })
        .catch((error) => {
          console.error(error);
        });
    }
  
    fetchRecipesByIngredients() {
        console.log('Hit search recipe by ingredients button');
      const ingredients = this.template.querySelector(".ingredient-input").value;
      console.log('ingredients');
      getRecipeByIngredients({ ingredients })
        .then((data) => {
          this.recipes = JSON.parse(data);
          console.log("recipes by ingredients are " + this.recipes);
        })
        .catch((error) => {
          console.error(error);
        });
    }
  }
