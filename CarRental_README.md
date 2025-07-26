
# Car Rental System Database Project

This project sets up a **Car Rental System** using SQL. It creates tables for Customers, Cars, Staff, and Rentals, and demonstrates queries for various use cases like customer details, available cars, current rentals, and rental history.

---

## 📁 Database Name
```
car_rental_system
```

---

## 📦 Tables & Descriptions

### 1. Customer
Stores information about customers renting cars.

| Field | Type | Description |
|-------|------|-------------|
| Customer_ID | INT | Primary Key |
| Name | VARCHAR(100) | Customer's full name |
| License_Number | VARCHAR(20) | Driving license |
| Contact | VARCHAR(15) | Phone number |

---

### 2. Car
Details of available cars.

| Field | Type | Description |
|-------|------|-------------|
| Car_ID | INT | Primary Key |
| Model | VARCHAR(50) | Car model |
| Category | VARCHAR(30) | SUV, Sedan, etc. |
| Manufacturer | VARCHAR(50) | Brand name |
| Availability_Status | VARCHAR(20) | Rented / Available |

---

### 3. Staff
Info on support staff, drivers, admins, etc.

| Field | Type | Description |
|-------|------|-------------|
| Staff_ID | INT | Primary Key |
| Name | VARCHAR(100) | Name of staff member |
| Role | VARCHAR(50) | Admin, Driver, Mechanic, etc. |
| Contact | VARCHAR(15) | Phone number |

---

### 4. Rental
Track rental transactions with amount and dates.

| Field | Type | Description |
|-------|------|-------------|
| Rental_ID | INT | Primary Key |
| Customer_ID | INT | Foreign Key → Customer |
| Car_ID | INT | Foreign Key → Car |
| Rental_Date | DATE | Start date |
| Return_Date | DATE | End date (can be NULL) |
| Total_Amount | DECIMAL(10,2) | Amount charged |

---

## 📊 Sample SQL Queries

- All data from all tables
- List of available cars
- Contact info of all customers
- Admin staff details
- List of currently rented cars
- Rental amount by Rental ID
- Cars by Toyota
- Rentals made by a specific customer
- Drivers list

---

## ✅ Usage

Run the script in any MySQL environment like XAMPP, phpMyAdmin, MySQL Workbench.

---

## 🧠 Author Notes

Perfect for beginner SQL learners and database design practice for rental businesses.

