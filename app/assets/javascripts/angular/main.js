var myApp = angular.module('dinnerMovieApp', []);

myApp.controller('dinnerMovieCtrl', function($scope){
  $scope.controllerTest = 'Controller working, yay!';
});

myApp.directive('dinnerMovieDir', function(){
  return {
    restrict: 'AE',
    link: function(scope, element, attrs){
      scope.directiveTest = "directive working, yay!";
    }
  };
});

