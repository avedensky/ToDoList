package ru.avedensky.todolist.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import ru.avedensky.todolist.model.Task;
import ru.avedensky.todolist.service.TaskService;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by alexey on 01.05.17.
 */

@Controller
public class TaskController {
    private TaskService taskService;

    @Autowired(required = true)
    @Qualifier(value = "taskService")
    public void setTaskService(TaskService taskService) {
        this.taskService = taskService;
    }

    @RequestMapping(value = "tasks", method = RequestMethod.GET)
    public String listTasks(Model model){
        model.addAttribute("task", new Task());
        model.addAttribute("listTasks", this.taskService.listTasks());


//        List<Task> lst = new ArrayList<Task>();
//
//        Task tsk=new Task();
//        tsk.setId(1);
//        tsk.setDate(null);
//        tsk.setDescription("bla bla");
//        tsk.setHasDone(true);
//
//        lst.add(tsk);
//        model.addAttribute("listTasks", lst);

        return "tasks";
    }

    @RequestMapping(value = "/tasks/add", method = RequestMethod.POST)
    public String addTask(@ModelAttribute("task") Task task){
        if(task.getId() == 0){
            this.taskService.addTask(task);
        }else {
            this.taskService.updateTask(task);
        }

        return "redirect:/tasks";
    }

    @RequestMapping("/remove/{id}")
    public String removeTask(@PathVariable("id") int id){
        this.taskService.removeTask(id);

        return "redirect:/tasks";
    }

    @RequestMapping("edit/{id}")
    public String editTask(@PathVariable("id") int id, Model model){
        model.addAttribute("task", this.taskService.getTaskById(id));
        model.addAttribute("listTasks", this.taskService.listTasks());

        return "tasks";
    }

    @RequestMapping("taskdata/{id}")
    public String TaskData(@PathVariable("id") int id, Model model){
        model.addAttribute("task", this.taskService.getTaskById(id));

        return "taskdata";
    }
}
