DELIMITER //

CREATE PROCEDURE FetchStudentRecords()
BEGIN
    DECLARE v_student_id INT;
    DECLARE v_student_name VARCHAR(100);
    DECLARE v_department_id INT;
    DECLARE done INT DEFAULT FALSE;

    DECLARE student_cursor CURSOR FOR 
        SELECT StudentID, StudentName, DepartmentID 
        FROM Student;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN student_cursor;

    read_loop: LOOP
        FETCH student_cursor INTO v_student_id, v_student_name, v_department_id;
        
        IF done THEN
            LEAVE read_loop;
        END IF;

        -- Display output for each iteration
        SELECT v_student_id AS StudentID, v_student_name AS StudentName, v_department_id AS DepartmentID;
    END LOOP;

    CLOSE student_cursor;
END //
