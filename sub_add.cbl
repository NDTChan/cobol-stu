       IDENTIFICATION DIVISION.
       PROGRAM-ID. "SUB_ADD".

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
       SELECT  STUDENT-RECORD-FILE
                     ASSIGN TO "INDEX-STU-RECORD.TXT"
                       ORGANIZATION IS INDEXED
                         RECORD KEY IS STUDENT-NUMBER
                           ACCESS MODE IS SEQUENTIAL
                             FILE STATUS IS STATUS-FIELD.

       DATA DIVISION.
       FILE SECTION.
       FD  STUDENT-RECORD-FILE.
       01 STUDENT-RECORD.
           05 STUDENT-NUMBER  PIC 9(06).
           05 STUDENT-NAME    PIC X(10).
           05 STUDENT-SCORE    PIC 9(02).

       WORKING-STORAGE SECTION.
       01 WS-STUDENT-INFOR PIC X(50).
       01 WS-STUDENT-RECORD.
           05 WS-STUDENT-NUMBER  PIC 9(06).
           05 WS-STUDENT-NAME    PIC X(10).
           05 WS-STUDENT-SCORE    PIC 9(02).
       01 CONTROL-FIELDS.
           05 DICISION-FLAG    PIC X(3) VALUE "Y".
       01  STATUS-FIELD     PIC X(2).
       LINKAGE SECTION.
       PROCEDURE DIVISION.
       100-PRODUCE-STUDENT-RECORDS.
           PERFORM 201-INITIATE-STUDENT-RECORD.
           PERFORM 202-ENTER-STUDENT-RECORD UNTIL DICISION-FLAG = "N".
           PERFORM 203-CLOSE-FILE.
           GOBACK.

       201-INITIATE-STUDENT-RECORD.
           PERFORM 301-OPEN-FILE.

       202-ENTER-STUDENT-RECORD.
           PERFORM 303-INPUT-DATA.
           PERFORM 304-WRITE-DATA.
           PERFORM 302-PROMPT-WHETHER-ENTER-RECORD.

       203-CLOSE-FILE.
           CLOSE STUDENT-RECORD-FILE.
           MOVE "Y" TO DICISION-FLAG.

       301-OPEN-FILE.
           OPEN OUTPUT STUDENT-RECORD-FILE.

       302-PROMPT-WHETHER-ENTER-RECORD.
           DISPLAY "WANT TO ADD MORE? Y/N".
           ACCEPT DICISION-FLAG.

       303-INPUT-DATA.
           DISPLAY "ENTER STUDENT INFORMATION (FORMAT: ID-NAME-SCORE)".
           ACCEPT WS-STUDENT-INFOR.

           UNSTRING WS-STUDENT-INFOR DELIMITED BY '-'
               INTO WS-STUDENT-NUMBER, WS-STUDENT-NAME, WS-STUDENT-SCORE
           END-UNSTRING.

       304-WRITE-DATA.
           WRITE  STUDENT-RECORD FROM WS-STUDENT-RECORD
           INVALID KEY PERFORM 401-ERROR-RTN.

       401-ERROR-RTN.
             DISPLAY "Not find key".

       END PROGRAM "SUB_ADD".