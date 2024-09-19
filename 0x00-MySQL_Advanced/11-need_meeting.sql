-- Task: Create a view need_meeting that lists students needing a meeting
-- Criteria: Score under 80 (strict) and no last_meeting or last_meeting more than 1 month ago

CREATE VIEW need_meeting AS
SELECT name
FROM students
WHERE score < 80
  AND (last_meeting IS NULL OR last_meeting < DATE_SUB(CURDATE(), INTERVAL 1 MONTH));
