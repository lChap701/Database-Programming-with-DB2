    
       WORKING-STORAGE SECTION.
       01  WKHOLD                  PIC X.
       
           EXEC SQL INCLUDE SQLCA END-EXEC. 
       
       01 MFSQLMESSAGETEXT  PIC X(250).  
       
            EXEC SQL BEGIN DECLARE SECTION END-EXEC.
      *       EXEC SQL INCLUDE Patron END-EXEC.        
       01  DCLEMPLOYEE.
           03 EMPNUM                     PIC  X(6).
           03 LASTNAME                   PIC  X(15).
           EXEC SQL END DECLARE SECTION END-EXEC.
       
  
         
       PROCEDURE DIVISION.
       RUN-START.
           DISPLAY 'START'.
           ACCEPT WKHOLD.
           EXEC SQL 
               WHENEVER SQLERROR perform OpenESQL-Error 
           END-EXEC.
           PERFORM CONNECT-TO-DATABASE.
           PERFORM SELECT-DATA.
           PERFORM SHUT-DOWN.
                  
       CONNECT-TO-DATABASE.    
            EXEC SQL 
                CONNECT TO SAMPLE 
            END-EXEC.
           

       SELECT-DATA.    
               MOVE '000320' TO  EMPNUM.
               EXEC SQL 
                   SELECT lastname
                   INTO :LASTNAME
                   FROM  Employee
                      WHERE EMPNO = :EMPNUM
                       
               END-EXEC. 
               IF SQLCODE = 0 
                   display 'Employee ' EMPNUM ' ' LASTNAME
               ELSE
                   display 'Employee not found'
                           
               END-IF.
          
           
           DISPLAY 'Press enter to continue'.
           ACCEPT WKHOLD.
       SHUT-DOWN.    
               
          
           Display 'Program stopping '
            ACCEPT WKHOLD.
           Stop 'Press <CR> to terminate'
           STOP RUN
           .
       OpenESQL-Error Section.
       
           display "SQL Error = " sqlstate " " sqlcode 
           display MFSQLMESSAGETEXT 
           ACCEPT WKHOLD
           stop run
           .
       
       
       WORKING-STORAGE SECTION.
       01  WKHOLD                  PIC X.
       
           EXEC SQL INCLUDE SQLCA END-EXEC. 
       
       01 MFSQLMESSAGETEXT  PIC X(250).  
       
            EXEC SQL BEGIN DECLARE SECTION END-EXEC.
      *       EXEC SQL INCLUDE Patron END-EXEC.        
       01  DCLEMPLOYEE.
           03 EMPNUM                     PIC  X(6).
           03 LASTNAME                   PIC  X(15).
           EXEC SQL END DECLARE SECTION END-EXEC.
       
  
         
       PROCEDURE DIVISION.
       RUN-START.
           DISPLAY 'START'.
           ACCEPT WKHOLD.
           EXEC SQL 
               WHENEVER SQLERROR perform OpenESQL-Error 
           END-EXEC.
           PERFORM CONNECT-TO-DATABASE.
           PERFORM SELECT-DATA.
           PERFORM SHUT-DOWN.
                  
       CONNECT-TO-DATABASE.    
            EXEC SQL 
                CONNECT TO SAMPLE 
            END-EXEC.
           

       SELECT-DATA.    
               MOVE '000320' TO  EMPNUM.
               EXEC SQL 
                   SELECT lastname
                   INTO :LASTNAME
                   FROM  Employee
                      WHERE EMPNO = :EMPNUM
                       
               END-EXEC. 
               IF SQLCODE = 0 
                   display 'Employee ' EMPNUM ' ' LASTNAME
               ELSE
                   display 'Employee not found'
                           
               END-IF.
          
           
           DISPLAY 'Press enter to continue'.
           ACCEPT WKHOLD.
       SHUT-DOWN.    
               
          
           Display 'Program stopping '
            ACCEPT WKHOLD.
           Stop 'Press <CR> to terminate'
           STOP RUN
           .
       OpenESQL-Error Section.
       
           display "SQL Error = " sqlstate " " sqlcode 
           display MFSQLMESSAGETEXT 
           ACCEPT WKHOLD
           stop run
           .