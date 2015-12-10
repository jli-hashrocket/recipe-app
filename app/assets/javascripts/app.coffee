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
        templateUrl: "index.html"
        controller: 'RecipesController'
      ).when('/recipes/new',
        templateUrl: "form.html"
        controller: 'RecipeController'
      ).when('/recipes/:recipeId',
        templateUrl: "show.html"
        controller: 'RecipeController'
      ).when('/recipes/:recipeId/edit',
        templateUrl: "form.html",
        controller: 'RecipeController',
      ).when('/categories',
        templateUrl: "categories/index.html"
        controller: "CategoriesController"
      )

])

controllers = angular.module('controllers',[])
