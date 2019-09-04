<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
<script>
 var app = angular.module('Myapp',[]);
 var t =[];
  app.controller('Myappctl', function($scope){
	/*   $scope.addctl = function(){
		  var o= {};
		  o.txt = $scope.list;
		  t[t.length] = o;
		  console.log(t);
	  } */
	  
	  $scope.add = function(list){
		  alert(list);
	  }
  });
</script>
</head>
<body data-ng-app="Myapp" data-ng-controller="Myappctl">
 <form data-ng-submit="add(list)">
 <input type="text" data-ng-model="list">
 <button type="submit" >추가 </button>
 </form>
 <ul>
 	<h1>{{list}}</h1>
 	<li>{{list.txt}}</li>
 </ul>
</body>
</html>