controllers = angular.module('controllers')
controllers.controller("CategoriesController", [ '$scope', '$routeParams', '$location', '$resource',
  ($scope, $routeParams, $location, $resource) ->
    $scope.recipes = -> $location.path("/recipes")
    $scope.search = (cat_keywords)-> $location.path("/categories").search('cat_keywords', cat_keywords)
    Category = $resource('/categories/:categoryId', { categoryId: "@id", format: 'json' })
    AllCategories = $resource('/categories', { categoryId: "@id", format: 'json' })
    $scope.categories = Category.query()
    $scope.all_categories = AllCategories.query()


    if $routeParams.cat_keywords
      cat_keywords = $routeParams.cat_keywords.toLowerCase()
      Category.query(cat_keywords: $routeParams.cat_keywords, (results)-> $scope.categories = results)
    else
      $scope.categories = []

    $scope.view = (categoryId) -> $location.path("/categories/#{categoryId}")

    $scope.newCategory = -> $location.path("/categories/new")
    $scope.edit = (categoryId) -> $location.path("/categories/#{categoryId}/edit")
])
