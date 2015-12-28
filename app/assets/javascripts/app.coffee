recipe = angular.module('recipe',[
  'templates',
  'ngRoute',
  'ngResource',
  'controllers',
  'angular-flash.service',
  'angular-flash.flash-alert-directive'
])

recipe.config([ '$routeProvider', 'flashProvider'
  ($routeProvider, flashProvider)->
    flashProvider.errorClassnames.push("alert-danger")
    flashProvider.warnClassnames.push("alert-warning")
    flashProvider.infoClassnames.push("alert-info")
    flashProvider.successClassnames.push("alert-success")

    $routeProvider
      .when('/',
        templateUrl: "recipes/index.html"
        controller: 'RecipesController'
      ).when('/recipes',
        templateUrl: 'recipes/index.html'
        controller: 'RecipesController'
      ).when('/recipes/new',
        templateUrl: 'recipes/form.html'
        controller: 'RecipeController'
      ).when('/recipes/:recipeId',
        templateUrl: 'recipes/show.html'
        controller: 'RecipeController'
      ).when('/recipes/:recipeId/edit',
        templateUrl: 'recipes/form.html'
        controller: 'RecipeController'
      ).when('/categories',
        templateUrl: 'categories/index.html'
        controller: 'CategoriesController'
      ).when('/categories/new',
        templateUrl: 'categories/form.html'
        controller: 'CategoryController'
      ).when('/categories/:categoryId',
        templateUrl: 'categories/show.html'
        controller: 'CategoryController'
      ).when('/categories/:categoryId/edit',
        templateUrl: 'categories/form.html'
        controller: 'CategoryController'
      )

])

controllers = angular.module('controllers',[])
