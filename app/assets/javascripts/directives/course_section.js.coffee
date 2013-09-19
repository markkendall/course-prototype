@app.directive 'courseSection', ->
  restrict: 'E'
  replace: true
  transclude: true
  scope: true

  template: '''
    <section ng-show="visible"></section>
  '''

  compile: (element, attrs, transclude) ->
    (scope, element, attrs) ->
      transclude scope, (clone) ->
        scope.sectionNumber = attrs.number
        element.append(clone)
        scope.$emit 'register', scope.sectionNumber

  controller: ($scope) ->
    $scope.$watch 'currentSection', (number) ->
      $scope.visible = $scope.visible || (number == null || $scope.sectionNumber <= number)
      if $scope.sectionNumber == number && !$scope.editor
        $scope.$emit 'finished', $scope.sectionNumber

    $scope.$on 'hint', (event, text) ->
      $scope.editor.setValue(text)
