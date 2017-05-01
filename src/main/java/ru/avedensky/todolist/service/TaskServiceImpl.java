package ru.avedensky.todolist.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ru.avedensky.todolist.dao.TaskDao;
import ru.avedensky.todolist.model.Task;

import java.util.List;

/**
 * Created by alexey on 01.05.17.
 */

@Service
public class TaskServiceImpl implements TaskService{
    private TaskDao taskDao;

    public void setTaskDao(TaskDao bookDao) {
        this.taskDao = bookDao;
    }

    @Transactional
    public void addTask(Task task) {
        this.taskDao.addTask(task);

    }

    @Transactional
    public void updateTask(Task task) {
        this.taskDao.updateTask(task);

    }

    @Transactional
    public void removeTask(int id) {
        this.taskDao.removeTask(id);

    }

    @Transactional
    public Task getTaskById(int id) {
        return this.taskDao.getTaskbyId(id);
    }

    @Transactional
    public List<Task> listTasks() {
        return this.taskDao.listTasks();
    }
}
