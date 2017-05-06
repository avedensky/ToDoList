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
                    <p><a class="a_switcher" href ng-click="taskStatus=undefined;currentPage=0;">Все</a></p>
                    <p><a class="a_switcher" href ng-click="taskStatus=true;currentPage=0;">Выполненые</a></p>
                    <p><a class="a_switcher" href ng-click="taskStatus=false;currentPage=0;">Не выполненые</a></p>
                </div>
            </aside>    


            <article>                
                <div class="task_list_area">                     
                    <div class="task_list_content">

                        <div ng-repeat="task in tasks | filter : task.hasdone=taskStatus | startFrom: startingTask() | limitTo: tasksPerPage">
                            <div class="task">
                                <div ng-class="task.hasdone ? 'task_checkbox_checked':'task_checkbox_unchecked'" ng-model="task.hasdone" ng-click="updateTask('checkbox', task.id)"></div>
                                <div class="task_input_field"><input id="task.id" type="text" size ="50" ng-model="task.description" ng-blur="updateTask('text', task.id)"></div>
                                <div class="task_button_trash" ng-click="removeTask(task)"></div>
                            </div>                   
                    
                        </div> 
                    </div>
                </div> <!-- task_list_area -->

                <div class="pagination_area">
                    <div class="pagination_to_left_button" ng-click="pageBack()"></div>
                    <div class="pagination_text">{{currentPage+1}} из {{numberOfPages()}}</div>
                    <div class="pagination_to_right_button" ng-click="pageForward()"></div>
                </div>              

                <div class=add_task_area>
                    <div class=add_task_title>Добавить новое задвние</div>
                    <div class=add_task_content>  
                        <div class="add_task_form">
                            <div ng-class="form_add_chk ? ' task_checkbox_checked':'task_checkbox_unchecked'" ng-click="form_add_chk=form_add_chk?false:true;" ></div>
                            <div class="form_add_input"><input type="text" size ="53" ng-model="form_add_description"></div>
                            <div class="form_add_button" ng-click="addNewTask()"></div>                            
                        </div>                        
                    </div>
                </div>  <!-- add_task_area -->

            </article>
        </div> <!-- main_content -->

        <footer>
            <a href="https://github.com/avedensky/ToDoList">Copyleft AVedensky 2017</a>
        </footer>
    </div> <!-- wrapper -->
</body>
</html>

