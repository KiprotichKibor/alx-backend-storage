-- Task: Create a table 'users' with specific attributes and constraints
-- This script can be executed on any database without failing if the table already exists

-- Drop the table if it exists to avoid errors and ensure current schema
DROP TABLE IF EXISTS users;

-- Create the users table
CREATE TABLE users (
	-- id: primary key, auto-incrementing integer
	id INT AUTO_INCREMENT PRIMARY KEY,

	-- email: Unique, non-null string with maximum 255 characters
	email VARCHAR(255) NOT NULL UNIQUE,

	-- name: Optional string with maximu 255 characters
	name VARCHAR(255),

	-- country: Enumeration with default value 'US'
	country ENUM('US', 'CO', 'TN') NOT NULL DEFAULT 'US'
);
