-- Create DataBase and add user
#CREATE USER todouser@localhost identified BY '1234';
#GRANT usage ON *.* TO todouser@localhost identified BY '1234';
#CREATE DATABASE IF NOT EXISTS todo_list CHARACTER SET utf8;
#GRANT ALL privileges ON todo_list.* TO todouser@localhost; USE todo_list;

CREATE DATABASE IF NOT EXISTS test CHARACTER SET utf8;

-- Create table
CREATE TABLE IF NOT EXISTS test.tasks (
  id          INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  create_dt   DATETIME,
  description VARCHAR(79),
  hasDone     BIT NULL     DEFAULT 0
)
  ENGINE = InnoDB;

--  Fill data
INSERT INTO test.tasks VALUES (1, 20170426161122, 'Завести репозиторий на GIT', 1);
INSERT INTO test.tasks VALUES (2, 20170429171537, 'Создать проект на Maven', 1);
INSERT INTO test.tasks VALUES (3, 20170429182121, 'Запустить и проверить что все работает', 1);
INSERT INTO test.tasks VALUES (4, 20170426194152, 'Добавить gitignore  файл в проектную директорию', 0);
INSERT INTO test.tasks VALUES (5, 20170426194253, 'Подвязать локальный проект к репозиторию', 1);
INSERT INTO test.tasks VALUES (6, 20170501194454, 'Сделать красиво', 0);
INSERT INTO test.tasks VALUES (7, 20170502194454, 'Сделать скриншоты', 0);
INSERT INTO test.tasks VALUES (8, 20170503194454, 'Выложить ссылку', 0);