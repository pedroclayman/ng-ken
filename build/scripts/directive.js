angular.module('ng-ken', []).directive('ken', function() {
  return {
    restrict: 'A',
    replace: false,
    scope: {
      options: '=ken'
    },
    link: function(scope, element, attrs) {
      var firstChild, getFirstChild, getWidth;
      getWidth = function() {
        return element[0].offsetWidth;
      };
      getFirstChild = function() {
        return element[0].querySelector(':first-child');
      };
      element.addClass('ken');
      firstChild = getFirstChild();
      if (firstChild != null) {
        return firstChild.style.transitionDuration = '10s';
      }
    }
  };
});
