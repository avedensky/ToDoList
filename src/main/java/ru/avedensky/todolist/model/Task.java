package ru.avedensky.todolist.model;

import java.util.Date;
import javax.persistence.*;

/**
 * Created by alexey on 01.05.17.
 */
@Entity
@Table (name = "tasks")
public class Task {

    @Id
    @Column (name="id")
    @GeneratedValue (strategy = GenerationType.IDENTITY)
    private int id;

    @Column (name ="create_dt")
    private Date date;

    @Column (name="description")
    private String Description;

    @Column (name="hasDone")
    private Boolean hasDone;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String description) {
        Description = description;
    }

    public Boolean getHasDone() {
        return hasDone;
    }

    public void setHasDone(Boolean hasDone) {
        this.hasDone = hasDone;
    }

    @Override
    public String toString() {
        return "Task{" +
                "id=" + id +
                ", date=" + date +
                ", Description='" + Description + '\'' +
                ", hasDone=" + hasDone +
                '}';
    }
}
