/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var app = angular.module("myapp", []);
app.controller("myctrl", function ($scope, $http) {
    $scope.begin = 0;
    $scope.pageCount = Math.ceil($scope.flowers.length / 6);
    $scope.prev = function () {
        if ($scope.begin > 0) {
            $scope.begin -= 6;
        }
    }
    $scope.next = function () {
        if ($scope.begin < ($scope.pageCount - 1) * 6) {
            $scope.begin += 6;
        }
    }
});