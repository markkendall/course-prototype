@app.directive 'challengeOutput', ->
  restrict: 'E'
  replace: true
  transclude: true
  scope: true

  template: '''
    <pre class="output" ng-transclude></pre>
  '''
