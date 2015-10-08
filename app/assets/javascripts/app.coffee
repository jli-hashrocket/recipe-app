recipe = angular.module('recipe',[
  'templates',
  'ngRoute',
  'ngResource',
  'controllers',
  'angular-flash.service',
  'angular-flash.flash-alert-directive'
])

recipe.config([ '$routeProvider',
  ($routeProvider)->
    $routeProvider
      .when('/',
        templateUrl: "index.html"
        controller: 'RecipesController'
      ).when('/recipes/:recipeId',
        templateUrl: "show.html"
        controller: 'RecipesController'
      )
])

recipes = [
  {
    id: 1
    name: 'Baked Potato w/Cheese'
  },
  {
    id: 2
    name: 'Garlic Mashed Potatoes',
  },
  {
    id: 4
    name: 'Baked Brussel Sprouts',
  },
]
controllers = angular.module('controllers',[])
