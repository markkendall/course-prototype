@app.directive 'challengeEditor', ->
  restrict: 'E'
  replace: true
  scope: true

  template: '''
    <div class="challenge">
      <div class="editor" ng-hide="output">
        <button ng-click="submitCode()">Submit</button>
        <div class="errors">{{ errors }}</div>
      </div>
      <div class="output" ng-show="output">
        <div class="CodeMirror"><pre>{{ output }}</pre></div>
        <button ng-click="retry()">Retry</button>
      </div>
    </div>
  '''

  link: (scope, element, attrs) ->
    scope.$parent.editor = CodeMirror(
      (editor) ->
        element.children()[0].insertBefore(editor, element.children()[0].children[0])
      {
        value: attrs.content
        mode: attrs.language
      }
    )
    scope.output = attrs.output

  controller: ($scope, $http) ->
    $scope.submitCode = ->
      $http.post('', {challenge: $scope.sectionNumber, code: $scope.editor.getValue()})
        .success (data) ->
          if data.failures.length > 0
            $scope.errors = data.failures.join("\n")
          else
            $scope.output = "#{$scope.editor.getValue()}\n#{data.output}"

    $scope.retry = ->
      $scope.output = null

    $scope.$on 'complete', (event, sectionNumber, output) ->
      $scope.output = output if sectionNumber == $scope.sectionNumber

    $scope.$watch 'output', (output) ->
      if output && output.length
        $scope.$emit 'finished', $scope.sectionNumber
      else
        $scope.$emit 'unfinished', $scope.sectionNumber
