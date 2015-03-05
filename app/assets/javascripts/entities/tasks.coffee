angular.module('todo.entities').factory('Tasks', [
  '$resource'
  ($resource) ->
    $resource "/teams/:teamId/tasks/:id", {}, {
      update:
        method: 'PUT'
    }
  ]
)
