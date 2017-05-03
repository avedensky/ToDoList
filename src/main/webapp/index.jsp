<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html ng-app="taskManagerApp">
<head>
	<meta charset="utf-8">
	<title>Main Page</title>	
	<script defer src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
	<script defer src="./app.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
</head>
<body>
	<div ng-controller="taskManagerCtrl">

		<!-- <div id="task-panel" class="fadein fadeout showpanel panel"  ng-show="toggle"> 
  			<div class="panel-heading">
   				<i class="panel-title-icon"></i>
   				<span class="panel-title">Задания</span>
   				<div class="panel-heading-controls">
    			<button ng-click="toggle = !toggle">Новое задание</button>
    
   			</div>
  		</div> -->

<!-- 	<div class="panel-heading">
   		<i class="panel-title-icon"></i>
   		<span class="panel-title">Задания</span>
   		<div class="panel-heading-controls">    		
   		</div>
   	</div> -->

	<div>
    <input type="checkbox" name="hasdone" ng-model="tempHasDone">
		<input type="text" size ="80" name="description" ng-model="tempDescription">
		<button ng-click="addNewTask()">Новое задание</button>    
	</div>
	<br>
	<br>

	<div ng-repeat="task in tasks">
		<input id="task.id" type="checkbox" value="{{task.id}}" ng-checked="{{task.hasdone}}" ng-click="toggleSelection(task.id)">
		<input id="task.id" type="text" size ="80" ng-init="descrField=task.description" ng-model="descrField">
		<button ng-click="removeTask(task)">Delete</button>
    <button ng-click="updateTask(task)">Update</button>
	</div> 

	<!-- <div id="add-task-panel" ng-hide="toggle">
  		<div>
   			<span>Add Task</span>
   			<div>
    			<button ng-click="toggle = !toggle">Show All Tasks</button>
   			</div>
  		</div>
  		<div>
   			<div>
    			<table>
     			<tr>
      				<td>Task Description:</td>
      				<td><input type="text" ng-model="taskDesc"/></td>
     			</tr>     		
     			<tr>
				<td><button ng-click="addTask()" class="btn-panel-big">Add New Task</button></td>
     			</tr>
    			</table>        
   			</div>
  		</div>
  	</div> -->


	

     	<!-- <input id="{{task.taskId}}" type="checkbox" value="{{task.taskId}}" ng-checked="selection.indexOf(task.taskId) > -1" ng-click="toggleSelection(task.taskId)" />
       <label for="{{task.taskId}}"></label>  -->

    </div>

</body>
</html>