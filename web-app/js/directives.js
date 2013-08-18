angular.module('me.directive',[]).directive('login', function () {
    return {
        restrict: 'E',
        templateUrl: 'loginForm.html'
    }
}).directive('signup', function () {
    return {
        restrict: 'E',
        templateUrl: 'signupForm.html'
    }
}).directive('alert', function () {
    return {
        restrict: 'E',
        templateUrl: 'alert.html',
        link: function (scope) {
            scope.isVisible = false;
        }
    }
});