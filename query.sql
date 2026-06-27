
create database assignment_3;


create table Users(
  user_id serial primary key,
  name varchar(20) not null,
  email varchar(100) unique,
  phone varchar(15),
  role varchar(20)not null
);

select * from users

create table Vehicles(
  vehicle_id serial primary key,
  name varchar(50),
  type varchar(50),
  model varchar(100) not null,
  registration_number varchar(20) not null unique,
  rental_price decimal(10,2) not null,
  status varchar(30)
);

CREATE TABLE Bookings (
    booking_id SERIAL PRIMARY KEY,
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
  ('David', 'david@example.com', '2233445566', 'Customer');
('Alice', 'alice@example.com',  '1234567890', 'Customer'),
('Bob', 'bob@example.com', '0987654321', 'Admin'),

('Charlie', 'charlie@example.com', '1122334455', 'Customer');

-- Inserting data into Vehicles table
INSERT INTO vehicles (name, type, model, registration_number, rental_price, status)
VALUES
('Toyota Corolla', 'car', '2022', 'ABC-123', 50, 'available'),
('Honda Civic', 'car', '2021', 'DEF-456', 60, 'rented'),
('Yamaha R15', 'bike', '2023', 'GHI-789', 30, 'available'),
('Ford F-150', 'truck', '2020', 'JKL-012', 100, 'maintenance'),
('Hyundai Elantra', 'car', '2023', 'MNO-345', 55, 'available'),
('Kawasaki Ninja 300', 'bike', '2022', 'PQR-678', 45, 'rented'),
('Tesla Model 3', 'car', '2024', 'STU-901', 120, 'available'),
('Isuzu D-Max', 'truck', '2021', 'VWX-234', 110, 'available'),
('Suzuki Swift', 'car', '2020', 'YZA-567', 40, 'rented'),
('Royal Enfield Classic 350', 'bike', '2023', 'BCD-890', 35, 'maintenance');

-- Insert data into booking table
INSERT INTO bookings (booking_id, user_id, vehicle_id, start_date, end_date, booking_status, total_cost)
VALUES
(1, 1, 2, '2023-10-01', '2023-10-05', 'Completed', 240),
(2, 1, 2, '2023-11-01', '2023-11-03', 'Completed', 120),
(3, 3, 2, '2023-12-01', '2023-12-02', 'Confirmed', 60),
(4, 1, 1, '2023-12-10', '2023-12-12', 'Pending', 100),
(5, 2, 3, '2023-10-15', '2023-10-17', 'Completed', 60),
(6, 2, 1, '2023-11-05', '2023-11-07', 'Completed', 120),
(7, 3, 4, '2023-11-20', '2023-11-25', 'Confirmed', 500),
(8, 4, 3, '2023-12-05', '2023-12-06', 'Pending', 30),
(9, 4, 2, '2023-12-15', '2023-12-18', 'Completed', 180),
(10, 2, 4, '2023-12-20', '2023-12-22', 'Confirmed', 300)



-- SQL Queries
-- Query 1: JOIN
select 
b.booking_id,
u.name AS customer_name,
v.name AS vehicle_name,
b.start_date,
b.end_date,
b.booking_status
From Bookings b
INNER JOIN users u
on b.user_id = u.user_id
INNER JOIN vehicles v
ON b.vehicle_id = v.vehicle_id;

-- Q_2: Exists

SELECT *
FROM Vehicles v
WHERE NOT EXISTS (
    SELECT 1
    FROM Bookings b
    WHERE b.vehicle_id = v.vehicle_id
);

-- Q_3: WHERE
SELECT *
FROM Vehicles
WHERE type = 'car'
AND status = 'available';

-- Q-4: Group by and having
SELECT
    v.name AS vehicle_name,
    COUNT(b.booking_id) AS total_bookings
FROM Vehicles v
INNER JOIN Bookings b
ON v.vehicle_id = b.vehicle_id
GROUP BY
    v.vehicle_id,
    v.name
HAVING COUNT(b.booking_id) > 2;