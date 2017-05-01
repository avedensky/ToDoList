package ru.avedensky.todolist.service;

import ru.avedensky.todolist.model.Task;

import java.util.List;

/**
 * Created by alexey on 01.05.17.
 */
public interface TaskService {
    public void addTask(Task task);
    public void updateTask(Task task);
    public void removeTask(int id);
    public Task getTaskById(int id);
    public List<Task> listTasks();
}
