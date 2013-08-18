angular.module('me.routeProvider', []).config(['$routerProvider', function ($routerProvider) {
    $routerProvider.when('/login', {controller: 'LoginCtrl'});
}]);