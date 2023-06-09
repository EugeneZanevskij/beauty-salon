CREATE DATABASE beauty_salon;

USE beauty_salon;

CREATE TABLE administrator (
  id INT AUTO_INCREMENT PRIMARY KEY,
  login VARCHAR(30) NOT NULL,
  password VARCHAR(30) NOT NULL
);

CREATE TABLE client (
  id INT AUTO_INCREMENT PRIMARY KEY,
  firstName VARCHAR(30) NOT NULL,
  lastName VARCHAR(30) NOT NULL,
  phone_number VARCHAR(20),
  email VARCHAR(50),
  birthday DATE,
  password VARCHAR(255)
);

CREATE TABLE master (
  id INT AUTO_INCREMENT PRIMARY KEY,
  firstName VARCHAR(30) NOT NULL,
  lastName VARCHAR(30) NOT NULL,
  coefficient DECIMAL(6, 2) NOT NULL,
  CHECK (coefficient>=1)
);

CREATE TABLE category (
  id INT AUTO_INCREMENT PRIMARY KEY,
  category VARCHAR(40) NOT NULL
);

CREATE TABLE services (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  category_id INT NOT NULL,
  price DECIMAL(10, 2) NOT NULL,
  duration_minutes INT NOT NULL,
  FOREIGN KEY (category_id) REFERENCES category(id) ON DELETE RESTRICT ON UPDATE RESTRICT
);

CREATE TABLE master_services (
  id INT AUTO_INCREMENT PRIMARY KEY,
  master_id INT,
  service_id INT,
  FOREIGN KEY (master_id) REFERENCES master(id) ON DELETE RESTRICT ON UPDATE RESTRICT,
  FOREIGN KEY (service_id) REFERENCES services(id) ON DELETE RESTRICT ON UPDATE RESTRICT
);

CREATE TABLE client_master_services (
  id INT AUTO_INCREMENT PRIMARY KEY,
  client_id INT,
  master_service_id INT,
  date_signup DATE NOT NULL,
  time_signup TIME NOT NULL,
  FOREIGN KEY (client_id) REFERENCES client(id) ON DELETE RESTRICT ON UPDATE RESTRICT,
  FOREIGN KEY (master_service_id) REFERENCES master_services(id) ON DELETE RESTRICT ON UPDATE RESTRICT
);