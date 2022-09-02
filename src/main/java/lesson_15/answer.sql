DO $$

BEGIN
    IF
(SELECT COUNT(*) FROM grades) >
        (SELECT COUNT(*) FROM students)
    THEN
        RAISE NOTICE 'More grades than students.';
ELSE
        RAISE NOTICE 'Equal or more students than grades.';
END IF;

END $$;