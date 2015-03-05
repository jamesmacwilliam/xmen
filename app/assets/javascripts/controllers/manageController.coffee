angular.module('todo.main').controller('manageController', [
  '$location'
  'Teams'
  'Tasks'
  ($location, Teams, Tasks) ->

    self = this

    #======================
    # Teams
    #======================

    # Get
    self.getTeams = ->
      Teams.query().$promise.then (res) ->
        self.teams = res
        self.team = {}
        delete self.new_team

    # Create/Update
    self.saveTeam = (team) ->
      team = if team.id
        Teams.update({ id: team.id }, team)
      else
        Teams.save({}, team)
      team.$promise.then self.getTeams

    # Manage Team forms
    #
    self.hideTeamForm = ->
      self.hide_team = true

    self.showTeamForm = (team) ->
      self.team = team
      delete self.hide_team
      self.showTasks(team)

    self.teamFormVisible = (team) ->
      self.team.id == team.id && !self.hide_team

    self.teamClass = (team) ->
      'active' if self.team.id == team.id

    # initialze teams
    self.getTeams()

    #======================
    # Tasks
    #======================

    self.showTaskForm = (task) ->
      self.task = task
      self.hideTeamForm()

    # Get
    self.showTasks = (team) ->
      delete self.new_team
      Tasks.query(teamId: team.id).$promise.then (res) ->
        self.tasks = res

      self.task = {}
      delete self.new_task
      self.team = team

    # Create/Update
    self.saveTask = (task) ->
      task = if task.id
        Tasks.update({ teamId: self.team.id, id: task.id }, task)
      else
        Tasks.save({ teamId: self.team.id }, task)
      task.$promise.then -> self.showTasks(self.team)

    # mark task completed
    self.completeTask = (task) ->
      task.completed = true
      self.hideTeamForm()
      self.saveTask(task)
])
