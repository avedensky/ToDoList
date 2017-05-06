package ru.avedensky.todolist.dao;

import ru.avedensky.todolist.model.Task;

import java.util.List;

/**
 * Created by alexey on 01.05.17.
 */
public interface TaskDao {
    public int addTask (Task task);
    public void updateTask (Task task);
    public void removeTask (int id);
    public Task getTaskbyId (int id);
    public List<Task> listTasks ();
}
