
CREATE PROCEDURE FetchStudentRecords()
BEGIN
    -- Declare variables for StudentID, StudentName, and DepartmentID
    DECLARE v_student_id INT;
    DECLARE v_student_name VARCHAR(100);
    DECLARE v_department_id INT;
    
    -- Declare flag for cursor loop completion
    DECLARE done INT DEFAULT FALSE;
    
    -- Declare cursor for selecting StudentID, StudentName, DepartmentID from Student
    DECLARE student_cursor CURSOR FOR 
        SELECT StudentID, StudentName, DepartmentID 
        FROM Student;
        
    -- Declare NOT FOUND handler to set done flag when cursor reaches end of dataset
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    -- Open cursor
    OPEN student_cursor;
    
    -- Loop through records
    read_loop: LOOP
        FETCH student_cursor INTO v_student_id, v_student_name, v_department_id;
        
        -- Exit loop when no more records exist
        IF done THEN
            LEAVE read_loop;
        END IF;
        
        -- Display the fetched record values
        SELECT v_student_id AS StudentID, v_student_name AS StudentName, v_department_id AS DepartmentID;
    END LOOP;
    
    -- Close cursor
    CLOSE student_cursor;

END //

DELIMITER ;
