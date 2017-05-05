<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html ng-app="taskManagerApp">
<head>
  <meta charset="utf-8">
  <title>Main Page</title>  
    <link rel="stylesheet" href="./resources/css/style.css">
    <script defer src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>  
    <script defer src="./resources/js/app.js"></script>
</head>
<body>  
    <div class=wrapper>

        <header>
            <div class="header_title">
                <h1>Список дел</h1>
            </div>
        </header>

        <div class="main_content" ng-controller="taskManagerCtrl">
            <aside>       
                <div class="filtr_block_title">Фильтр</div>            

                <div class="filtr_control_block">
                    <p><a class="a_switcher" href ng-click="taskStatus=undefined">Все</a></p>
                    <p><a class="a_switcher" href ng-click="taskStatus=true">Выполненые</a></p>
                    <p><a class="a_switcher" href ng-click="taskStatus=false">Не выполненые</a></p>
                </div>
            </aside>    


            <article>
                <!-- <div style="clear: left"></div> -->
                <div class="task_list_area"> 
                    <div class="task_list_content">

                        <div ng-repeat="task in tasks | filter : task.hasdone=taskStatus | startFrom: startingTask() | limitTo: tasksPerPage">

                            <div class="task">
                                <input id="task.id" type="checkbox" size ="50" ng-model="task.hasdone" ng-click="updateTask(task.id)">
                                <input id="task.id" type="text" size ="50" ng-model="task.description" ng-blur="updateTask(task.id)">
                                <button ng-click="removeTask(task)">Удалить</button>
                            </div>
                        </div>
                    </div> <!-- task_list_content -->

                </div> <!-- task_list_area -->


                <!-- <div id="pagination"> -->
                <div class="pagination_area">
                    <button ng-disabled="firstPage()" ng-click="pageBack()">Назад</button>
                    <span>{{currentPage+1}} из {{numberOfPages()}}</span>
                    <button ng-disabled="lastPage()" ng-click="pageForward()">Вперед</button>
                </div>




                

                <div class=additional_task_area>
                    <div class=additional_task_title>Добавить новое задвние</div>

                    <div class=additional_task_form>  
                        <input type="checkbox" name="hasdone" ng-model="tempHasDone">
                        <input type="text" size ="50" name="description" ng-model="tempDescription">
                        <button ng-click="addNewTask()">Добавить</button>
                    </div>

                </div>
            </article>
        </div> <!-- main_content -->

        <footer>
        	<a href="https://github.com/avedensky/ToDoList">Copyleft AVedensky 2017</a>            
        </footer>
    </div> <!-- wrapper -->
</body>
</html>

