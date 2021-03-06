
       WORKING-STORAGE SECTION.
      *    REPRESENTS THE ENTER KEY
       01  WKHOLD                          PIC X.
      *    REPRESENTS THE OPTIONS THAT THE USER SELECTED
       01  WKOP                            PIC X.
      *    USED TO STORE THE AMOUNT OF EXTRA SPACES
       01  EXTRASPACES                     PIC 9(2)        VALUE 0.
      *    USED TO HOLD THE NUMERIC DATA THAT WAS ENTERED BY THE USER
       01  WKSTOR                          PIC X(5).
       01  WKRAM                           PIC X(5).
       01  WKWAR                           PIC X.
      *    CHARACTER COUNT VARIABLES USED FOR TALLYING
       01  SPACES-CNT                      PIC 9           VALUE 0.
       01  HYPHEN-CNT                      PIC 9           VALUE 0.
       01  DEC-CNT                         PIC 9           VALUE 0.
      *    USED TO CALCULATE LENGTH FOR VARCHAR VARIABLES
       01  LEN                             PIC S9(9)       VALUE 0 COMP.
      *    COUNTER VARIABLES
       01  ERRCTR                          PIC 9           VALUE 0.
       01  UPDATECTR                       PIC 9           VALUE 0.
      *    SWITCHES
       01  DECINVAL-SW                     PIC X           VALUE 'N'.
       01  CPUINVAL-SW                     PIC X           VALUE 'N'.

       01  NUMCPU                          PIC 9(20).

           EXEC SQL INCLUDE SQLCA END-EXEC.
       01  MFSQLMESSAGETEXT                PIC X(250).

      *****************HOST VARIABLE DECLARATION AREA*******************
           EXEC SQL BEGIN DECLARE SECTION END-EXEC.
      ************************CUSTOMERS TABLE***************************
      *    CONTAINS ALL THE VARIABLES THAT ARE NOT PART OF A VARCHAR
      *    COLUMN IN THE CUSTOMERS TABLE.
       01  CUST-NO-VARCHAR.
      ************************CHAR VARIABLES****************************
           03  PK-CUSTID                   PIC X(4).
           03  RECUR                       PIC X.
      *************************INT VARIABLES****************************
           03  UNITNUM                     PIC S9(9)       COMP.
           03  ZIP                         PIC S9(9)       COMP.
      ***********************NULLABLE VARIABLE**************************
           03  NL-EMAIL                    PIC S9(4)       COMP.
      ***********************VARCHAR VARIABLES**************************
       01  FNAME.
           49  FNAME-LENG                  PIC S9(4)       COMP.
           49  FNAME-VALUE                 PIC X(12).
       01  LNAME.
           49  LNAME-LENG                  PIC S9(4)       COMP.
           49  LNAME-VALUE                 PIC X(12).
       01  STREET.
           49  STREET-LENG                 PIC S9(4)       COMP.
           49  STREET-VALUE                PIC X(20).
       01  CITY.
           49  CITY-LENG                   PIC S9(4)       COMP.
           49  CITY-VALUE                  PIC X(20).
       01  ST.
           49  ST-LENG                     PIC S9(4)       COMP.
           49  ST-VALUE                    PIC XX.
       01  EMAIL.
           49  EMAIL-LENG                  PIC S9(4)       COMP.
           49  EMAIL-VALUE                 PIC X(30).
      ******************************************************************

      ************************ORDERS TABLE******************************
      *    CONTAINS ALL THE VARIABLES THAT ARE NOT PART OF A VARCHAR
      *    COLUMN IN THE ORDERS TABLE.
       01  ORD-NO-VARCHAR.
      ***********************CHAR VARIABLES*****************************
           03  PK-ORDERID                  PIC X(4).
           03  FK-CUSTID                   PIC X(4).
      ***********************DATE VARIABLES*****************************
           03  ORDERDATE                   PIC X(10).
           03  SHIPDATE                    PIC X(10).
           03  ARRIVALDATE                 PIC X(10).
      ************************DEC VARIABLE******************************
           03  SHIPFEE                     PIC S9V99       COMP-3.
      *********************NULLABLE VARIABLES***************************
           03  NL-SHIPDATE                 PIC S9(4)       COMP.
           03  NL-ARRIVALDATE              PIC S9(4)       COMP.
           03  NL-SHIPCITY                 PIC S9(4)       COMP.
           03  NL-SHIPST                   PIC S9(4)       COMP.
           03  NL-SHIPFEE                  PIC S9(4)       COMP.
      **********************VARCHAR VARIABLES***************************
       01  SHIPCITY.
           49 SHIPCITY-LENG                PIC S9(4)       COMP.
           49 SHIPCITY-VALUE               PIC X(20).
       01  SHIPST.
           49  SHIPST-LENG                 PIC S9(4)       COMP.
           49  SHIPST-VALUE                PIC XX.
      ******************************************************************
           
      ************************COMPANY TABLE*****************************
      *    CONTAINS ALL THE VARIABLES THAT ARE NOT PART OF A VARCHAR
      *    COLUMN IN THE COMPANY TABLE.
       01  COMP-NO-VARCHAR.
      ************************CHAR VARIABLE*****************************
           03  PK-COMPID                   PIC X(4).
      *********************NULLABLE VARIABLES***************************
           03  NL-ADDR                     PIC S9(4)       COMP.
           03  NL-EMAILADDR                PIC S9(4)       COMP.
           03  NL-PHONE                    PIC S9(4)       COMP.
      **********************VARCHAR VARIABLES***************************
       01  COMPNAME.
           49  COMPNAME-LENG               PIC S9(4)       COMP.
           49  COMPNAME-VALUE              PIC X(25).
       01  ADDR.
           49  ADDR-LENG                   PIC S9(4)       COMP.
           49  ADDR-VALUE                  PIC X(52).
       01  EMAILADDR.
           49  EMAILADDR-LENG              PIC S9(4)       COMP.
           49  EMAILADDR-VALUE             PIC X(30).
       01  PHONE.
           49  PHONE-LENG                  PIC S9(4)       COMP.
           49  PHONE-VALUE                 PIC X(16).
      ******************************************************************

      ************************LAPTOPS TABLE*****************************
      *    CONTAINS ALL THE VARIABLES THAT ARE NOT PART OF A VARCHAR
      *    COLUMN IN THE LAPTOPS TABLE.
       01  LAP-NO-VARCHAR.
      ***********************CHAR VARIABLES*****************************
           03  PK-LAPID                    PIC X(4).
           03  FK-COMPID                   PIC X(4).
      ************************INT VARIABLES*****************************
           03  YEAR                        PIC S9(9)       COMP.
           03  WARRANTY                    PIC S9(9)       COMP.
      ************************DEC VARIABLES*****************************
           03  STORAGE                     PIC S9(3)V9     COMP-3.
           03  RAM                         PIC S9(3)V9     COMP-3.
           03  PRICE                       PIC S9(6)V99    COMP-3.
      *********************NULLABLE VARIABLES***************************
           03  NL-OS                       PIC S9(4)       COMP.
           03  NL-STORAGE                  PIC S9(4)       COMP.
           03  NL-CPU                      PIC S9(4)       COMP.
           03  NL-RAM                      PIC S9(4)       COMP.
           03  NL-WARRANTY                 PIC S9(4)       COMP.
      **********************VARCHAR VARIABLES***************************
       01  LAPNAME.
           49  LAPNAME-LENG                PIC S9(4)       COMP.
           49  LAPNAME-VALUE               PIC X(25).
       01  PRODNUM.
           49  PRODNUM-LENG                PIC S9(4)       COMP.
           49  PRODNUM-VALUE               PIC X(10).
       01  SERIAL.
           49  SERIAL-LENG                 PIC S9(4)       COMP.
           49  SERIAL-VALUE                PIC X(8).
       01  OS.
           49  OS-LENG                     PIC S9(4)       COMP.
           49  OS-VALUE                    PIC X(15).
       01  CPU.
           49  CPU-LENG          	       PIC S9(4)       COMP.
           49  CPU-VALUE         	       PIC X(20).
      ******************************************************************

      *********************LAPTOPORDERS TABLE***************************
      *    CONTAINS ALL THE VARIABLES THAT ARE NOT PART OF A VARCHAR
      *    COLUMN IN THE LAPTOPORDERS TABLE.
       01  LAPORD-NO-VARCHAR.
      ***********************CHAR VARIABLES*****************************
           03  FK-ORDERID                  PIC X(4).
           03  FK-LAPID                    PIC X(4).
      ************************INT VARIABLE******************************
           03  QTY                         PIC S9(9)       COMP.
      ************************DEC VARIABLES*****************************
           03  ORDERCOST                   PIC S9(9)V99    COMP-3.
           03  DEALS                       PIC SV99        COMP-3.
      **********************NULLABLE VARIABLE***************************
           03  NL-DEALS                    PIC S9(4)       COMP.
      ******************************************************************
           EXEC SQL END DECLARE SECTION END-EXEC.
      ******************************************************************
      *    CONTAINS ALL THE FORMATTED VARIABLES
       01  FORMATTED-DATA.
           05  O-UNITNUM                   PIC ZZ9.
           05  O-ZIP                   	   PIC 9(5).
           05  O-SHIPFEE     			   PIC $9.99.
      *    USED TO CONTAIN EACH PART OF THE PHONE NUMBER
           05  WKPHNE-1                    PIC 9           VALUE 0.
           05  WKPHNE-2.
               10  WKOPPARA                PIC X           VALUE ' '.
               10  WKDIGITS                PIC 9(3)        VALUE 0.
               10  WKCLPARA                PIC X           VALUE ' '.
           05  WKPHNE-3.                    
               10  WKDIGITS-1              PIC 9(3)        VALUE 0.
               10  WKHYPHEN                PIC X           VALUE ' '.
               10  WKDIGITS-2              PIC 9(4)        VALUE 0.
      *    USED TO CONTAIN THE 1ST AND 3RD PARTS OF THE PHONE NUMBER 
      *    WHEN PHONE IS INVALID
           05  WKPHNE-4.
               10  WKINDIGIT               PIC 9           VALUE 0.
               10  WKINCHAR-1              PIC X           VALUE ' '.
           05  WKPHNE-5.
               10  WKINCHAR-2              PIC X           VALUE ' '.
               10  WKINDIGITS-1            PIC 9(3)        VALUE 0.
               10  WKINHYPHEN              PIC X           VALUE ' '.
               10  WKINDIGITS-2            PIC 9(4)        VALUE 0. 
           05  O-YEAR					   PIC 9(4).
      *    VARIABLE USED TO HOLD THE CONTENTS OF STORAGE AND RAM
           05  WKGB			               PIC ZZZ.9.
      *    FORMATTED STORAGE AND RAM VARIABLES CONTAINING 'GB' AND NO
      *    LEADING SPACES
           05  O-STORAGE                   PIC X(8).
           05  O-RAM					   PIC X(8).
      *    USED TO CONTAIN NUMBER BEFORE AND AFTER THE DECIMAL FOR THE
      *    STORAGE AND RAM VARIABLES
           05  WKBFEDEC                    PIC X(3).
           05  WKATRDEC                    PIC X(2).
      *    USED TO CONTAIN CHARACTERS FROM CPU WHILE ITS BEING
      *    UNSTRINGED
           05  WKWORD-1                    PIC X(20).
           05  WKWORD-2                    PIC X(20).
           05  WKHZ                        PIC X(20).
           05  WKHZ-1                      PIC X(6).
           05  WKHZ-2                      PIC X(2).
           05  O-PRICE        			   PIC $$$$,$$$.99.
           05  O-WARRANTY				   PIC 9.
           05  O-QTY     				   PIC ZZ9.
           05  O-ORDERCOST				   PIC $$$$,$$$,$$$.99.
           05  O-DEALS					   PIC V99.

       PROCEDURE DIVISION.
       RUN-START.
           DISPLAY 'WELCOME, PRESS ENTER TO CONTINUE'.
           ACCEPT WKHOLD.
           EXEC SQL
               WHENEVER SQLERROR PERFORM OPENESQL-ERROR
           END-EXEC.
           PERFORM CONNECT.
           PERFORM SELECT-OPTION.

           IF WKOP = '1'
               PERFORM UPDATE-COMP
           ELSE
               IF WKOP = '2'
                   PERFORM UPDATE-LAP-OP
               ELSE
                   DISPLAY 'INVALID OPTION, PRESS ENTER TO CONTINUE'.

           IF ERRCTR = 0 AND UPDATECTR > 0
               PERFORM SAVE-CHANGES.

           PERFORM SHUT-DOWN.

       CONNECT.
           EXEC SQL
               CONNECT TO SAMPLE
           END-EXEC.

       SELECT-OPTION.
           DISPLAY 'SELECT AN OPTION: '.
           DISPLAY '1 - COMPANY'.
           DISPLAY '2 - LAPTOP'.
           ACCEPT WKOP.

       UPDATE-COMP.
           DISPLAY 'ENTER THE COMPANY ID: '.
           ACCEPT PK-COMPID.

           PERFORM PREUPDATE-COMP.
           IF ERRCTR = 0
               EXEC SQL
                   UPDATE COMPANY
                       SET PHONE = :PHONE :NL-PHONE
                       WHERE COMPANYID = :PK-COMPID
               END-EXEC.
               IF SQLCODE = 0
                   IF UPDATECTR = 0
                       DISPLAY 'COMPANY ' PK-COMPID ' HAD ' UPDATECTR
                               ' FIELDS UPDATED'
                   ELSE
                       DISPLAY 'COMPANY ' PK-COMPID ' HAD ' UPDATECTR
                               ' FIELD UPDATED'
               ELSE
                   IF PK-COMPID = ' '
                       DISPLAY
                       'NOTHING WAS ENTERED, UNABLE TO UPDATE TABLE'
                   ELSE
                       DISPLAY 'COMPANY ' PK-COMPID ' WAS NOT UPDATED'.

           DISPLAY 'PRESS ENTER TO CONTINUE'.
           ACCEPT WKHOLD.

       PREUPDATE-COMP.
           PERFORM SELECT-COMP.

           IF ERRCTR = 0
               PERFORM CHANGE-VALUE-COMP.

           IF UPDATECTR = 0
               DISPLAY 'PRESS ENTER TO CONTINUE'
               ACCEPT WKHOLD.

       SELECT-COMP.
           PERFORM PRESELECT-COMP.
           EXEC SQL
               SELECT PHONE
               INTO :PHONE :NL-PHONE
               FROM COMPANY
               WHERE COMPANYID = :PK-COMPID
           END-EXEC.
           IF SQLCODE = 0
               DISPLAY 'COMPANY WAS FOUND, PRESS ENTER TO CONTINUE'
               ACCEPT WKHOLD
               PERFORM DISPLAY-COMP
           ELSE
               IF PK-COMPID = ' '
                   DISPLAY 'NOTHING WAS ENTERED, UNABLE TO SELECT '
                   ADD 1 TO ERRCTR
               ELSE
                   DISPLAY 'COMPANY ' PK-COMPID ' WAS NOT FOUND'
                   ADD 1 TO ERRCTR.

       PRESELECT-COMP.
      *    CLEARS VALUES IN VARCHAR FIELD PHONE
           MOVE ' ' TO PHONE-VALUE.

      *    CLEARS VALUES IN THE INDICATOR PHONE VARIABLE
           MOVE 0 TO NL-PHONE.

       DISPLAY-COMP.
           DISPLAY 'COMPANY ID: ' PK-COMPID.

           IF NL-PHONE < 0
               DISPLAY 'PHONE NUMBER: UNKNOWN'
           ELSE
               DISPLAY 'PHONE NUMBER: ' PHONE-VALUE.

       CHANGE-VALUE-COMP.
           DISPLAY 'DO YOU WISH TO UPDATE THE PHONE NUMBER FIELD?'.
           DISPLAY 'Y - YES'.
           DISPLAY 'N - NO'.
           ACCEPT WKOP.
       
      *    UPPER-CASE USED TO FORCE INPUT TO UPPERCASE
           IF FUNCTION UPPER-CASE(WKOP) = 'Y'
               PERFORM CHANGE-PHONE.

       CHANGE-PHONE.
           DISPLAY
       'ENTER THE VALUE YOU WANT TO CHANGE THE COMPANY''S PHONE NUMBER'
      -                                                         ' TO: '.
           ACCEPT PHONE-VALUE.
           PERFORM CALC-LEN-PHONE.

           IF PHONE-VALUE = ' '
               MOVE -1 TO NL-PHONE
               ADD 1 TO UPDATECTR
           ELSE
               IF PHONE-VALUE NOT ALPHABETIC
                   INSPECT PHONE-VALUE TALLYING SPACES-CNT FOR ALL ' '

                   IF PHONE-LENG < 15
                       DISPLAY 
         'PHONE NUMBER TOO SHORT, IT SHOULD BE 15 TO 16 CHARACTERS LONG'
                       ADD 1 TO ERRCTR
      *    CALCULATES TRAILING SPACES
                       SUBTRACT PHONE-LENG FROM 16 GIVING EXTRASPACES
                   END-IF

                   IF SPACES-CNT NOT = 2 
                       IF EXTRASPACES = 0
                           DISPLAY 'PHONE NUMBER SHOULD HAVE 2 SPACES'
                           ADD 1 TO ERRCTR
                           UNSTRING PHONE-VALUE DELIMITED BY ' '
                               INTO WKPHNE-4, WKPHNE-2, WKPHNE-5
                           END-UNSTRING
                       ELSE
                           INSPECT PHONE-VALUE
                               TALLYING HYPHEN-CNT FOR ALL '-'
                           UNSTRING PHONE-VALUE DELIMITED BY ' '
                               INTO WKPHNE-1, WKPHNE-2, WKPHNE-3
                           END-UNSTRING
                       END-IF
                   ELSE
                       UNSTRING PHONE-VALUE DELIMITED BY ' '
                           INTO WKPHNE-1, WKPHNE-2, WKPHNE-3
                       END-UNSTRING
                   END-IF

                   IF WKOPPARA NOT = '(' OR WKCLPARA NOT = ')'
                       DISPLAY 
                       'PHONE NUMBER SHOULD HAVE A PAIR OF PARANETHISES'
                       ADD 1 TO ERRCTR
                   END-IF

                   IF EXTRASPACES = 0
                       IF WKHYPHEN NOT = '-'  AND WKINHYPHEN = ' '
                           DISPLAY 'PHONE NUMBER SHOULD HAVE 1 HYPHEN'
                           ADD 1 TO ERRCTR
                       ELSE
                           IF WKINHYPHEN = '-' AND WKHYPHEN = ' '
                               DISPLAY 'PHONE NUMBER SHOULD HAVE 1'
      -                                                   ' HYPHEN'
                               ADD 1 TO ERRCTR
                           END-IF
                       END-IF
                   ELSE
                       IF HYPHEN-CNT NOT = 1
                           DISPLAY 'PHONE NUMBER SHOULD HAVE 1 HYPHEN'
                           ADD 1 TO ERRCTR
                       END-IF
                   END-IF

                   IF ERRCTR = 0
                       MOVE 0 TO NL-PHONE
                       ADD 1 TO UPDATECTR
                   END-IF
               ELSE
                   DISPLAY 
         'PHONE NUMBER SHOULD CONTAIN ONLY NUMBERS, SPACES, AND HYPHENS'
                   ADD 1 TO ERRCTR.

       CALC-LEN-PHONE.
           MOVE 0 TO LEN.

           INSPECT FUNCTION REVERSE(PHONE-VALUE)
               TALLYING LEN FOR LEADING ' '.

           SUBTRACT LEN FROM LENGTH OF PHONE-VALUE GIVING PHONE-LENG.

       UPDATE-LAP-OP.
           DISPLAY 'WHAT DO YOU WANT TO UPDATE?'.
           DISPLAY '1 - UPDATE THE CPU AND WARRANTY FIELDS'. 
           DISPLAY '2 - UPDATE THE STORAGE AND RAM FIELDS'.
           ACCEPT WKOP.

           DISPLAY 'ENTER THE LAPTOP ID: '.
           ACCEPT PK-LAPID.

           IF WKOP = '1'
               PERFORM PREUPDATE-LAP-1
               IF ERRCTR = 0
                   PERFORM UPDATE-LAP-1
               END-IF
           ELSE
               IF WKOP = '2'
                   PERFORM PREUPDATE-LAP-2
                   IF ERRCTR = 0
                       PERFORM UPDATE-LAP-2
                   END-IF
               ELSE
                   DISPLAY 'INVALID OPTION'
                   ADD 1 TO ERRCTR.
           IF SQLCODE = 0
               DISPLAY 'LAPTOP ' PK-LAPID ' HAD ' UPDATECTR 
               ' FIELDS UPDATED '
           ELSE
               IF PK-LAPID = ' '
                   DISPLAY 'NOTHING WAS ENTERED, UNABLE TO UPDATE TABLE'
               ELSE
                   DISPLAY 'LAPTOP ' PK-LAPID ' WAS NOT UPDATED'.

           DISPLAY 'PRESS ENTER TO CONTINUE'.
           ACCEPT WKHOLD.

       PREUPDATE-LAP-1.
           PERFORM SELECT-LAP-1.

           IF ERRCTR = 0
               PERFORM CHANGE-VALUES-LAP-1.

           IF UPDATECTR = 0
               DISPLAY 'PRESS ENTER TO CONTINUE'
               ACCEPT WKHOLD.

       SELECT-LAP-1.
           PERFORM PRESELECT-LAP-1.
           EXEC SQL
               SELECT UPPER(CPU), WARRANTY
               INTO :CPU :NL-CPU, :WARRANTY :NL-WARRANTY 
               FROM LAPTOPS
               WHERE LAPTOPID = :PK-LAPID
           END-EXEC.
           IF SQLCODE = 0
               DISPLAY 'LAPTOP WAS FOUND, PRESS ENTER TO CONTINUE'
               ACCEPT WKHOLD
               PERFORM DISPLAY-LAP-1
           ELSE
               IF PK-LAPID = ' '
                   DISPLAY 'NOTHING WAS ENTERED, UNABLE TO SELECT ROW'
                   ADD 1 TO ERRCTR
               ELSE
                   DISPLAY 'LAPTOP ' PK-LAPID ' WAS NOT FOUND'
                   ADD 1 TO ERRCTR.

       PRESELECT-LAP-1.
      *    CLEARS VALUES IN THE VARCHAR CPU VARIABLE
           MOVE ' ' TO CPU-VALUE.

      *    CLEARS VALUES IN INDICATOR VARIABLES
           MOVE 0 TO NL-CPU.
           MOVE 0 TO NL-WARRANTY.

       DISPLAY-LAP-1.
           DISPLAY 'LAPTOP ID: ' PK-LAPID.

      *    CHECKS IF CPU IS NULL
           IF NL-CPU < 0
               DISPLAY 'CPU: UNKNOWN'
           ELSE
               DISPLAY 'CPU: ' CPU-VALUE.

      *    CHECKS IF WARRANTY IS NULL
           IF NL-WARRANTY < 0
               DISPLAY 'WARRANTY: NONE'
           ELSE
               MOVE WARRANTY TO O-WARRANTY
               DISPLAY 'WARRANTY: ' O-WARRANTY ' YEAR(S)'.

       CHANGE-VALUES-LAP-1.
           DISPLAY 'DO YOU WISH TO UPDATE THE CPU FIELD?'.
           DISPLAY 'Y - YES'.
           DISPLAY 'N - NO'.
           ACCEPT WKOP.

           IF FUNCTION UPPER-CASE(WKOP) = 'Y' 
               PERFORM CHANGE-CPU.

           IF ERRCTR = 0
               DISPLAY 'DO YOU WISH TO UPDATE THE WARRANTY FIELD?'
               DISPLAY 'Y - YES'
               DISPLAY 'N - NO'
               ACCEPT WKOP

               IF FUNCTION UPPER-CASE(WKOP) = 'Y'
                   PERFORM CHANGE-WARRANTY.

           IF ERRCTR > 0 AND UPDATECTR > 0
               MOVE 0 TO UPDATECTR.

       CHANGE-CPU.
           DISPLAY
           'ENTER THE VALUE YOU WANT TO CHANGE THE LAPTOP''S CPU TO: '.
           ACCEPT CPU-VALUE.
           PERFORM CALC-LEN-CPU.
           PERFORM CHECK-CPU.

           IF CPUINVAL-SW = 'Y'
               DISPLAY 
             'CPU SHOULD CONTAIN LETTERS, NUMBERS, A HYPHEN, AND SPACES'
               ADD 1 TO ERRCTR
           ELSE
               UNSTRING WKHZ DELIMITED BY 'G'
                   INTO WKHZ-1, WKHZ-2
               END-UNSTRING
               IF FUNCTION UPPER-CASE(WKHZ-2) NOT = 'HZ'
                   DISPLAY 'CPU SHOULD BE IN GHZ'
                   ADD 1 TO ERRCTR
               ELSE
                   ADD 1 TO UPDATECTR
                   MOVE 0 TO NL-CPU.

       CALC-LEN-CPU.
           MOVE 0 TO LEN.

           INSPECT FUNCTION REVERSE(CPU-VALUE)
               TALLYING LEN FOR LEADING ' '.

           SUBTRACT LEN FROM LENGTH OF CPU-VALUE GIVING CPU-LENG.

       CHECK-CPU.
           UNSTRING CPU-VALUE DELIMITED BY ' '
               INTO WKWORD-1, WKWORD-2, WKHZ.

           IF WKWORD-1 IS ALPHABETIC OR WKWORD-2 IS ALPHABETIC
               IF WKHZ NOT ALPHABETIC
                   MOVE 'N' TO CPUINVAL-SW
               ELSE
                   MOVE 'Y' TO CPUINVAL-SW
           ELSE
               MOVE 'Y' TO CPUINVAL-SW.

       CHANGE-WARRANTY.
           DISPLAY
       'ENTER THE VALUE YOU WANT TO CHANGE THE LAPTOP''S WARRANTY TO: '.
           ACCEPT WKWAR.

           IF WKWAR = ' '
               MOVE -1 TO NL-WARRANTY
               ADD 1 TO UPDATECTR
           ELSE
               IF WKWAR NOT ALPHABETIC
                   MOVE FUNCTION NUMVAL(WKWAR) TO WARRANTY
                   IF WARRANTY <= 0
                       DISPLAY 'WARRANTY MUST BE GREATER THAN 0'
                       ADD 1 TO ERRCTR
                   ELSE
                       IF WARRANTY > 9
                           DISPLAY 
                           'WARRANTY MUST BE LESS THAN OR EQUAL TO 9'
                           ADD 1 TO ERRCTR
                       ELSE
                           MOVE 0 TO NL-WARRANTY
                           ADD 1 TO UPDATECTR
               ELSE
                   DISPLAY 'WARRANTY MUST BE NUMERIC'
                   ADD 1 TO ERRCTR.

       UPDATE-LAP-1.
           EXEC SQL
               UPDATE LAPTOPS
                   SET CPU = :CPU :NL-CPU,
                       WARRANTY = :WARRANTY :NL-WARRANTY
                   WHERE LAPTOPID = :PK-LAPID
           END-EXEC.

       PREUPDATE-LAP-2.
           PERFORM SELECT-LAP-2.

           IF ERRCTR = 0
               PERFORM CHANGE-VALUES-LAP-2.

           IF UPDATECTR = 0
               DISPLAY 'PRESS ENTER TO CONTINUE'
               ACCEPT WKHOLD.

       SELECT-LAP-2.
           PERFORM PRESELECT-LAP-2.
           EXEC SQL
               SELECT STORAGE, RAM
               INTO :STORAGE :NL-STORAGE, :RAM :NL-RAM
               FROM LAPTOPS
               WHERE LAPTOPID = :PK-LAPID
           END-EXEC.
           IF SQLCODE = 0
               DISPLAY 'LAPTOP WAS FOUND, PRESS ENTER TO CONTINUE'
               ACCEPT WKHOLD
               PERFORM DISPLAY-LAP-2
           ELSE
               IF PK-LAPID = ' '
                   DISPLAY 'NOTHING WAS ENTERED, UNABLE TO SELECT ROW'
                   ADD 1 TO ERRCTR
               ELSE
                   DISPLAY 'LAPTOP ' PK-LAPID ' WAS NOT FOUND'
                   ADD 1 TO ERRCTR.

       PRESELECT-LAP-2.
      *    CLEARS VALUES IN INDICATOR VARIABLES
           MOVE 0 TO NL-STORAGE.
           MOVE 0 TO NL-RAM.

       DISPLAY-LAP-2.
           DISPLAY 'LAPTOP ID: ' PK-LAPID.

      *    CHECKS IF STORAGE IS NULL
           IF NL-STORAGE < 0
               DISPLAY 'STORAGE: UNKNOWN'
           ELSE
               MOVE STORAGE TO WKGB
      *    ADDS GB TO THE VALUE IN STORAGE
               STRING WKGB DELIMITED BY ' '
                   ' GB' DELIMITED BY SIZE
               INTO O-STORAGE
               DISPLAY 'STORAGE: ' O-STORAGE.

      *    CHECKS IF RAM IS NULL
           IF NL-RAM < 0
               DISPLAY 'RAM: UNKNOWN'
           ELSE
               MOVE RAM TO WKGB
      *    ADDS GB TO THE VALUE IN RAM
               STRING WKGB DELIMITED BY ' '
                   ' GB' DELIMITED BY SIZE
               INTO O-RAM
               DISPLAY 'RAM: ' O-RAM.

       CHANGE-VALUES-LAP-2.
           DISPLAY 'DO YOU WISH TO UPDATE THE STORAGE FIELD?'.
           DISPLAY 'Y - YES'.
           DISPLAY 'N - NO'.
           ACCEPT WKOP.

           IF FUNCTION UPPER-CASE(WKOP) = 'Y'
               PERFORM CHANGE-STORAGE.

           IF ERRCTR = 0
               DISPLAY 'DO YOU WISH TO UPDATE THE RAM FIELD?'
               DISPLAY 'Y - YES'
               DISPLAY 'N - NO'
               ACCEPT WKOP

               IF FUNCTION UPPER-CASE(WKOP) = 'Y'
                   PERFORM CHANGE-RAM.

           IF ERRCTR > 0 AND UPDATECTR > 0
               MOVE 0 TO UPDATECTR.

       CHANGE-STORAGE.
           DISPLAY
        'ENTER THE VALUE YOU WANT TO CHANGE THE LAPTOP''S STORAGE TO: '.
           ACCEPT WKSTOR.

           IF WKSTOR = ' '
               ADD 1 TO UPDATECTR
               MOVE -1 TO NL-STORAGE
           ELSE
               PERFORM DEC-CHECK-STOR
               IF DECINVAL-SW = 'N'
      *    NUMVAL USED TO CONVERT THE ALPHANUMERIC DATA TO NUMERIC DATA
                   MOVE FUNCTION NUMVAL(WKSTOR) TO STORAGE
                   IF STORAGE <= 0
                       DISPLAY 'STORAGE MUST BE GREATER THAN 0'
                       ADD 1 TO ERRCTR
                   ELSE
                       ADD 1 TO UPDATECTR
                       MOVE 0 TO NL-STORAGE
               ELSE
                   DISPLAY 'STORAGE MUST BE NUMERIC'
                   ADD 1 TO ERRCTR.

       DEC-CHECK-STOR.
           INSPECT WKSTOR TALLYING DEC-CNT FOR ALL '.'.
           IF DEC-CNT = 1 
               UNSTRING WKSTOR DELIMITED BY '.'
                   INTO WKBFEDEC, WKATRDEC
               END-UNSTRING
               IF WKBFEDEC NOT ALPHABETIC
                   IF WKATRDEC IS ALPHABETIC AND WKATRDEC NOT = ' '
                       MOVE 'Y' TO DECINVAL-SW    
                   END-IF
               ELSE
                   MOVE 'Y' TO DECINVAL-SW
           ELSE
               IF WKSTOR ALPHABETIC
                   MOVE 'Y' TO DECINVAL-SW.

       CHANGE-RAM.
           DISPLAY
           'ENTER THE VALUE YOU WANT TO CHANGE THE LAPTOP''S RAM TO: '.
           ACCEPT WKRAM.

           IF WKRAM = ' '
               ADD 1 TO UPDATECTR
               MOVE -1 TO NL-RAM
           ELSE
               PERFORM DEC-CHECK-RAM
               IF DECINVAL-SW = 'N'
      *    CONVERTS DATA IN WKRAM TO NUMERIC
                   MOVE FUNCTION NUMVAL(WKRAM) TO RAM
                   IF RAM <= 0
                       DISPLAY 'RAM MUST BE GREATER THAN 0'
                       ADD 1 TO ERRCTR
                   ELSE
                       ADD 1 TO UPDATECTR
                       MOVE 0 TO NL-RAM
               ELSE
                   DISPLAY 'RAM MUST BE NUMERIC'
                   ADD 1 TO ERRCTR.

       DEC-CHECK-RAM.
           MOVE 0 TO DEC-CNT.
           MOVE ' ' TO WKBFEDEC.
           MOVE ' ' TO WKATRDEC.
           INSPECT WKRAM TALLYING DEC-CNT FOR ALL '.'.

           IF DEC-CNT = 1
               UNSTRING WKRAM DELIMITED BY '.'
                   INTO WKBFEDEC, WKATRDEC
               END-UNSTRING
               IF WKBFEDEC NOT ALPHABETIC
                   IF WKATRDEC IS ALPHABETIC AND WKATRDEC NOT = ' '
                       MOVE 'Y' TO DECINVAL-SW    
                   END-IF
               ELSE
                   MOVE 'Y' TO DECINVAL-SW
           ELSE
               IF WKRAM IS ALPHABETIC
                   MOVE 'Y' TO DECINVAL-SW.

       UPDATE-LAP-2.
           EXEC SQL
               UPDATE LAPTOPS
                   SET STORAGE = :STORAGE :NL-STORAGE,
                       RAM = :RAM :NL-RAM
                   WHERE LAPTOPID = :PK-LAPID
           END-EXEC.

       SAVE-CHANGES.
           DISPLAY 'DO YOU WISH TO SAVE YOUR CHANGES?'.
           DISPLAY 'Y - YES'.
           DISPLAY 'N - NO'.
           ACCEPT WKOP.

           IF FUNCTION UPPER-CASE(WKOP) = 'Y'
               PERFORM COMMIT-CHANGES.
       
       COMMIT-CHANGES.
           EXEC SQL
               COMMIT WORK
           END-EXEC.

       SHUT-DOWN.
           DISPLAY 'CLOSING PROGRAM, PRESS ENTER TO CONTINUE'.
           ACCEPT WKHOLD.
           STOP 'PRESS ENTER AGAIN TO TERMINATE'.
           STOP RUN.

       OPENESQL-ERROR SECTION.
           DISPLAY 'SQL ERROR = ' SQLSTATE ' ' SQLCODE.
           DISPLAY MFSQLMESSAGETEXT.
           ACCEPT WKHOLD.
=======
       WORKING-STORAGE SECTION.
      *    REPRESENTS THE ENTER KEY
       01  WKHOLD                          PIC X.
      *    REPRESENTS THE OPTIONS THAT THE USER SELECTED
       01  WKOP                            PIC X.
      *    USED TO STORE THE AMOUNT OF EXTRA SPACES
       01  EXTRASPACES                     PIC 9(2)        VALUE 0.
      *    USED TO HOLD THE NUMERIC DATA THAT WAS ENTERED BY THE USER
       01  WKSTOR                          PIC X(5).
       01  WKRAM                           PIC X(5).
       01  WKWAR                           PIC X.
      *    CHARACTER COUNT VARIABLES USED FOR TALLYING
       01  SPACES-CNT                      PIC 9           VALUE 0.
       01  HYPHEN-CNT                      PIC 9           VALUE 0.
       01  DEC-CNT                         PIC 9           VALUE 0.
      *    USED TO CALCULATE LENGTH FOR VARCHAR VARIABLES
       01  LEN                             PIC S9(9)       VALUE 0 COMP.
      *    COUNTER VARIABLES
       01  ERRCTR                          PIC 9           VALUE 0.
       01  UPDATECTR                       PIC 9           VALUE 0.
      *    SWITCHES
       01  DECINVAL-SW                     PIC X           VALUE 'N'.
       01  CPUINVAL-SW                     PIC X           VALUE 'N'.

       01  NUMCPU                          PIC 9(20).

           EXEC SQL INCLUDE SQLCA END-EXEC.
       01  MFSQLMESSAGETEXT                PIC X(250).

      *****************HOST VARIABLE DECLARATION AREA*******************
           EXEC SQL BEGIN DECLARE SECTION END-EXEC.
      ************************CUSTOMERS TABLE***************************
      *    CONTAINS ALL THE VARIABLES THAT ARE NOT PART OF A VARCHAR
      *    COLUMN IN THE CUSTOMERS TABLE.
       01  CUST-NO-VARCHAR.
      ************************CHAR VARIABLES****************************
           03  PK-CUSTID                   PIC X(4).
           03  RECUR                       PIC X.
      *************************INT VARIABLES****************************
           03  UNITNUM                     PIC S9(9)       COMP.
           03  ZIP                         PIC S9(9)       COMP.
      ***********************NULLABLE VARIABLE**************************
           03  NL-EMAIL                    PIC S9(4)       COMP.
      ***********************VARCHAR VARIABLES**************************
       01  FNAME.
           49  FNAME-LENG                  PIC S9(4)       COMP.
           49  FNAME-VALUE                 PIC X(12).
       01  LNAME.
           49  LNAME-LENG                  PIC S9(4)       COMP.
           49  LNAME-VALUE                 PIC X(12).
       01  STREET.
           49  STREET-LENG                 PIC S9(4)       COMP.
           49  STREET-VALUE                PIC X(20).
       01  CITY.
           49  CITY-LENG                   PIC S9(4)       COMP.
           49  CITY-VALUE                  PIC X(20).
       01  ST.
           49  ST-LENG                     PIC S9(4)       COMP.
           49  ST-VALUE                    PIC XX.
       01  EMAIL.
           49  EMAIL-LENG                  PIC S9(4)       COMP.
           49  EMAIL-VALUE                 PIC X(30).
      ******************************************************************

      ************************ORDERS TABLE******************************
      *    CONTAINS ALL THE VARIABLES THAT ARE NOT PART OF A VARCHAR
      *    COLUMN IN THE ORDERS TABLE.
       01  ORD-NO-VARCHAR.
      ***********************CHAR VARIABLES*****************************
           03  PK-ORDERID                  PIC X(4).
           03  FK-CUSTID                   PIC X(4).
      ***********************DATE VARIABLES*****************************
           03  ORDERDATE                   PIC X(10).
           03  SHIPDATE                    PIC X(10).
           03  ARRIVALDATE                 PIC X(10).
      ************************DEC VARIABLE******************************
           03  SHIPFEE                     PIC S9V99       COMP-3.
      *********************NULLABLE VARIABLES***************************
           03  NL-SHIPDATE                 PIC S9(4)       COMP.
           03  NL-ARRIVALDATE              PIC S9(4)       COMP.
           03  NL-SHIPCITY                 PIC S9(4)       COMP.
           03  NL-SHIPST                   PIC S9(4)       COMP.
           03  NL-SHIPFEE                  PIC S9(4)       COMP.
      **********************VARCHAR VARIABLES***************************
       01  SHIPCITY.
           49 SHIPCITY-LENG                PIC S9(4)       COMP.
           49 SHIPCITY-VALUE               PIC X(20).
       01  SHIPST.
           49  SHIPST-LENG                 PIC S9(4)       COMP.
           49  SHIPST-VALUE                PIC XX.
      ******************************************************************
           
      ************************COMPANY TABLE*****************************
      *    CONTAINS ALL THE VARIABLES THAT ARE NOT PART OF A VARCHAR
      *    COLUMN IN THE COMPANY TABLE.
       01  COMP-NO-VARCHAR.
      ************************CHAR VARIABLE*****************************
           03  PK-COMPID                   PIC X(4).
      *********************NULLABLE VARIABLES***************************
           03  NL-ADDR                     PIC S9(4)       COMP.
           03  NL-EMAILADDR                PIC S9(4)       COMP.
           03  NL-PHONE                    PIC S9(4)       COMP.
      **********************VARCHAR VARIABLES***************************
       01  COMPNAME.
           49  COMPNAME-LENG               PIC S9(4)       COMP.
           49  COMPNAME-VALUE              PIC X(25).
       01  ADDR.
           49  ADDR-LENG                   PIC S9(4)       COMP.
           49  ADDR-VALUE                  PIC X(52).
       01  EMAILADDR.
           49  EMAILADDR-LENG              PIC S9(4)       COMP.
           49  EMAILADDR-VALUE             PIC X(30).
       01  PHONE.
           49  PHONE-LENG                  PIC S9(4)       COMP.
           49  PHONE-VALUE                 PIC X(16).
      ******************************************************************

      ************************LAPTOPS TABLE*****************************
      *    CONTAINS ALL THE VARIABLES THAT ARE NOT PART OF A VARCHAR
      *    COLUMN IN THE LAPTOPS TABLE.
       01  LAP-NO-VARCHAR.
      ***********************CHAR VARIABLES*****************************
           03  PK-LAPID                    PIC X(4).
           03  FK-COMPID                   PIC X(4).
      ************************INT VARIABLES*****************************
           03  YEAR                        PIC S9(9)       COMP.
           03  WARRANTY                    PIC S9(9)       COMP.
      ************************DEC VARIABLES*****************************
           03  STORAGE                     PIC S9(3)V9     COMP-3.
           03  RAM                         PIC S9(3)V9     COMP-3.
           03  PRICE                       PIC S9(6)V99    COMP-3.
      *********************NULLABLE VARIABLES***************************
           03  NL-OS                       PIC S9(4)       COMP.
           03  NL-STORAGE                  PIC S9(4)       COMP.
           03  NL-CPU                      PIC S9(4)       COMP.
           03  NL-RAM                      PIC S9(4)       COMP.
           03  NL-WARRANTY                 PIC S9(4)       COMP.
      **********************VARCHAR VARIABLES***************************
       01  LAPNAME.
           49  LAPNAME-LENG                PIC S9(4)       COMP.
           49  LAPNAME-VALUE               PIC X(25).
       01  PRODNUM.
           49  PRODNUM-LENG                PIC S9(4)       COMP.
           49  PRODNUM-VALUE               PIC X(10).
       01  SERIAL.
           49  SERIAL-LENG                 PIC S9(4)       COMP.
           49  SERIAL-VALUE                PIC X(8).
       01  OS.
           49  OS-LENG                     PIC S9(4)       COMP.
           49  OS-VALUE                    PIC X(15).
       01  CPU.
           49  CPU-LENG          	       PIC S9(4)       COMP.
           49  CPU-VALUE         	       PIC X(20).
      ******************************************************************

      *********************LAPTOPORDERS TABLE***************************
      *    CONTAINS ALL THE VARIABLES THAT ARE NOT PART OF A VARCHAR
      *    COLUMN IN THE LAPTOPORDERS TABLE.
       01  LAPORD-NO-VARCHAR.
      ***********************CHAR VARIABLES*****************************
           03  FK-ORDERID                  PIC X(4).
           03  FK-LAPID                    PIC X(4).
      ************************INT VARIABLE******************************
           03  QTY                         PIC S9(9)       COMP.
      ************************DEC VARIABLES*****************************
           03  ORDERCOST                   PIC S9(9)V99    COMP-3.
           03  DEALS                       PIC SV99        COMP-3.
      **********************NULLABLE VARIABLE***************************
           03  NL-DEALS                    PIC S9(4)       COMP.
      ******************************************************************
           EXEC SQL END DECLARE SECTION END-EXEC.
      ******************************************************************
      *    CONTAINS ALL THE FORMATTED VARIABLES
       01  FORMATTED-DATA.
           05  O-UNITNUM                   PIC ZZ9.
           05  O-ZIP                   	   PIC 9(5).
           05  O-SHIPFEE     			   PIC $9.99.
      *    USED TO CONTAIN EACH PART OF THE PHONE NUMBER
           05  WKPHNE-1                    PIC 9           VALUE 0.
           05  WKPHNE-2.
               10  WKOPPARA                PIC X           VALUE ' '.
               10  WKDIGITS                PIC 9(3)        VALUE 0.
               10  WKCLPARA                PIC X           VALUE ' '.
           05  WKPHNE-3.                    
               10  WKDIGITS-1              PIC 9(3)        VALUE 0.
               10  WKHYPHEN                PIC X           VALUE ' '.
               10  WKDIGITS-2              PIC 9(4)        VALUE 0.
      *    USED TO CONTAIN THE 1ST AND 3RD PARTS OF THE PHONE NUMBER 
      *    WHEN PHONE IS INVALID
           05  WKPHNE-4.
               10  WKINDIGIT               PIC 9           VALUE 0.
               10  WKINCHAR-1              PIC X           VALUE ' '.
           05  WKPHNE-5.
               10  WKINCHAR-2              PIC X           VALUE ' '.
               10  WKINDIGITS-1            PIC 9(3)        VALUE 0.
               10  WKINHYPHEN              PIC X           VALUE ' '.
               10  WKINDIGITS-2            PIC 9(4)        VALUE 0. 
           05  O-YEAR					   PIC 9(4).
      *    VARIABLE USED TO HOLD THE CONTENTS OF STORAGE AND RAM
           05  WKGB			               PIC ZZZ.9.
      *    FORMATTED STORAGE AND RAM VARIABLES CONTAINING 'GB' AND NO
      *    LEADING SPACES
           05  O-STORAGE                   PIC X(8).
           05  O-RAM					   PIC X(8).
      *    USED TO CONTAIN NUMBER BEFORE AND AFTER THE DECIMAL FOR THE
      *    STORAGE AND RAM VARIABLES
           05  WKBFEDEC                    PIC X(3).
           05  WKATRDEC                    PIC X(2).
      *    USED TO CONTAIN CHARACTERS FROM CPU WHILE ITS BEING
      *    UNSTRINGED
           05  WKWORD-1                    PIC X(20).
           05  WKWORD-2                    PIC X(20).
           05  WKHZ                        PIC X(20).
           05  WKHZ-1                      PIC X(6).
           05  WKHZ-2                      PIC X(2).
           05  O-PRICE        			   PIC $$$$,$$$.99.
           05  O-WARRANTY				   PIC 9.
           05  O-QTY     				   PIC ZZ9.
           05  O-ORDERCOST				   PIC $$$$,$$$,$$$.99.
           05  O-DEALS					   PIC V99.

       PROCEDURE DIVISION.
       RUN-START.
           DISPLAY 'WELCOME, PRESS ENTER TO CONTINUE'.
           ACCEPT WKHOLD.
           EXEC SQL
               WHENEVER SQLERROR PERFORM OPENESQL-ERROR
           END-EXEC.
           PERFORM CONNECT.
           PERFORM SELECT-OPTION.

           IF WKOP = '1'
               PERFORM UPDATE-COMP
           ELSE
               IF WKOP = '2'
                   PERFORM UPDATE-LAP-OP
               ELSE
                   DISPLAY 'INVALID OPTION, PRESS ENTER TO CONTINUE'.

           IF ERRCTR = 0 AND UPDATECTR > 0
               PERFORM SAVE-CHANGES.

           PERFORM SHUT-DOWN.

       CONNECT.
           EXEC SQL
               CONNECT TO SAMPLE
           END-EXEC.

       SELECT-OPTION.
           DISPLAY 'SELECT AN OPTION: '.
           DISPLAY '1 - COMPANY'.
           DISPLAY '2 - LAPTOP'.
           ACCEPT WKOP.

       UPDATE-COMP.
           DISPLAY 'ENTER THE COMPANY ID: '.
           ACCEPT PK-COMPID.

           PERFORM PREUPDATE-COMP.
           IF ERRCTR = 0
               EXEC SQL
                   UPDATE COMPANY
                       SET PHONE = :PHONE :NL-PHONE
                       WHERE COMPANYID = :PK-COMPID
               END-EXEC.
               IF SQLCODE = 0
                   IF UPDATECTR = 0
                       DISPLAY 'COMPANY ' PK-COMPID ' HAD ' UPDATECTR
                               ' FIELDS UPDATED'
                   ELSE
                       DISPLAY 'COMPANY ' PK-COMPID ' HAD ' UPDATECTR
                               ' FIELD UPDATED'
               ELSE
                   IF PK-COMPID = ' '
                       DISPLAY
                       'NOTHING WAS ENTERED, UNABLE TO UPDATE TABLE'
                   ELSE
                       DISPLAY 'COMPANY ' PK-COMPID ' WAS NOT UPDATED'.

           DISPLAY 'PRESS ENTER TO CONTINUE'.
           ACCEPT WKHOLD.

       PREUPDATE-COMP.
           PERFORM SELECT-COMP.

           IF ERRCTR = 0
               PERFORM CHANGE-VALUE-COMP.

           IF UPDATECTR = 0
               DISPLAY 'PRESS ENTER TO CONTINUE'
               ACCEPT WKHOLD.

       SELECT-COMP.
           PERFORM PRESELECT-COMP.
           EXEC SQL
               SELECT PHONE
               INTO :PHONE :NL-PHONE
               FROM COMPANY
               WHERE COMPANYID = :PK-COMPID
           END-EXEC.
           IF SQLCODE = 0
               DISPLAY 'COMPANY WAS FOUND, PRESS ENTER TO CONTINUE'
               ACCEPT WKHOLD
               PERFORM DISPLAY-COMP
           ELSE
               IF PK-COMPID = ' '
                   DISPLAY 'NOTHING WAS ENTERED, UNABLE TO SELECT '
                   ADD 1 TO ERRCTR
               ELSE
                   DISPLAY 'COMPANY ' PK-COMPID ' WAS NOT FOUND'
                   ADD 1 TO ERRCTR.

       PRESELECT-COMP.
      *    CLEARS VALUES IN VARCHAR FIELD PHONE
           MOVE ' ' TO PHONE-VALUE.

      *    CLEARS VALUES IN THE INDICATOR PHONE VARIABLE
           MOVE 0 TO NL-PHONE.

       DISPLAY-COMP.
           DISPLAY 'COMPANY ID: ' PK-COMPID.

           IF NL-PHONE < 0
               DISPLAY 'PHONE NUMBER: UNKNOWN'
           ELSE
               DISPLAY 'PHONE NUMBER: ' PHONE-VALUE.

       CHANGE-VALUE-COMP.
           DISPLAY 'DO YOU WISH TO UPDATE THE PHONE NUMBER FIELD?'.
           DISPLAY 'Y - YES'.
           DISPLAY 'N - NO'.
           ACCEPT WKOP.
       
      *    UPPER-CASE USED TO FORCE INPUT TO UPPERCASE
           IF FUNCTION UPPER-CASE(WKOP) = 'Y'
               PERFORM CHANGE-PHONE.

       CHANGE-PHONE.
           DISPLAY
       'ENTER THE VALUE YOU WANT TO CHANGE THE COMPANY''S PHONE NUMBER'
      -                                                         ' TO: '.
           ACCEPT PHONE-VALUE.
           PERFORM CALC-LEN-PHONE.

           IF PHONE-VALUE = ' '
               MOVE -1 TO NL-PHONE
               ADD 1 TO UPDATECTR
           ELSE
               IF PHONE-VALUE NOT ALPHABETIC
                   INSPECT PHONE-VALUE TALLYING SPACES-CNT FOR ALL ' '

                   IF PHONE-LENG < 15
                       DISPLAY 
         'PHONE NUMBER TOO SHORT, IT SHOULD BE 15 TO 16 CHARACTERS LONG'
                       ADD 1 TO ERRCTR
      *    CALCULATES TRAILING SPACES
                       SUBTRACT PHONE-LENG FROM 16 GIVING EXTRASPACES
                   END-IF

                   IF SPACES-CNT NOT = 2 
                       IF EXTRASPACES = 0
                           DISPLAY 'PHONE NUMBER SHOULD HAVE 2 SPACES'
                           ADD 1 TO ERRCTR
                           UNSTRING PHONE-VALUE DELIMITED BY ' '
                               INTO WKPHNE-4, WKPHNE-2, WKPHNE-5
                           END-UNSTRING
                       ELSE
                           INSPECT PHONE-VALUE
                               TALLYING HYPHEN-CNT FOR ALL '-'
                           UNSTRING PHONE-VALUE DELIMITED BY ' '
                               INTO WKPHNE-1, WKPHNE-2, WKPHNE-3
                           END-UNSTRING
                       END-IF
                   ELSE
                       UNSTRING PHONE-VALUE DELIMITED BY ' '
                           INTO WKPHNE-1, WKPHNE-2, WKPHNE-3
                       END-UNSTRING
                   END-IF

                   IF WKOPPARA NOT = '(' OR WKCLPARA NOT = ')'
                       DISPLAY 
                       'PHONE NUMBER SHOULD HAVE A PAIR OF PARANETHISES'
                       ADD 1 TO ERRCTR
                   END-IF

                   IF EXTRASPACES = 0
                       IF WKHYPHEN NOT = '-'  AND WKINHYPHEN = ' '
                           DISPLAY 'PHONE NUMBER SHOULD HAVE 1 HYPHEN'
                           ADD 1 TO ERRCTR
                       ELSE
                           IF WKINHYPHEN = '-' AND WKHYPHEN = ' '
                               DISPLAY 'PHONE NUMBER SHOULD HAVE 1'
      -                                                   ' HYPHEN'
                               ADD 1 TO ERRCTR
                           END-IF
                       END-IF
                   ELSE
                       IF HYPHEN-CNT NOT = 1
                           DISPLAY 'PHONE NUMBER SHOULD HAVE 1 HYPHEN'
                           ADD 1 TO ERRCTR
                       END-IF
                   END-IF

                   IF ERRCTR = 0
                       MOVE 0 TO NL-PHONE
                       ADD 1 TO UPDATECTR
                   END-IF
               ELSE
                   DISPLAY 
         'PHONE NUMBER SHOULD CONTAIN ONLY NUMBERS, SPACES, AND HYPHENS'
                   ADD 1 TO ERRCTR.

       CALC-LEN-PHONE.
           MOVE 0 TO LEN.

           INSPECT FUNCTION REVERSE(PHONE-VALUE)
               TALLYING LEN FOR LEADING ' '.

           SUBTRACT LEN FROM LENGTH OF PHONE-VALUE GIVING PHONE-LENG.

       UPDATE-LAP-OP.
           DISPLAY 'WHAT DO YOU WANT TO UPDATE?'.
           DISPLAY '1 - UPDATE THE CPU AND WARRANTY FIELDS'. 
           DISPLAY '2 - UPDATE THE STORAGE AND RAM FIELDS'.
           ACCEPT WKOP.

           DISPLAY 'ENTER THE LAPTOP ID: '.
           ACCEPT PK-LAPID.

           IF WKOP = '1'
               PERFORM PREUPDATE-LAP-1
               IF ERRCTR = 0
                   PERFORM UPDATE-LAP-1
               END-IF
           ELSE
               IF WKOP = '2'
                   PERFORM PREUPDATE-LAP-2
                   IF ERRCTR = 0
                       PERFORM UPDATE-LAP-2
                   END-IF
               ELSE
                   DISPLAY 'INVALID OPTION'
                   ADD 1 TO ERRCTR.
           IF SQLCODE = 0
               DISPLAY 'LAPTOP ' PK-LAPID ' HAD ' UPDATECTR 
               ' FIELDS UPDATED '
           ELSE
               IF PK-LAPID = ' '
                   DISPLAY 'NOTHING WAS ENTERED, UNABLE TO UPDATE TABLE'
               ELSE
                   DISPLAY 'LAPTOP ' PK-LAPID ' WAS NOT UPDATED'.

           DISPLAY 'PRESS ENTER TO CONTINUE'.
           ACCEPT WKHOLD.

       PREUPDATE-LAP-1.
           PERFORM SELECT-LAP-1.

           IF ERRCTR = 0
               PERFORM CHANGE-VALUES-LAP-1.

           IF UPDATECTR = 0
               DISPLAY 'PRESS ENTER TO CONTINUE'
               ACCEPT WKHOLD.

       SELECT-LAP-1.
           PERFORM PRESELECT-LAP-1.
           EXEC SQL
               SELECT UPPER(CPU), WARRANTY
               INTO :CPU :NL-CPU, :WARRANTY :NL-WARRANTY 
               FROM LAPTOPS
               WHERE LAPTOPID = :PK-LAPID
           END-EXEC.
           IF SQLCODE = 0
               DISPLAY 'LAPTOP WAS FOUND, PRESS ENTER TO CONTINUE'
               ACCEPT WKHOLD
               PERFORM DISPLAY-LAP-1
           ELSE
               IF PK-LAPID = ' '
                   DISPLAY 'NOTHING WAS ENTERED, UNABLE TO SELECT ROW'
                   ADD 1 TO ERRCTR
               ELSE
                   DISPLAY 'LAPTOP ' PK-LAPID ' WAS NOT FOUND'
                   ADD 1 TO ERRCTR.

       PRESELECT-LAP-1.
      *    CLEARS VALUES IN THE VARCHAR CPU VARIABLE
           MOVE ' ' TO CPU-VALUE.

      *    CLEARS VALUES IN INDICATOR VARIABLES
           MOVE 0 TO NL-CPU.
           MOVE 0 TO NL-WARRANTY.

       DISPLAY-LAP-1.
           DISPLAY 'LAPTOP ID: ' PK-LAPID.

      *    CHECKS IF CPU IS NULL
           IF NL-CPU < 0
               DISPLAY 'CPU: UNKNOWN'
           ELSE
               DISPLAY 'CPU: ' CPU-VALUE.

      *    CHECKS IF WARRANTY IS NULL
           IF NL-WARRANTY < 0
               DISPLAY 'WARRANTY: NONE'
           ELSE
               MOVE WARRANTY TO O-WARRANTY
               DISPLAY 'WARRANTY: ' O-WARRANTY ' YEAR(S)'.

       CHANGE-VALUES-LAP-1.
           DISPLAY 'DO YOU WISH TO UPDATE THE CPU FIELD?'.
           DISPLAY 'Y - YES'.
           DISPLAY 'N - NO'.
           ACCEPT WKOP.

           IF FUNCTION UPPER-CASE(WKOP) = 'Y' 
               PERFORM CHANGE-CPU.

           IF ERRCTR = 0
               DISPLAY 'DO YOU WISH TO UPDATE THE WARRANTY FIELD?'
               DISPLAY 'Y - YES'
               DISPLAY 'N - NO'
               ACCEPT WKOP

               IF FUNCTION UPPER-CASE(WKOP) = 'Y'
                   PERFORM CHANGE-WARRANTY.

           IF ERRCTR > 0 AND UPDATECTR > 0
               MOVE 0 TO UPDATECTR.

       CHANGE-CPU.
           DISPLAY
           'ENTER THE VALUE YOU WANT TO CHANGE THE LAPTOP''S CPU TO: '.
           ACCEPT CPU-VALUE.
           PERFORM CALC-LEN-CPU.
           PERFORM CHECK-CPU.

           IF CPUINVAL-SW = 'Y'
               DISPLAY 
             'CPU SHOULD CONTAIN LETTERS, NUMBERS, A HYPHEN, AND SPACES'
               ADD 1 TO ERRCTR
           ELSE
               UNSTRING WKHZ DELIMITED BY 'G'
                   INTO WKHZ-1, WKHZ-2
               END-UNSTRING
               IF FUNCTION UPPER-CASE(WKHZ-2) NOT = 'HZ'
                   DISPLAY 'CPU SHOULD BE IN GHZ'
                   ADD 1 TO ERRCTR
               ELSE
                   ADD 1 TO UPDATECTR
                   MOVE 0 TO NL-CPU.

       CALC-LEN-CPU.
           MOVE 0 TO LEN.

           INSPECT FUNCTION REVERSE(CPU-VALUE)
               TALLYING LEN FOR LEADING ' '.

           SUBTRACT LEN FROM LENGTH OF CPU-VALUE GIVING CPU-LENG.

       CHECK-CPU.
           UNSTRING CPU-VALUE DELIMITED BY ' '
               INTO WKWORD-1, WKWORD-2, WKHZ.

           IF WKWORD-1 IS ALPHABETIC OR WKWORD-2 IS ALPHABETIC
               IF WKHZ NOT ALPHABETIC
                   MOVE 'N' TO CPUINVAL-SW
               ELSE
                   MOVE 'Y' TO CPUINVAL-SW
           ELSE
               MOVE 'Y' TO CPUINVAL-SW.

       CHANGE-WARRANTY.
           DISPLAY
       'ENTER THE VALUE YOU WANT TO CHANGE THE LAPTOP''S WARRANTY TO: '.
           ACCEPT WKWAR.

           IF WKWAR = ' '
               MOVE -1 TO NL-WARRANTY
               ADD 1 TO UPDATECTR
           ELSE
               IF WKWAR NOT ALPHABETIC
                   MOVE FUNCTION NUMVAL(WKWAR) TO WARRANTY
                   IF WARRANTY <= 0
                       DISPLAY 'WARRANTY MUST BE GREATER THAN 0'
                       ADD 1 TO ERRCTR
                   ELSE
                       IF WARRANTY > 9
                           DISPLAY 
                           'WARRANTY MUST BE LESS THAN OR EQUAL TO 9'
                           ADD 1 TO ERRCTR
                       ELSE
                           MOVE 0 TO NL-WARRANTY
                           ADD 1 TO UPDATECTR
               ELSE
                   DISPLAY 'WARRANTY MUST BE NUMERIC'
                   ADD 1 TO ERRCTR.

       UPDATE-LAP-1.
           EXEC SQL
               UPDATE LAPTOPS
                   SET CPU = :CPU :NL-CPU,
                       WARRANTY = :WARRANTY :NL-WARRANTY
                   WHERE LAPTOPID = :PK-LAPID
           END-EXEC.

       PREUPDATE-LAP-2.
           PERFORM SELECT-LAP-2.

           IF ERRCTR = 0
               PERFORM CHANGE-VALUES-LAP-2.

           IF UPDATECTR = 0
               DISPLAY 'PRESS ENTER TO CONTINUE'
               ACCEPT WKHOLD.

       SELECT-LAP-2.
           PERFORM PRESELECT-LAP-2.
           EXEC SQL
               SELECT STORAGE, RAM
               INTO :STORAGE :NL-STORAGE, :RAM :NL-RAM
               FROM LAPTOPS
               WHERE LAPTOPID = :PK-LAPID
           END-EXEC.
           IF SQLCODE = 0
               DISPLAY 'LAPTOP WAS FOUND, PRESS ENTER TO CONTINUE'
               ACCEPT WKHOLD
               PERFORM DISPLAY-LAP-2
           ELSE
               IF PK-LAPID = ' '
                   DISPLAY 'NOTHING WAS ENTERED, UNABLE TO SELECT ROW'
                   ADD 1 TO ERRCTR
               ELSE
                   DISPLAY 'LAPTOP ' PK-LAPID ' WAS NOT FOUND'
                   ADD 1 TO ERRCTR.

       PRESELECT-LAP-2.
      *    CLEARS VALUES IN INDICATOR VARIABLES
           MOVE 0 TO NL-STORAGE.
           MOVE 0 TO NL-RAM.

       DISPLAY-LAP-2.
           DISPLAY 'LAPTOP ID: ' PK-LAPID.

      *    CHECKS IF STORAGE IS NULL
           IF NL-STORAGE < 0
               DISPLAY 'STORAGE: UNKNOWN'
           ELSE
               MOVE STORAGE TO WKGB
      *    ADDS GB TO THE VALUE IN STORAGE
               STRING WKGB DELIMITED BY ' '
                   ' GB' DELIMITED BY SIZE
               INTO O-STORAGE
               DISPLAY 'STORAGE: ' O-STORAGE.

      *    CHECKS IF RAM IS NULL
           IF NL-RAM < 0
               DISPLAY 'RAM: UNKNOWN'
           ELSE
               MOVE RAM TO WKGB
      *    ADDS GB TO THE VALUE IN RAM
               STRING WKGB DELIMITED BY ' '
                   ' GB' DELIMITED BY SIZE
               INTO O-RAM
               DISPLAY 'RAM: ' O-RAM.

       CHANGE-VALUES-LAP-2.
           DISPLAY 'DO YOU WISH TO UPDATE THE STORAGE FIELD?'.
           DISPLAY 'Y - YES'.
           DISPLAY 'N - NO'.
           ACCEPT WKOP.

           IF FUNCTION UPPER-CASE(WKOP) = 'Y'
               PERFORM CHANGE-STORAGE.

           IF ERRCTR = 0
               DISPLAY 'DO YOU WISH TO UPDATE THE RAM FIELD?'
               DISPLAY 'Y - YES'
               DISPLAY 'N - NO'
               ACCEPT WKOP

               IF FUNCTION UPPER-CASE(WKOP) = 'Y'
                   PERFORM CHANGE-RAM.

           IF ERRCTR > 0 AND UPDATECTR > 0
               MOVE 0 TO UPDATECTR.

       CHANGE-STORAGE.
           DISPLAY
        'ENTER THE VALUE YOU WANT TO CHANGE THE LAPTOP''S STORAGE TO: '.
           ACCEPT WKSTOR.

           IF WKSTOR = ' '
               ADD 1 TO UPDATECTR
               MOVE -1 TO NL-STORAGE
           ELSE
               PERFORM DEC-CHECK-STOR
               IF DECINVAL-SW = 'N'
      *    NUMVAL USED TO CONVERT THE ALPHANUMERIC DATA TO NUMERIC DATA
                   MOVE FUNCTION NUMVAL(WKSTOR) TO STORAGE
                   IF STORAGE <= 0
                       DISPLAY 'STORAGE MUST BE GREATER THAN 0'
                       ADD 1 TO ERRCTR
                   ELSE
                       ADD 1 TO UPDATECTR
                       MOVE 0 TO NL-STORAGE
               ELSE
                   DISPLAY 'STORAGE MUST BE NUMERIC'
                   ADD 1 TO ERRCTR.

       DEC-CHECK-STOR.
           INSPECT WKSTOR TALLYING DEC-CNT FOR ALL '.'.
           IF DEC-CNT = 1 
               UNSTRING WKSTOR DELIMITED BY '.'
                   INTO WKBFEDEC, WKATRDEC
               END-UNSTRING
               IF WKBFEDEC NOT ALPHABETIC
                   IF WKATRDEC IS ALPHABETIC AND WKATRDEC NOT = ' '
                       MOVE 'Y' TO DECINVAL-SW    
                   END-IF
               ELSE
                   MOVE 'Y' TO DECINVAL-SW
           ELSE
               IF WKSTOR ALPHABETIC
                   MOVE 'Y' TO DECINVAL-SW.

       CHANGE-RAM.
           DISPLAY
           'ENTER THE VALUE YOU WANT TO CHANGE THE LAPTOP''S RAM TO: '.
           ACCEPT WKRAM.

           IF WKRAM = ' '
               ADD 1 TO UPDATECTR
               MOVE -1 TO NL-RAM
           ELSE
               PERFORM DEC-CHECK-RAM
               IF DECINVAL-SW = 'N'
      *    CONVERTS DATA IN WKRAM TO NUMERIC
                   MOVE FUNCTION NUMVAL(WKRAM) TO RAM
                   IF RAM <= 0
                       DISPLAY 'RAM MUST BE GREATER THAN 0'
                       ADD 1 TO ERRCTR
                   ELSE
                       ADD 1 TO UPDATECTR
                       MOVE 0 TO NL-RAM
               ELSE
                   DISPLAY 'RAM MUST BE NUMERIC'
                   ADD 1 TO ERRCTR.

       DEC-CHECK-RAM.
           MOVE 0 TO DEC-CNT.
           MOVE ' ' TO WKBFEDEC.
           MOVE ' ' TO WKATRDEC.
           INSPECT WKRAM TALLYING DEC-CNT FOR ALL '.'.

           IF DEC-CNT = 1
               UNSTRING WKRAM DELIMITED BY '.'
                   INTO WKBFEDEC, WKATRDEC
               END-UNSTRING
               IF WKBFEDEC NOT ALPHABETIC
                   IF WKATRDEC IS ALPHABETIC AND WKATRDEC NOT = ' '
                       MOVE 'Y' TO DECINVAL-SW    
                   END-IF
               ELSE
                   MOVE 'Y' TO DECINVAL-SW
           ELSE
               IF WKRAM IS ALPHABETIC
                   MOVE 'Y' TO DECINVAL-SW.

       UPDATE-LAP-2.
           EXEC SQL
               UPDATE LAPTOPS
                   SET STORAGE = :STORAGE :NL-STORAGE,
                       RAM = :RAM :NL-RAM
                   WHERE LAPTOPID = :PK-LAPID
           END-EXEC.

       SAVE-CHANGES.
           DISPLAY 'DO YOU WISH TO SAVE YOUR CHANGES?'.
           DISPLAY 'Y - YES'.
           DISPLAY 'N - NO'.
           ACCEPT WKOP.

           IF FUNCTION UPPER-CASE(WKOP) = 'Y'
               PERFORM COMMIT-CHANGES.
       
       COMMIT-CHANGES.
           EXEC SQL
               COMMIT WORK
           END-EXEC.

       SHUT-DOWN.
           DISPLAY 'CLOSING PROGRAM, PRESS ENTER TO CONTINUE'.
           ACCEPT WKHOLD.
           STOP 'PRESS ENTER AGAIN TO TERMINATE'.
           STOP RUN.

       OPENESQL-ERROR SECTION.
           DISPLAY 'SQL ERROR = ' SQLSTATE ' ' SQLCODE.
           DISPLAY MFSQLMESSAGETEXT.
           ACCEPT WKHOLD.
           STOP RUN.