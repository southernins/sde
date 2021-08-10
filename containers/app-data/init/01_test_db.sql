
CREATE DATABASE `test-data`;
CREATE USER 'test-dev'@'%' IDENTIFIED BY 'test-dev';
GRANT ALL ON `test-data`.* TO 'test-dev'@'%';


