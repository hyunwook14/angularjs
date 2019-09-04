<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>문제</title>
	<link rel="shortcut icon" type="image/x-icon" href="/web/resources/img/favicon.png">
	<link rel="stylesheet" href="/web/resources/css/home.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
	<script>
		var app =angular.module('Myapp', []);
		var list =[];
		var idx = 0;
		
			app.controller('formCtl',function($scope, $http){
				$scope.todos = {};
				$scope.text="";
				
				$scope.select =function(){
					$http({
						url:"/web/exam/select",
						method:"GET"
					}).then(function(data){
						console.log("resultdata:", data.data);
						 $scope.selectlist = data.data; 
					});
				}
				
				$scope.select();				
				
				$scope.addbtn =function(){
					let data={};
					data.txt = $scope.text;
					data.status= false;
					
					$scope.text="";
					
					$scope.todos.insertdata=data;
					let payload = {"list" : JSON.stringify($scope.todos)};
					$http({
						url:"/web/exam/insert",
						method:"POST",
						params:payload
					}).then(function(data){
						console.log("response Data : ",data);
						$scope.select();
					});
					
					
				};
				
				$scope.checkEvent = function(row){
					 idx = row.no;
					 if(row.status ==true){
						 row.status = false;
						 $scope.text= "";
					 }
					else {
						row.status =true;
						$scope.text = row.txt;
					}
					console.log(row.status+", "+row.no,", ", row.txt);
				}; 
				
				$scope.updatedata = function(){
					
					var bean ={};
					bean.no = idx;
					bean.txt = $scope.text;
					idx =0;
					 $http({
						url:"/web/exam/update",
						method:"POST",
						params:{"list":bean}
					}).then(function(data){
						console.log("update, ", data);
						$scope.select();
					}); 
				}
				
				$scope.deletedata = function(){
					
					var bean ={};
					bean.no = idx;
					bean.txt = $scope.text;
					idx =0;
					 $http({
						url:"/web/exam/delete",
						method:"POST",
						params:{"list":bean}
					}).then(function(data){
						console.log("delete, ", data);
						$scope.select();
					}); 
				}
				
			});

	</script>
</head>
<body data-ng-app="Myapp" data-ng-controller="formCtl">
<div class="container">
	<h1 class="text-center">구디아카데미</h1>
	<form id="edit" >
	  <div class="form-group row">
	    <div class="col-xs-2">
	    	<label for="text">한줄평  :</label>
	    </div>
	    <div class="col-xs-7">
	    	<input type="text" class="form-control" id="text" name="txt" placeholder="입력하세요." autocomplete="off" data-ng-model="text" >
	    	<input type="hidden" name="index">
	    </div>
	    <div class="col-xs-1">
	    	<button type="button" class="btn btn-primary" id="submit" data-ng-click="addbtn()">추가</button>
	    </div>
	    <div class="col-xs-1">
	    	<button type="submit" class="btn btn-success " id="update" data-ng-click="updatedata()" >수정</button>
	    </div>
	    <div class="col-xs-1">
	    	<button type="submit" class="btn btn-danger " id="delete" data-ng-click="deletedata()">삭제</button>
	    </div>
	  </div>
	</form>
</div>
<div class="container">
	<table class="table table-striped">
	  <thead>
	    <tr>
	      <th>선택</th>
	      <th>번호</th>
	      <th>한줄평</th>
	      <th>작성자</th>
	    </tr>
	  </thead>
	  <tbody>
			{{todos}}
			<tr data-ng-repeat="row in selectlist">
		      <td><input type="checkbox" data-ng-click="checkEvent(row)" name="checkbox" ng-model="checked"> </td>
		      <td>{{row.no}}</td><!-- ($index + 1) -->
		      <td>{{row.txt}}</td>
		      <td>{{}}</td>
		    </tr>
  
	  </tbody>
	</table>
</div>
<!-- Modal -->
<div class="container">
  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header" style="padding:35px 50px;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4><span class="glyphicon glyphicon-lock"></span> Login</h4>
        </div>
        <div class="modal-body" style="padding:40px 50px;">
          <form role="form">
            <div class="form-group">
              <label for="usrname"><span class="glyphicon glyphicon-user"></span> Username</label>
              <input type="text" class="form-control" id="usrname" placeholder="Enter email" required="required" autocomplete="off">
            </div>
            <div class="form-group">
              <label for="psw"><span class="glyphicon glyphicon-eye-open"></span> Password</label>
              <input type="text" class="form-control" id="psw" placeholder="Enter password" required="required" autocomplete="off">
            </div>
              <button type="submit" class="btn btn-success btn-block"><span class="glyphicon glyphicon-off"></span> Login</button>
          </form>
        </div>
      </div>
      
    </div>
  </div> 
</div>
</body>
</html>