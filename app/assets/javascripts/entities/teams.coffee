angular.module('todo.entities').factory('Teams', [
  '$resource'
  ($resource) ->
    $resource "teams/:id", {}, {
      update:
        method: 'PUT'
    }
  ]
)
