
var taskManagerModule = angular.module('taskManagerApp', []);

// app.config(['$qProvider', function ($qProvider) {
//     $qProvider.errorOnUnhandledRejections(false);
// }]);




 taskManagerModule.controller("taskManagerCtrl", function ($scope,$http) {
	var urlBase="http://localhost:8080"; 		
	$scope.tasks = [];
 	$http.defaults.headers.post["Content-Type"] = "application/json; charset=utf-8"; 	
 
 	//Get all tasks
 	$http.get(urlBase+"/tasks")    	
    	.then(function(response) {
	        $scope.tasks = response.data;
    
    })

    //ADD new task
    //Example {"description":"This is task","id":0,"date":1493212282000,"hasdone":false}
	$scope.addNewTask = function addTask() {		
  		if($scope.tempDescription==""){
   			alert("Добавление новой задачи: поле с описанием задачи не может быть пустым");
	  	} else {
	  		if ($scope.tempHasDone == undefined)
	  			$scope.tempHasDone = false
	  		
	  		var newTask = {	  			       
	        	"description": $scope.tempDescription,
	        	"id": 0,
	        	"date": new Date().getTime(),
	        	"hasdone": $scope.tempHasDone,      	
	    	}
	    	
	    	console.log ("ADD new task:", newTask);	    	
	    	console.log ("Send POST request...");
	    	$http.post(urlBase + "/task", newTask).
	    		then(function(response) {	    			
	    			$scope.tasks.push (newTask);
	    			console.log ("Ok");      
	      	});
	    }

	}

	$scope.removeTask = function removeTask(task) {
		console.log ("REMOVE task by id: " + task.id + "   Task:" + task.description);		
		
		console.log ("Send DELETE request...");
		$http.delete(urlBase + "/task/" + task.id, []).
	    		then(function(response) {	    			   			
	    			var index = $scope.tasks.indexOf (task);	    			
	    			$scope.tasks.splice (index, 1);
	    			console.log ("Ok");      
	      	});
	}



	$scope.updateTask = function updateTask(task) {
		console.log ("UPDATE task by id: " + task.id + "   Task:" + task.description);
		console.log ("descrField:" + $scope.descrField)		
		
		// console.log ("Send UPDATE request...");
		// $http.put(urlBase + "/task/" + task.id, task).
	 //    		then(function(response) {	    			   				    			
	 //    			console.log ("Ok");      
	 //      	});
	}



}); //taskManagerModule.controller