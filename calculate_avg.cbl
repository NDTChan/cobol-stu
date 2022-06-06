
       IDENTIFICATION DIVISION.
       PROGRAM-ID. "CALCULATE_AVG".
       DATA DIVISION.
       LINKAGE SECTION.
           01 LS-TOTAL-MARKS PIC 9(10).
           01 LS-COUNT PIC 9(10).
           01 LS-AVG-MARKS PIC 9(2)V9(2).
       PROCEDURE DIVISION USING LS-TOTAL-MARKS, LS-COUNT, LS-AVG-MARKS.
           COMPUTE LS-AVG-MARKS = LS-TOTAL-MARKS / LS-COUNT.
       EXIT PROGRAM.
