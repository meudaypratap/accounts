angular.module('me.controllers', []).controller('LoginCtrl', ['$scope', function ($scope) {
    $scope.user = {username: {label: 'Username', value: ''}, password: {label: 'Password', value: ''}};
    $scope.login = function (user) {
        var data = {'j_username': user.username.value, 'j_password': user.password.value};
        console.debug(data);
    }
}]);