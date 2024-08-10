-- Create users table if it doesn't exist
-- Attributes:
--   id: integer, auto-incrementing primary key
--   email: varchar(255), unique and not null
--   name: varchar(255)
-- This script is designed to be database-agnostic

CREATE TABLE IF NOT EXISTS users (
	    id INTEGER PRIMARY KEY AUTO_INCREMENT,
	    email VARCHAR(255) NOT NULL UNIQUE,
	    name VARCHAR(255)
	);
