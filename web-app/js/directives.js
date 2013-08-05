app.directive('login', function () {
    return {
        restrict: 'E',
        templateUrl: 'loginForm.html'
    }
});
app.directive('signup', function () {
    return {
        restrict: 'E',
        templateUrl: 'signupForm.html'
    }
});
app.directive('alert', function () {
    return {
        restrict: 'E',
        templateUrl: 'alert.html',
        link: function (scope) {
            scope.isVisible = false;
        }
    }
});