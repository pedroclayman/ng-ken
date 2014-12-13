angular.module 'ng-ken', []

  .directive 'ken', ->
      restrict: 'A',
      replace: false,
      link: (scope, element, attrs) ->
        element.addClass 'ken'
