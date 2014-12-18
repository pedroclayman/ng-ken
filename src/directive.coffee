angular.module 'ng-ken', []

  .directive 'ken', ->
      restrict: 'A',
      replace: false,
      scope: {
        options: '=ken'
      }
      link: (scope, element, attrs) ->

        getWidth = ->
          element[0].offsetWidth

        getFirstChild = ->
          element[0].querySelector ':first-child'

        element.addClass 'ken'

        firstChild = getFirstChild()

        if scope.options? && scope.options.duration? && firstChild?
          console.log scope.options.duration
          firstChild.style.transitionDuration = scope.options.duration;
