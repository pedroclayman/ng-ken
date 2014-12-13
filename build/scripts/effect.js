angular.module('ng-ken', []).directive('ken', function() {
  return {
    restrict: 'A',
    replace: false,
    link: function(scope, element, attrs) {
      return element.addClass('ken');
    }
  };
});
