       WORKING-STORAGE SECTION.
      *    REPRESENTS THE ENTER KEY
       01  WKHOLD                          PIC X.
      *    REPRESENTS THE OPTIONS THAT THE USER SELECTED
       01  WKOP                            PIC X.
      *    USED TO STORE THE AMOUNT OF EXTRA SPACES
       01  EXTRASPACES                     PIC 9(2)        VALUE 0.
      *    USED TO HOLD THE NUMERIC DATA THAT WAS ENTERED BY THE USER
       01  WKSHIPFEE                       PIC X(4).
       01  WKSTOR                          PIC X(5).
       01  WKRAM                           PIC X(5).
       01  WKWAR                           PIC X.
      *    CHARACTER COUNT VARIABLES USED FOR TALLYING
       01  SPACES-CNT                      PIC 9           VALUE 0.
       01  HYPHEN-CNT                      PIC 9           VALUE 0.
       01  DEC-CNT                         PIC 9           VALUE 0. 
      *    USED TO CALCULATE LENGTH FOR VARCHAR VARIABLES
       01  L                               PIC S9(9)       VALUE 0 COMP.
      *    COUNTERS
       01  ERRCTR                          PIC 9           VALUE 0.
       01  UPDATECTR                       PIC 9           VALUE 0.
       01  ROWCTR                          PIC 99          VALUE 0.
       01  WKLEN1                          PIC 9           COMP-4.
       01  WKSPACECNT1                     PIC 9           VALUE 0.
       01  WKSTARTPOS1                     PIC 9           VALUE 0.
       01  WKLEN2                          PIC 9(2)        COMP-4.
       01  WKSPACECNT2                     PIC 9(2)        VALUE 0.
       01  WKSTARTPOS2                     PIC 9(2)        VALUE 0.
      *    SWITCHES
       01  DELETE-SW                       PIC X           VALUE 'Y'.
       01  SELECTERR-SW                    PIC X           VALUE 'N'.
       01  DECINVAL-SW                     PIC X           VALUE 'N'.
       01  CPUINVAL-SW                     PIC X           VALUE 'N'.

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
           05  WKYYYY                      PIC X(4)        VALUE ' '.
           05  WKMM                        PIC XX          VALUE ' '.
           05  WKDD                        PIC XX          VALUE ' '.
           05  O-SHIPFEE     			   PIC $9.99.
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
      *    USED TO HOLD SPACES LEFTOVER FROM O-QTY
           05  WKQTYSPACES                 PIC X(3)    VALUE ' '.
      *    USED TO HOLD CHARACTERS WHEN O-QTY IS NOT 3 DIGITS LONG
           05  WKQTY                       PIC X(3)    VALUE ' '.
           05  O-ORDERCOST				   PIC $$$$,$$$,$$$.99.
      *    USED TO HOLD SPACES LEFTOVER FROM O-ORDERCOST
           05  WKORDERCOSTSPACES           PIC X(15)   VALUE ' '.
      *    USED TO HOLD CHARACTERS WHEN O-ORDERCOST IS NOT AT MAX LENGTH
           05  WKORDERCOST                 PIC X(15).
           05  WKDEALS					   PIC V99.
           05  O-DEALS					   PIC 99.
           05  O-ROWCTR                    PIC Z9.

       PROCEDURE DIVISION.
       RUN-START.
           DISPLAY 'WELCOME, PRESS ENTER TO CONTINUE'.
           ACCEPT WKHOLD.
           EXEC SQL
               WHENEVER SQLERROR PERFORM OPENESQL-ERROR
           END-EXEC.
           PERFORM CONNECT.
      *    PERFORM SELECT-OPTION.
           PERFORM LAPORD-CURSOR.

      *    IF WKOP = '1'
      *        PERFORM DELETE-ROW-CUST
      *        PERFORM INSERT-ROW-ORD
      *        PERFORM UPDATE-COMP
      *    ELSE
      *        IF WKOP = '2'
      *            PERFORM DELETE-ROW-ORD
      *            PERFORM INSERT-ROW-LAPORD
      *            PERFORM UPDATE-LAP-OP
      *        ELSE
      *            DISPLAY 'INVALID OPTION, PRESS ENTER TO CONTINUE'
      *            ADD 1 TO ERRCTR
      *            ACCEPT WKHOLD.

      *    IF ERRCTR = 0
      *        PERFORM SAVE-CHANGES.

           PERFORM SHUT-DOWN.

       CONNECT.
           EXEC SQL
               CONNECT TO SAMPLE
           END-EXEC.

       LAPORD-CURSOR.
           PERFORM DECLARE.
           PERFORM PROC.
           MOVE ROWCTR TO O-ROWCTR.
           DISPLAY O-ROWCTR ' ROW(S) WERE FOUND'.
           DISPLAY 'PRESS ENTER TO CONTINUE'.
           ACCEPT WKHOLD.

       DECLARE.
           PERFORM PRESELECT-PROCESSING.
           EXEC SQL
               DECLARE LAPORD_CUR CURSOR FOR
               SELECT ORDERID, LAPTOPID, QUANTITY, ORDERCOST, DEALS
               FROM LAPTOPORDERS
           END-EXEC.

       PRESELECT-PROCESSING.
      *    CLEARS VALUES IN NULL (INDICATOR) VARIABLES
           MOVE 0 TO NL-DEALS.

       PROC.
           EXEC SQL OPEN LAPORD_CUR END-EXEC.
           PERFORM LOOP THRU LOOP-EXIT UNTIL SQLCODE = 100.
           EXEC SQL CLOSE LAPORD_CUR END-EXEC.

       LOOP.
           EXEC SQL
               FETCH LAPORD_CUR
               INTO :FK-ORDERID, :FK-LAPID, :QTY, :ORDERCOST, :DEALS
               :NL-DEALS
           END-EXEC.
           IF SQLCODE = 100 GO TO LOOP-EXIT.
           IF SQLCODE = 0
      *    ADDS 1 TO ROWCTR FOR EACH ROW THAT IS FOUND
               ADD 1 TO ROWCTR
               PERFORM DISPLAY-LAPORD.

       LOOP-EXIT.
           EXIT.

       DISPLAY-LAPORD.
           MOVE QTY TO O-QTY.
           MOVE ORDERCOST TO O-ORDERCOST.

      *    USED TO TRIM SPACES IN O-QTY
           MOVE 0 TO WKSPACECNT1.
      *    REVERSE() FUNCTION IS USED TO COUNT THE SPACES 
           INSPECT FUNCTION REVERSE(O-QTY)
               TALLYING WKSPACECNT1 FOR ALL ' '.
      *    GETS THE THE TRIMMED LENGTH OF O-QTY
           SUBTRACT WKSPACECNT1 FROM LENGTH OF O-QTY GIVING WKLEN1.

      *    USED TO TRIM SPACES IN O-ORDERCOST
           MOVE 0 TO WKSPACECNT2.
      *    REVERSE() FUNCTION IS USED TO COUNT THE SPACES
           INSPECT FUNCTION REVERSE(O-ORDERCOST)
               TALLYING WKSPACECNT2 FOR ALL ' '.
      *    GETS THE THE TRIMMED LENGTH OF O-ORDERCOST 
           SUBTRACT WKSPACECNT2 FROM LENGTH OF O-ORDERCOST GIVING 
           WKLEN2.

           DISPLAY 'ORDER ID: ' FK-ORDERID.
           DISPLAY 'LAPTOP ID: ' FK-LAPID.
      *    CHECKS IF O-QTY IS AT MAX LENGTH
           IF WKLEN1 < 3
      *    DETERMINES WHICH CHARACTERS TO DISPLAY BASED ON WHAT IS IN
      *    WKSTARTPOS1 (RANGES FROM 1 TO 3)
               SUBTRACT 3 FROM WKLEN1 GIVING WKSTARTPOS1
               ADD 1 TO WKSTARTPOS1
               DISPLAY 'QUANTITY: ' O-QTY(WKSTARTPOS1:WKLEN1)
           ELSE
               DISPLAY 'QUANTITY: ' O-QTY.

      *    CHECKS IF O-ORDERCOST IS AT MAX LENGTH
           IF WKLEN2 < 15
      *    DETERMINES WHICH CHARACTERS TO DISPLAY BASED ON WHAT IS IN
      *    WKSTARTPOS2 (RANGES FROM 1 TO 15) 
               SUBTRACT 15 FROM WKLEN2 GIVING WKSTARTPOS2
               ADD 1 TO WKSTARTPOS2
               DISPLAY 'ORDER COST: ' O-ORDERCOST(WKSTARTPOS2:WKLEN2)
           ELSE
               DISPLAY 'ORDER COST: ' O-ORDERCOST.

      *    NULL CHECK
           IF NL-DEALS = 0
      *    USED TO TURN THE VALUE OF DEALS INTO A PERCENT 
               MOVE DEALS TO WKDEALS
               MULTIPLY WKDEALS BY 100 GIVING O-DEALS
               DISPLAY 'DISCOUNT: ' O-DEALS '%'
           ELSE
               DISPLAY 'DISCOUNT: NONE'.

           DISPLAY 'PRESS ENTER TO CONTINUE'.
           ACCEPT WKHOLD.

       SELECT-OPTION.
           DISPLAY 'SELECT AN OPTION:'.
           DISPLAY '1 - DELETE A ROW IN CUSTOMERS'.
      *    DISPLAY '1 - INSERT A ROW IN ORDERS'.
      *    DISPLAY '1 - UPDATE COMPANY'.
           DISPLAY '2 - DELETE A ROW IN ORDERS'.
      *    DISPLAY '2 - INSERT A ROW IN LAPTOPORDERS'.
      *    DISPLAY '2 - UPDATE LAPTOP'.
           ACCEPT WKOP.

       DELETE-ROW-CUST.
           PERFORM PREDELETE-CUST.
           IF ERRCTR = 0
               DISPLAY 'DO YOU STILL WISH TO DELETE THIS CUSTOMER?'
               DISPLAY 'Y - YES'
               DISPLAY 'N - NO'
               ACCEPT WKOP
      *    UPPER-CASE() FUNCTION IS USED TO FORCE USER INPUT TO 
      *    UPPERCASE
               IF FUNCTION UPPER-CASE(WKOP) = 'Y'
                   PERFORM DELETE-CUST
               ELSE
                   DISPLAY 'THE CUSTOMER WAS NOT DELETED'
                   MOVE 'N' TO DELETE-SW.

       PREDELETE-CUST.
           DISPLAY 'PLEASE ENTER AN EXISTING CUSTOMER ID:'.
           ACCEPT PK-CUSTID.
           PERFORM SELECT-CUST-DELETE.

       SELECT-CUST-DELETE.
           PERFORM PRESELECT-CUST.
           EXEC SQL 
              SELECT UPPER(FIRSTNAME), UPPER(LASTNAME), UNITNUMBER, 
              UPPER(STREET), UPPER(CITY), ST, ZIP, EMAIL, RECURRING
              INTO :FNAME, :LNAME, :UNITNUM, :STREET, :CITY, :ST, 
              :ZIP, :EMAIL :NL-EMAIL, :RECUR
              FROM CUSTOMERS
              WHERE CUSTOMERID = :PK-CUSTID
           END-EXEC. 
           IF SQLCODE = 0 
               DISPLAY 'CUSTOMER WAS FOUND, PRESS ENTER TO CONTINUE'
               ACCEPT WKHOLD
               PERFORM DISPLAY-CUST
           ELSE
               IF PK-CUSTID = ' '
                   DISPLAY 'NOTHING WAS ENTERED'
                   ADD 1 TO ERRCTR
               ELSE
                   DISPLAY 'CUSTOMER WAS NOT FOUND'
                   ADD 1 TO ERRCTR.
           
           DISPLAY 'PRESS ENTER TO CONTINUE'.
           ACCEPT WKHOLD.

       PRESELECT-CUST.
      *    CLEARS VALUES IN VARCHAR VARIABLES
           MOVE ' ' TO FNAME-VALUE.
           MOVE ' ' TO LNAME-VALUE.
           MOVE ' ' TO STREET-VALUE.
           MOVE ' ' TO CITY-VALUE.
           MOVE ' ' TO ST-VALUE.
           MOVE ' ' TO EMAIL-VALUE.

      *    CLEARS VALUES IN NULLABLE (INDICATOR) VARIABLE
           MOVE 0 TO NL-EMAIL.

       DISPLAY-CUST.
           MOVE UNITNUM TO O-UNITNUM.
           MOVE ZIP TO O-ZIP.
           DISPLAY 'CUSTOMER ID: ' PK-CUSTID. 
           DISPLAY 'FIRST NAME: ' FNAME-VALUE. 
		   DISPLAY 'LAST NAME: ' LNAME-VALUE. 
           DISPLAY 'UNIT NUMBER: ' O-UNITNUM.
	       DISPLAY 'STREET: ' STREET-VALUE.
		   DISPLAY 'CITY: ' CITY-VALUE.
           DISPLAY 'STATE: ' ST-VALUE.
		   DISPLAY 'ZIP CODE: ' O-ZIP.

      *    NULL CHECK
           IF NL-EMAIL > 0
               DISPLAY 'EMAIL: ' EMAIL-VALUE
           ELSE
               DISPLAY 'EMAIL: UNKNOWN'.

           DISPLAY 'RECURRING CUSTOMER: ' RECUR.

       DELETE-CUST.
           EXEC SQL
               DELETE FROM CUSTOMERS
                   WHERE CUSTOMERID = :PK-CUSTID
           END-EXEC.
           IF SQLCODE = 0
               DISPLAY '1 ROW WAS DELETED'
           ELSE
               DISPLAY 
               'A SERIOUS ERROR OCCURED WHILE DELETING THIS CUSTOMER'
               ADD 1 TO ERRCTR.

       DELETE-ROW-ORD.
           PERFORM PREDELETE-ORD.
           IF ERRCTR = 0
               DISPLAY 'DO YOU STILL WISH TO DELETE THIS ORDER?'
               DISPLAY 'Y - YES'
               DISPLAY 'N - NO'
               ACCEPT WKOP
      *    UPPER-CASE() FUNCTION IS USED TO FORCE USER INPUT TO
      *    UPPERCASE 
               IF FUNCTION UPPER-CASE(WKOP) = 'Y'
                   PERFORM DELETE-ORD
               ELSE
                   DISPLAY 'THE ORDER WAS NOT DELETED'
                   MOVE 'N' TO DELETE-SW.
           
       PREDELETE-ORD.
           DISPLAY 'ENTER AN EXISTING 4 DIGIT ORDER ID:'.
           ACCEPT PK-ORDERID.
           PERFORM SELECT-ORD-DELETE.

       SELECT-ORD-DELETE.
           PERFORM PRESELECT-ORD.
           EXEC SQL
               SELECT CUSTOMERID, ORDERDATE, SHIPPEDDATE, ARRIVALDATE, 
               UPPER(SHIPPINGCITY), SHIPPINGSTATE, SHIPPINGFEE
               INTO :FK-CUSTID, :ORDERDATE, :SHIPDATE :NL-SHIPDATE,
               :ARRIVALDATE :NL-ARRIVALDATE, :SHIPCITY :NL-SHIPCITY, 
               :SHIPST :NL-SHIPST, :SHIPFEE :NL-SHIPFEE
               FROM ORDERS
               WHERE ORDERID = :PK-ORDERID
           END-EXEC.
           IF SQLCODE = 0
               DISPLAY 'ORDER WAS FOUND, PRESS ENTER TO CONTINUE'
               ACCEPT WKHOLD
               PERFORM DISPLAY-ORD
           ELSE
               IF PK-ORDERID = ' '
                   DISPLAY 'NOTHING WAS ENTERED'
                   ADD 1 TO ERRCTR
               ELSE
                   DISPLAY 'ORDER WAS NOT FOUND'
                   ADD 1 TO ERRCTR.

           DISPLAY 'PRESS ENTER TO CONTINUE'.
           ACCEPT WKHOLD.

       PRESELECT-ORD.
      *    CLEARS VALUES IN VARCHAR VARIABLES
           MOVE ' ' TO SHIPCITY-VALUE.
           MOVE ' ' TO SHIPST-VALUE.

      *    CLEARS VALUES IN NULLABLE (INDICATORS) VARIABLES
           MOVE 0 TO NL-SHIPDATE.
           MOVE 0 TO NL-ARRIVALDATE.
           MOVE 0 TO NL-SHIPCITY.
           MOVE 0 TO NL-SHIPST.
           MOVE 0 TO NL-SHIPFEE.

       DISPLAY-ORD.
           DISPLAY 'ORDER ID: ' PK-ORDERID.
           DISPLAY 'CUSTOMER ID: ' FK-CUSTID.
           DISPLAY 'ORDER DATE: ' ORDERDATE.

      *    NULL CHECKS   
           IF NL-SHIPDATE = 0
               DISPLAY 'SHIPPING DATE: ' SHIPDATE
           ELSE
               DISPLAY 'SHIPPING DATE: PENDING'.

           IF NL-ARRIVALDATE = 0
               DISPLAY 'ARRIVAL DATE: ' ARRIVALDATE
           ELSE
               DISPLAY 'ARRIVAL DATE: PENDING'.

           IF NL-SHIPCITY = 0
               DISPLAY 'SHIP CITY: ' SHIPCITY-VALUE
           ELSE
               DISPLAY 'SHIP CITY: PENDING'.

           IF NL-SHIPST = 0
               DISPLAY 'SHIP STATE: ' SHIPST-VALUE
           ELSE
               DISPLAY 'SHIP STATE: PENDING'.

           IF NL-SHIPFEE = 0
               MOVE SHIPFEE TO O-SHIPFEE
               DISPLAY 'SHIPPING FEE: ' O-SHIPFEE
           ELSE
               DISPLAY 'SHIPPING FEE: NONE'.

       DELETE-ORD.
           EXEC SQL.
               DELETE FROM ORDERS
                   WHERE ORDERID = :PK-ORDERID
           END-EXEC.
           IF SQLCODE = 0
               DISPLAY '1 ROW WAS DELETED'
           ELSE
               DISPLAY 
               'A SERIOUS ERROR HAS OCCURED WHILE DELETING THIS ORDER'
               ADD 1 TO ERRCTR.

           DISPLAY 'PRESS ENTER TO CONTINUE'.
           ACCEPT WKHOLD.

       INSERT-ROW-ORD.
           DISPLAY 'ENTER A NEW 4 DIGIT ORDER ID:'.
           ACCEPT PK-ORDERID.
           PERFORM PREINSERT-ORD.

           IF ERRCTR = 0
               PERFORM INSERT-ORD.

       PREINSERT-ORD.
           PERFORM SELECT-ORD-INSERT.
           
           IF ERRCTR = 0
               PERFORM ENTER-MORE-VALUES.

           IF SELECTERR-SW = 'N'
               DISPLAY 'PRESS ENTER TO CONTINUE'
               ACCEPT WKHOLD.

      *    CALLED TO CHECK IF THE PRIMARY KEY ENTERED ALREADY EXISTS
      *    (CHECKS IF THE SQLCODE RETURNS 100)
       SELECT-ORD-INSERT.
           PERFORM PRESELECT-ORD.
           EXEC SQL
               SELECT CUSTOMERID, ORDERDATE, SHIPPEDDATE, ARRIVALDATE, 
               SHIPPINGCITY, SHIPPINGSTATE, SHIPPINGFEE
               INTO :FK-CUSTID, :ORDERDATE, :SHIPDATE :NL-SHIPDATE,
               :ARRIVALDATE :NL-ARRIVALDATE, :SHIPCITY :NL-SHIPCITY, 
               :SHIPST :NL-SHIPST, :SHIPFEE :NL-SHIPFEE
               FROM ORDERS
               WHERE ORDERID = :PK-ORDERID
           END-EXEC.
           IF SQLCODE = 100
               IF PK-ORDERID = ' '
                   DISPLAY 'NOTHING WAS ENTERED'
                   ADD 1 TO ERRCTR
                   MOVE 'Y' TO SELECTERR-SW
               ELSE
                   IF PK-ORDERID NOT ALPHABETIC
                       PERFORM ORDID-DIGITS-CHECK
                       IF SELECTERR-SW = 'N'
                           DISPLAY 'ORDER ID IS VALID'
                       END-IF
                   ELSE
                       DISPLAY 'ORDER ID SHOULD BE NUMERIC'
                       ADD 1 TO ERRCTR
                       MOVE 'Y' TO SELECTERR-SW
           ELSE
               IF SQLCODE = 0
                   DISPLAY 
        'ORDER ID IS INVALID, YOU SHOULDN''T BE USING AS AN EXISTING ID'
                   ADD 1 TO ERRCTR
                   MOVE 'Y' TO SELECTERR-SW
               ELSE
                   DISPLAY 'A SERIOUS ERROR HAS OCCURED'
                   ADD 1 TO ERRCTR
                   MOVE 'Y' TO SELECTERR-SW.

           DISPLAY 'PRESS ENTER TO CONTINUE'.
           ACCEPT WKHOLD.

      *    USED TO CHECK HOW MANY DIGITS AN ORDER ID IS
       ORDID-DIGITS-CHECK.
           MOVE 0 TO SPACES-CNT.
      *    USED TO FIND THE AMOUNT OF TRAILING SPACES
           INSPECT FUNCTION REVERSE(PK-ORDERID)
               TALLYING SPACES-CNT FOR LEADING ' '.

           IF SPACES-CNT > 0
               DISPLAY 'ORDER ID SHOULD BE 4 DIGITS'
               ADD 1 TO ERRCTR
               MOVE 'Y' TO SELECTERR-SW.


       ENTER-MORE-VALUES.
           DISPLAY 'ENTER AN EXISTING 4 DIGIT CUSTOMER ID:'.
           ACCEPT FK-CUSTID.
           PERFORM SELECT-CUST-INSERT.

           IF ERRCTR = 0
               DISPLAY 'ENTER THE ORDER DATE IN YYYY-MM-DD FORMAT:'
               ACCEPT ORDERDATE
               PERFORM ORDDATE-CHECK.

           IF ERRCTR = 0
               DISPLAY 'ENTER THE SHIPPED DATE IN YYYY-MM-DD FORMAT:'
               ACCEPT SHIPDATE
               PERFORM SHIPDATE-CHECK.

           IF ERRCTR = 0
               DISPLAY 'ENTER AN ARRIVAL DATE IN YYYY-MM-DD FORMAT:'
               ACCEPT ARRIVALDATE
               PERFORM ARRIVDATE-CHECK.

           IF ERRCTR = 0
               DISPLAY 'ENTER THE SHIPPING CITY:'
               ACCEPT SHIPCITY-VALUE
               PERFORM CALC-LEN-SHIPCITY
               PERFORM SHIPCITY-CHECK.

           IF ERRCTR = 0
               DISPLAY 
            'ENTER THE SHIPPING STATE (MAKE SURE STATE IS ABBREVIATED):'
               ACCEPT SHIPST-VALUE
               PERFORM CALC-LEN-SHIPST
               PERFORM SHIPST-CHECK.

           IF ERRCTR = 0
               DISPLAY 'ENTER THE SHIPPING FEE:'
               ACCEPT WKSHIPFEE
               PERFORM SHIPFEE-CHECK.

      *    USED TO CHECK THAT THE CUSTOMER ID THAT WAS ENTERED ALREADY
      *    EXISTS (RETURNS A SQLCODE OF 0 IF IT EXISTS)
       SELECT-CUST-INSERT.
           PERFORM PRESELECT-CUST.
           EXEC SQL 
               SELECT FIRSTNAME, LASTNAME, UNITNUMBER, STREET, CITY, ST,
               ZIP, EMAIL, RECURRING
               INTO :FNAME, :LNAME, :UNITNUM, :STREET, :CITY, :ST, :ZIP,
               :EMAIL :NL-EMAIL, :RECUR
               FROM CUSTOMERS
               WHERE CUSTOMERID = :FK-CUSTID
           END-EXEC. 
           IF SQLCODE = 0 
	           DISPLAY 'CUSTOMER ID IS VALID'
           ELSE
               IF SQLCODE = 100
                   IF FK-CUSTID = ' '
                       DISPLAY 'CUSTOMER ID WAS NOT ENTERED'
                       ADD 1 TO ERRCTR
                       MOVE 'Y' TO SELECTERR-SW
                   ELSE
                       DISPLAY 
            'CUSTOMER ID IS INVALID, YOU SHOULD BE USING AN EXISTING ID'
                       ADD 1 TO ERRCTR
                       MOVE 'Y' TO SELECTERR-SW
               ELSE
                   DISPLAY 'A CRITICAL ERROR HAS OCCURED'
                   ADD 1 TO ERRCTR
                   MOVE 'Y' TO SELECTERR-SW.
           
           DISPLAY 'PRESS ENTER TO CONTINUE'.
           ACCEPT WKHOLD.

      *    CHECKS IF A NULL VALUE WAS ENTERED FOR ORDER DATE 
       ORDDATE-CHECK.
           IF ORDERDATE = ' '
               DISPLAY 'ORDER DATE WAS NOT ENTERED'
               ADD 1 TO ERRCTR
           ELSE
               IF ORDERDATE NOT ALPHABETIC
                   UNSTRING ORDERDATE DELIMITED BY '-'
                       INTO WKYYYY, WKMM, WKDD
                   END-UNSTRING
                   IF WKYYYY NOT ALPHABETIC AND WKMM NOT ALPHABETIC AND
                   WKDD NOT ALPHABETIC
                       IF FUNCTION NUMVAL(WKYYYY) = 0 AND FUNCTION 
                       NUMVAL(WKMM) = 0 AND FUNCTION NUMVAL(WKDD) = 0
                           DISPLAY 'DATE ' ORDERDATE  
                           ' SHOULD BE IN YYYY-MM-DD FORMAT'
                           ADD 1 TO ERRCTR
                       END-IF
                   ELSE
                       DISPLAY 'ORDER DATE SHOULD NOT CONTAIN LETTERS'
                       ADD 1 TO ERRCTR
               ELSE
                   DISPLAY 'ORDER DATE SHOULD NOT BE ALPHABETIC'
                   ADD 1 TO ERRCTR.

       SHIPDATE-CHECK.
           MOVE ' ' TO WKYYYY.
           MOVE ' ' TO WKMM.
           MOVE ' ' TO WKDD.

           IF SHIPDATE = ' '
               MOVE -1 TO NL-SHIPDATE
           ELSE
               IF SHIPDATE NOT ALPHABETIC
                   UNSTRING SHIPDATE DELIMITED BY '-'
                       INTO WKYYYY, WKMM, WKDD
                   END-UNSTRING
                   IF WKYYYY NOT ALPHABETIC AND WKMM NOT ALPHABETIC AND 
                   WKDD NOT ALPHABETIC
                       IF FUNCTION NUMVAL(WKYYYY) = 0 AND FUNCTION 
                       NUMVAL(WKMM) = 0 AND FUNCTION NUMVAL(WKDD) = 0
                           DISPLAY 'DATE ' SHIPDATE  
                           ' SHOULD BE IN YYYY-MM-DD FORMAT'
                           ADD 1 TO ERRCTR
                       END-IF
                   ELSE
                       DISPLAY 'SHIPPED DATE SHOULD NOT CONTAIN LETTERS'
                       ADD 1 TO ERRCTR
               ELSE
                   DISPLAY 'SHIPPED DATE SHOULD NOT BE ALPHABETIC'
                   ADD 1 TO ERRCTR
               END-IF
               IF ERRCTR = 0
                   MOVE 0 TO NL-SHIPDATE.

       ARRIVDATE-CHECK.
           MOVE ' ' TO WKYYYY.
           MOVE ' ' TO WKMM.
           MOVE ' ' TO WKDD.

           IF ARRIVALDATE = ' '
               MOVE -1 TO NL-ARRIVALDATE
           ELSE
               IF ARRIVALDATE NOT ALPHABETIC
                   UNSTRING ARRIVALDATE DELIMITED BY '-'
                       INTO WKYYYY, WKMM, WKDD
                   END-UNSTRING
                   IF WKYYYY NOT ALPHABETIC AND WKMM NOT ALPHABETIC AND 
                   WKDD NOT ALPHABETIC
                       IF FUNCTION NUMVAL(WKYYYY) = 0 AND FUNCTION 
                       NUMVAL(WKMM) = 0 AND FUNCTION NUMVAL(WKDD) = 0
                           DISPLAY 'DATE ' ARRIVALDATE  
                           ' SHOULD BE IN YYYY-MM-DD FORMAT'
                           ADD 1 TO ERRCTR
                       END-IF
                   ELSE
                       DISPLAY 'ARRIVAL DATE SHOULD NOT CONTAIN LETTERS'
                       ADD 1 TO ERRCTR
               ELSE
                   DISPLAY 'ARRIVAL DATE SHOULD NOT BE ALPHABETIC'
                   ADD 1 TO ERRCTR
               END-IF
               IF ERRCTR = 0
                   MOVE 0 TO NL-ARRIVALDATE.

       CALC-LEN-SHIPCITY.
           MOVE 0 TO L.
           INSPECT FUNCTION REVERSE(SHIPCITY-VALUE)
               TALLYING L FOR LEADING ' '.
           SUBTRACT L FROM LENGTH OF SHIPCITY-VALUE GIVING 
           SHIPCITY-LENG.

       SHIPCITY-CHECK.
           IF SHIPCITY-VALUE = ' '
               MOVE -1 TO NL-SHIPCITY
           ELSE
               IF SHIPCITY-VALUE NOT ALPHABETIC
                   DISPLAY 'SHIPPING CITY SHOULD BE ALPHABETIC'
                   ADD 1 TO ERRCTR
               ELSE
                   MOVE 0 TO NL-SHIPCITY.

       CALC-LEN-SHIPST.
           MOVE 0 TO L.
           INSPECT FUNCTION REVERSE(SHIPST-VALUE)
               TALLYING L FOR LEADING ' '.
           SUBTRACT L FROM LENGTH OF SHIPST-VALUE GIVING 
           SHIPST-LENG.

       SHIPST-CHECK.
           IF SHIPST-VALUE = ' '
               MOVE -1 TO NL-SHIPST
           ELSE
               IF SHIPST-VALUE NOT ALPHABETIC
                   DISPLAY 'SHIPPING STATE SHOULD BE ALPHABETIC' 
                   ADD 1 TO ERRCTR
               END-IF
               IF SHIPST-LENG < 2
                   DISPLAY
           'SHIPPING STATE IS TOO SHORT, IT SHOULD BE 2 CHARACTERS LONG'
                   ADD 1 TO ERRCTR
               END-IF
               IF ERRCTR = 0
                   MOVE 0 TO NL-SHIPST.

       SHIPFEE-CHECK.
           IF WKSHIPFEE = ' '
               MOVE -1 TO NL-SHIPFEE
           ELSE
               IF WKSHIPFEE NOT ALPHABETIC
      *    NUMVAL() FUNCTION IS USED TO CONVERT ALPHANUMERIC DATA TO 
      *    NUMERIC DATA
                   MOVE FUNCTION NUMVAL(WKSHIPFEE) TO SHIPFEE
                   IF SHIPFEE <= 0
                       DISPLAY 'SHIPPING FEE SHOULD BE GREATER THAN 0'
                       ADD 1 TO ERRCTR
                   ELSE
                       MOVE 0 TO NL-SHIPFEE
               ELSE
                   DISPLAY 'SHIPPING FEE SHOULD BE NUMERIC'
                   ADD 1 TO ERRCTR.

       INSERT-ORD.
           EXEC SQL
               INSERT INTO ORDERS
                   (ORDERID, CUSTOMERID, ORDERDATE, SHIPPEDDATE, 
                   ARRIVALDATE, SHIPPINGCITY, SHIPPINGSTATE, 
                   SHIPPINGFEE)
               VALUES (:PK-ORDERID, :FK-CUSTID, :ORDERDATE, :SHIPDATE
               :NL-SHIPDATE, :ARRIVALDATE :NL-ARRIVALDATE,  :SHIPCITY
               :NL-SHIPCITY, :SHIPST :NL-SHIPST, :SHIPFEE :NL-SHIPFEE)
           END-EXEC.
           IF SQLCODE = 0
               DISPLAY '1 ROW WAS INSERTED'
           ELSE
               DISPLAY 'NO ROWS WERE INSERTED'
               ADD 1 TO ERRCTR.

           DISPLAY 'PRESS ENTER TO CONTINUE'.
           ACCEPT WKHOLD.

       INSERT-ROW-LAPORD.
           DISPLAY 'SELECT A METHOD'.
           DISPLAY '1 - INSERT A ROW WITH NO NULL VALUES'.
           DISPLAY '2 - INSERT A ROW WITH A NULL VALUE'.
           ACCEPT WKOP.

           IF WKOP = '1'
               PERFORM INSERT-ROW-NO-NULLS
           ELSE
               IF WKOP = '2'
                   PERFORM INSERT-ROW-WITH-NULLS
               ELSE
                   DISPLAY 
                  'INVALID METHOD WAS SELECTED, PRESS ENTER TO CONTINUE'
                   ACCEPT WKHOLD.

       INSERT-ROW-NO-NULLS.
           EXEC SQL
               INSERT INTO LAPTOPORDERS
                   (ORDERID, LAPTOPID, QUANTITY, ORDERCOST, DEALS)
               VALUES ('1006', '1000', 2, 1018.26, .25)
           END-EXEC.
           IF SQLCODE = 0
               DISPLAY '1 ROW WAS INSERTED'
           ELSE
               DISPLAY 'NO ROWS WERE INSERTED'.

           DISPLAY 'PRESS ENTER TO CONTINUE'.
           ACCEPT WKHOLD.

       INSERT-ROW-WITH-NULLS.
           EXEC SQL
               INSERT INTO LAPTOPORDERS
                   (ORDERID, LAPTOPID, QUANTITY, ORDERCOST, DEALS)
               VALUES ('1007', '1005', 5, 4499.95, NULL)
           END-EXEC.
           IF SQLCODE = 0
               DISPLAY '1 ROW WAS INSERTED'
           ELSE
               DISPLAY 'NO ROWS WERE INSERTED'.

           DISPLAY 'PRESS ENTER TO CONTINUE'.
           ACCEPT WKHOLD.
		   
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
           MOVE 0 TO L.

           INSPECT FUNCTION REVERSE(PHONE-VALUE)
               TALLYING L FOR LEADING ' '.

           SUBTRACT L FROM LENGTH OF PHONE-VALUE GIVING PHONE-LENG.

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
           MOVE 0 TO L.

           INSPECT FUNCTION REVERSE(CPU-VALUE)
               TALLYING L FOR LEADING ' '.

           SUBTRACT L FROM LENGTH OF CPU-VALUE GIVING CPU-LENG.

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

      *    UPPER-CASE() FUNCTION IS USED TO FORCE CHARACTERS ENTERED BY
      *    THE USER TO UPPERCASE
           IF FUNCTION UPPER-CASE(WKOP) = 'Y'
               PERFORM COMMIT-CHANGES.
       
       COMMIT-CHANGES.
           EXEC SQL COMMIT WORK END-EXEC.

       SHUT-DOWN.
           DISPLAY 'CLOSING PROGRAM, PRESS ENTER TO CONTINUE'.
           ACCEPT WKHOLD.
           STOP 'PRESS ENTER AGAIN TO TERMINATE'.
           STOP RUN.

       OPENESQL-ERROR SECTION.
           DISPLAY 'SQL ERROR = ' SQLSTATE ' ' SQLCODE.
      *    ADDED A SQLCODE CHECK OF -532 HERE BECAUSE THE ERROR THAT 
      *    LEDS TO  A SQLCODE OF -532 WOULD TRIGGER THIS SECTION TO BE 
      *    EXECUTED
           IF SQLCODE = -532
               DISPLAY 'THIS ROW CONTAINS A FOREIGN KEY'.
           DISPLAY MFSQLMESSAGETEXT.
           ACCEPT WKHOLD.
           STOP RUN.