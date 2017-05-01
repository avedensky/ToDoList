-- Create DataBase and add user
CREATE USER todouser@localhost identified BY '1234';
GRANT usage ON *.* TO todouser@localhost identified BY '1234';
CREATE DATABASE IF NOT EXISTS todo_list CHARACTER SET utf8;
GRANT ALL privileges ON todo_list.* TO todouser@localhost; USE todo_list;

# Fix Time Zone "Error" in MySQL JDBC Driver 6.0.6
# http://stackoverflow.com/questions/26515700/mysql-jdbc-driver-5-1-33-time-zone-issue#comment72115441_40245885
SET GLOBAL time_zone = '+3:00';

-- Create table
CREATE TABLE IF NOT EXISTS todo_list.tasks (
  id          INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  create_dt   DATETIME,
  description VARCHAR(79),
  hasDone     BIT NULL     DEFAULT 0
)
  ENGINE = InnoDB;

--  Fill data
INSERT INTO todo_list.tasks VALUES (1, 20170426161122, 'Завести репозиторий на GIT', 1);
INSERT INTO todo_list.tasks VALUES (2, 20170426171537, 'Создать проект на Maven', 1);
INSERT INTO todo_list.tasks VALUES (3, 20170426182121, 'Запустить и проверить что все работает', 1);
INSERT INTO todo_list.tasks VALUES (4, 20170426194152, 'Добавить gitignore  файл в проектную директорию', 1);
INSERT INTO todo_list.tasks VALUES (5, 20170426194152, 'Подвязать локальный проект к репозиторию', 1);
