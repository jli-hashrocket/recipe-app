controllers = angular.module('controllers')
controllers.controller("CategoryController", [ '$scope', '$routeParams', '$resource', '$location', 'flash'
  ($scope, $routeParams, $resource, $location, flash) ->
    Category = $resource('/categories/:CategoryId', { categoryId: "@id", format: 'json' },
      {
        'save': { method: 'PUT' },
        'create': { method: 'POST'}
      }
    )

    if $routeParams.categoryId
      Category.get({CategoryId: $routeParams.categoryId},
        ( (category)-> $scope.category = category ),
        ( (httpResponse)->
          $scope.category = null
          flash.error = "There is no category with ID #{$routeParams.categoryId}"
        )
      )
    else
      $scope.category = {}

    $scope.back = -> $location.path("/categories")

    $scope.edit = ->
      $location.path("/categories/#{$scope.category.id}/edit")
    $scope.cancel = ->
      if $scope.category.id
        $location.path("/categories/#{$scope.category.id}")
      else
        $location.path("/categories")

    $scope.save = ->
      onError = (_httpResponse) -> flash.error = "Something went wrong"
      if $scope.category.id
        $scope.category.$save(
          ( ()-> $location.path("/categories/#{$scope.category.id}") ),
            onError
          )
      else
        Category.create($scope.category, ( (newCategory)-> $location.path("/categories/#{newCategory.id}") ),
          onError
        )

    $scope.delete = ->
      $scope.category.$delete()
      $scope.back()

])
