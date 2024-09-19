-- Task: Create an index idx_name_first on the first letter of the name column in the names table
-- This index will improve query performance for searches based on the first letter of names

CREATE INDEX idx_name_first ON names (LEFT(NAME, 1));
