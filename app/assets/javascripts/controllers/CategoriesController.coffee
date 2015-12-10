controllers = angular.module('controllers')
controllers.controller("CategoriesController", [ '$scope', '$routeParams', '$location', '$resource',
  ($scope, $routeParams, $location, $resource) ->
    console.log 'test'
    # $scope.search = (keywords)-> $location.path("/").search('keywords', keywords)
    # Recipe = $resource('/recipes/:recipeId', { recipeId: "@id", format: 'json' })

    # if $routeParams.keywords
    #   keywords = $routeParams.keywords.toLowerCase()
    #   Recipe.query(keywords: $routeParams.keywords, (results)-> $scope.recipes = results)
    # else
    #   $scope.recipes = []

    # $scope.view = (recipeId) -> $location.path("/recipes/#{recipeId}")

    # $scope.newRecipe = -> $location.path("/recipes/new")
    # $scope.edit = (recipeId) -> $location.path("/recipes/#{recipeId}/edit")
])
