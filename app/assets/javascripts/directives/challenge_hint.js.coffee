@app.directive 'challengeHint', ->
  restrict: 'E'
  replace: true
  transclude: true
  scope: true

  template: '''
    <div class="hint" ng-transclude ng-click="clickHint()"></div>
  '''

  link: (scope, element) ->
    scope.clickHint = ->
      scope.$emit 'hint', element.text()
