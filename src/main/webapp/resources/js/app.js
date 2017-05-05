
var taskManagerModule = angular.module('taskManagerApp', []);

// app.config(['$qProvider', function ($qProvider) {
//     $qProvider.errorOnUnhandledRejections(false);
// }]);

 taskManagerModule.controller("taskManagerCtrl", function ($scope,$http) {
	var urlBase="http://localhost:8080"; 		
	$scope.tasks = [];
	$scope.taskStatus = undefined; //task show: all, has done, has't done.  (undefined, true, false)
 	$http.defaults.headers.post["Content-Type"] = "application/json; charset=utf-8";



 	//---------------------  Pagination -------------------------
 	$scope.currentPage = 0;
 	$scope.tasksPerPage = 5;	

 	//Count task by value taskStatus
 	$scope.countTasksByStatus = function () {
 		if ($scope.taskStatus == undefined)
 			return $scope.tasks.length;

 		var cout = 0;
 		for (i = 0; i < $scope.tasks.length; ++i) {
 			if ($scope.tasks[i].hasdone == $scope.taskStatus){
 				cout++;				
 			}
 		}
 		return cout;
 	}

 	$scope.firstPage = function() {
 		return $scope.currentPage == 0;
 	}

 	$scope.lastPage = function() {  	
    	//var lastPageNum = Math.ceil($scope.tasks.length / $scope.tasksPerPage - 1);
    	var lastPageNum = Math.ceil($scope.countTasksByStatus() / $scope.tasksPerPage - 1);
    	return $scope.currentPage == lastPageNum;
    }
    $scope.numberOfPages = function(){
    	//return Math.ceil($scope.tasks.length / $scope.tasksPerPage);
    	return Math.ceil($scope.countTasksByStatus() / $scope.tasksPerPage);
    }

    $scope.startingTask = function() {
    	return $scope.currentPage * $scope.tasksPerPage;
    }

    $scope.pageBack = function() {
    	$scope.currentPage = $scope.currentPage - 1;
    }

    $scope.pageForward = function() {
    	$scope.currentPage = $scope.currentPage + 1;
    } 	
    //---------------------------------------------------------------
 
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

	$scope.updateTask = function updateTask(id) {
		var index  = -1;		

    	for (i = 0; i < $scope.tasks.length; ++i) {
    		if ($scope.tasks[i].id == id){
    			index = i;
    			break;
    		}
    	}
    	if (index == -1)
    		return;

    	console.log ("UPDATE task by id: " + id + "   Description:" + $scope.tasks[index].description + "  Status=" + $scope.tasks[index].hasdone);
        console.log ("Task: " + $scope.tasks[index]);
		console.log ("Send UPDATE request...");
		$http.put(urlBase + "/task/" + id, $scope.tasks[index]).
	     		then(function(response) {	    			   				    			
	     			console.log ("Ok");      
	  	});
	}


}); //taskManagerModule.controller


taskManagerModule.filter('startFrom', function(){
	return function(input, start){
		start = +start;
		return input.slice(start);
	}
})