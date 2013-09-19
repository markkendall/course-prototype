@app.directive 'course', ->
  restrict: 'E'
  replace: true
  transclude: true
  scope: true

  template: '''
    <article></article>
  '''

  compile: (element, attrs, transclude) ->
    (scope, element, attrs) ->
      transclude scope, (clone) ->
        element.append(clone)

  controller: ($scope, $http, $location) ->
    $scope.sections = []
    $scope.currentSection = null

    $scope.$on 'register', (event, section) ->
      $scope.sections.push section

    $scope.$on 'unfinished', (event, section) ->
      if !$scope.currentSection || section < $scope.currentSection
        $scope.currentSection = section

    $scope.$on 'finished', (event, section) ->
      $scope.currentSection = $scope.sections[$scope.sections.indexOf(section) + 1] || $scope.currentSection

    $http.get("#{$location.absUrl()}/progress").success (data) ->
      $scope.$broadcast 'complete', section, output for section, output of data
