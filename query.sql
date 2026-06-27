
create database assignment_3;

-- create User
create table Users(
  user_id serial primary key,
  name varchar(20) not null,
  email varchar(100) unique,
  phone int,
  role varchar(20)not null
);

-- create Vehicles
create table Vehicles(
  vehicle_id serial primary key,
  name varchar(50),
  type varchar(50),
  model varchar(100) not null,
  registration_number varchar(20) not null unique,
  rental_price decimal(10,2) not null,
  status varchar(30)
);

-- create Bookings
CREATE TABLE Bookings (
    booking_id INT PRIMARY KEY,
    user_id INT NOT NULL,
    vehicle_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    booking_status VARCHAR(20) NOT NULL
        CHECK (booking_status IN ('Pending', 'Confirmed', 'Completed', 'Cancelled')),
    total_cost DECIMAL(10,2) NOT NULL,

    FOREIGN KEY (user_id)
        REFERENCES Users(user_id),

    FOREIGN KEY (vehicle_id)
        REFERENCES Vehicles(vehicle_id)
);


-- Inserting data into Users column
INSERT INTO Users (name, email, phone, role)
VALUES
('Alice', 'alice@example.com',  '1234567890', 'Customer'),
('Bob', 'bob@example.com', '0987654321', 'Admin'),
('Charlie', 'charlie@example.com', '1122334455', 'Customer');
