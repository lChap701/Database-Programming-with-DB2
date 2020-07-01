       WORKING-STORAGE SECTION.
      *    REPRESENTS THE ENTER KEY
       01  WKHOLD                          PIC X.
      *    REPRESENTS THE OPTION THAT THE USER SELECTED
       01  WKOP                            PIC X.

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
           03  NL-EMAILAD                  PIC S9(4)       COMP.
           03  NL-PHONENUM                 PIC S9(4)       COMP.
      **********************VARCHAR VARIABLES***************************
       01  COMPNAME.
           49  COMPNAME-LENG               PIC S9(4)       COMP.
           49  COMPNAME-VALUE              PIC X(25).
       01  ADDR.
           49  ADDR-LENG                   PIC S9(4)       COMP.
           49  ADDR-VALUE                  PIC X(52).
       01  EMAILAD.
           49  EMAILAD-LENG                PIC S9(4)       COMP.
           49  EMAILAD-VALUE               PIC X(30).
       01  PHONENUM.
           49  PHONENUM-LENG               PIC S9(4)       COMP.
           49  PHONENUM-VALUE              PIC X(16).
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
           49  SERIAL-LENG             PIC S9(4)       COMP.
           49  SERIAL-VALUE            PIC X(8).
       01  OS.
           49  OS-LENG                 PIC S9(4)       COMP.
           49  OS-VALUE                PIC X(15).
       01  CPU.
           49  CPU-LENG          	   PIC S9(4)       COMP.
           49  CPU-VALUE         	   PIC X(20).
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
      *    USED WHEN UNIT NUMBER IS AT MAX LENGTH
           05  O-UNITNUM                   PIC ZZ9.
      *    USED TO CONTAIN LEADING SPACES WHEN UNIT NUMBER IS BELOW MAX 
      *    LENGTH
           05  WKUNITNUMSPACES             PIC X(3).
      *    FORMATTED O-UNITNUM VARIABLE USED WHEN THE UNIT NUMBER IS 
      *    BELOW MAX LENGTH
           05  O-UNITNUM-FORM              PIC X(3).
           05  O-ZIP                   	   PIC 9(5).
		   05  O-SHIPFEE     			   PIC $9.99.
		   05  O-YEAR					   PIC 9(4).
      *    VARIABLE USED TO HOLD THE CONTENTS OF STORAGE AND RAM
		   05  WKGB			               PIC ZZZ.9.
      *    FORMATTED STORAGE AND RAM VARIABLES CONTAINING 'GB' AND NO
      *    LEADING SPACES
           05  O-STORAGE                   PIC X(8).
		   05  O-RAM					   PIC X(8).
      *    MAXIMUM LENGTH OF A FORMATED PRICE VARIABLE
		   05  O-PRICE        			   PIC $$$$,$$$.99.
      *    USED TO CONTAIN LEADING SPACES WHEN PRICE IS BELOW MAX LENGTH
           05  WKPRICESPACES               PIC X(11).
      *    USED TO CONTAIN NUMERIC DATA WHEN O-PRICE IS BELOW MAX LENGTH
		   05  O-PRICE-FORM				   PIC X(11).
		   05  O-WARRANTY				   PIC 9.
		   05  O-QTY     				   PIC ZZ9.
		   05  O-ORDERCOST				   PIC $$$$,$$$,$$$.99.
		   05  O-DEALS					   PIC .99.

       PROCEDURE DIVISION.
       RUN-START.
           DISPLAY 'START'.
           ACCEPT WKHOLD.
           EXEC SQL 
               WHENEVER SQLERROR PERFORM OPENESQL-ERROR 
           END-EXEC.
           PERFORM CONNECT-TO-DATABASE.
           PERFORM SELECT-OPTION.
      *
           IF WKOP = '1'
               PERFORM SELECT-DATA
           ELSE 
               IF WKOP = '2'
                   PERFORM SELECT-EXAMPLE-2
               ELSE 
                   DISPLAY 'INVALID OPTION, PRESS ENTER TO CONTINUE'.
           PERFORM SHUT-DOWN.
                  
       CONNECT-TO-DATABASE.    
            EXEC SQL 
                CONNECT TO SAMPLE 
            END-EXEC.

       SELECT-OPTION.
           DISPLAY 'SELLECT AN OPTION: '.
           DISPLAY '1 - CUSTOMERS'.
           DISPLAY '2 - LAPTOPS'.
           ACCEPT WKOP.

      *    UPDATED VERSION OF CODE USED IN LU4 
       SELECT-DATA.
           DISPLAY 'ENTER A 4 DIGIT CUSTOMER ID: '.
           ACCEPT PK-CUSTID.
           PERFORM PRESELECT-CUST.
           EXEC SQL 
               SELECT UPPER(FIRSTNAME), UPPER(LASTNAME), UNITNUMBER, 
               UPPER(STREET), UPPER(CITY), ST, ZIP, EMAIL, RECURRING
               INTO :FNAME, :LNAME, :UNITNUM, :STREET, :CITY, :ST, :ZIP,
               :EMAIL :NL-EMAIL, :RECUR
               FROM CUSTOMERS
               WHERE CUSTOMERID = :PK-CUSTID
           END-EXEC. 
           IF SQLCODE = 0 
	           DISPLAY 'CUSTOMER WAS FOUND, PRESS ENTER TO CONTINUE'
               ACCEPT WKHOLD
               PERFORM DISPLAY-CUST
           ELSE
               DISPLAY 'CUSTOMER ' PK-CUSTID ' WAS NOT FOUND'.
           
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

      *    CLEARS VALUES IN NULLABLE VARIABLE
           MOVE 0 TO NL-EMAIL.

       DISPLAY-CUST.
           MOVE UNITNUM TO O-UNITNUM.

      *    TRIMS ANY SPACES IN PRICE BY DUMPING VALUES INTO VARIABLES
           UNSTRING O-UNITNUM DELIMITED ALL ' '
               INTO WKUNITNUMSPACES, O-UNITNUM-FORM.

           MOVE ZIP TO O-ZIP.
		   
           DISPLAY 'CUSTOMER ID: ' PK-CUSTID.
           DISPLAY 'FIRST NAME: ' FNAME-VALUE. 
	       DISPLAY 'LAST NAME: ' LNAME-VALUE.

      *    CHECK IF O-UNITNUM-FORM ONLY CONTAINS SPACES
           IF O-UNITNUM-FORM = ' '
               DISPLAY 'UNIT NUMBER: ' O-UNITNUM
           ELSE
               DISPLAY 'UNIT NUMBER: ' O-UNITNUM-FORM.

	       DISPLAY 'STREET: ' STREET-VALUE.
		   DISPLAY 'CITY: ' CITY-VALUE.
           DISPLAY 'STATE: ' ST-VALUE.
		   DISPLAY 'ZIP CODE: ' O-ZIP.

      *    CHECKS IF EMAIL IS NULL
           IF NL-EMAIL < 0
               DISPLAY 'EMAIL: UNKNOWN'
           ELSE
               DISPLAY 'EMAIL: ' EMAIL-VALUE.

           DISPLAY 'RECURRING CUSTOMER: ' RECUR.

      *    CODE FOR LU5
       SELECT-EXAMPLE-2.
		   DISPLAY 'ENTER A 4 DIGIT LAPTOP ID: '.
           ACCEPT PK-LAPID.
           PERFORM PRESELECT-LAP.
           EXEC SQL 
               SELECT L.COMPANYID, UPPER(COMPANYNAME),
               UPPER(LAPTOPNAME), PRODUCTNUMBER, SERIAL, UPPER(OS),
               YEAR, STORAGE, UPPER(CPU), RAM, PRICE, WARRANTY
               INTO :FK-COMPID, :COMPNAME, :LAPNAME, :PRODNUM, :SERIAL,
               :OS :NL-OS, :YEAR,:STORAGE :NL-STORAGE, :CPU :NL-CPU,
               :RAM :NL-RAM, :PRICE, :WARRANTY :NL-WARRANTY
               FROM LAPTOPS L, COMPANY C
               WHERE L.LAPTOPID = :PK-LAPID AND C.COMPANYID =
               L.COMPANYID
           END-EXEC. 
           IF SQLCODE = 0
               DISPLAY 'LAPTOP WAS FOUND, PRESS ENTER TO CONTINUE'
               ACCEPT WKHOLD
               PERFORM DISPLAY-LAP
           ELSE
               IF PK-LAPID = ' '
                   DISPLAY 'NOTHING WAS ENTERED'
               ELSE
                   DISPLAY 'LAPTOP ' PK-LAPID ' WAS NOT FOUND'.
           
           DISPLAY 'PRESS ENTER TO CONTINUE'.
           ACCEPT WKHOLD.

       PRESELECT-LAP.
      *    CLEARS VALUES IN VARCHAR VARIABLES
           MOVE ' ' TO COMPNAME-VALUE.
           MOVE ' ' TO LAPNAME-VALUE.
           MOVE ' ' TO PRODNUM-VALUE.
           MOVE ' ' TO SERIAL-VALUE.
           MOVE ' ' TO OS-VALUE.
           MOVE ' ' TO CPU-VALUE.

      *    CLEARS VALUES IN NULLABLE VARIABLES
           MOVE 0 TO NL-OS.
           MOVE 0 TO NL-STORAGE.
           MOVE 0 TO NL-CPU.
           MOVE 0 TO NL-RAM.
           MOVE 0 TO NL-WARRANTY.

       DISPLAY-LAP.
           MOVE YEAR TO O-YEAR.
           MOVE PRICE TO O-PRICE.
      *    TRIMS ANY SPACES IN PRICE BY DUMPING VALUES INTO VARIABLES
           UNSTRING O-PRICE DELIMITED BY ALL ' '
               INTO WKPRICESPACES, O-PRICE-FORM.
		   
           DISPLAY 'LAPTOP ID: ' PK-LAPID.
           DISPLAY 'COMPANY ID: ' FK-COMPID.
           DISPLAY 'BRAND: ' COMPNAME-VALUE.
	       DISPLAY 'LAPTOP NAME: ' LAPNAME-VALUE.
           DISPLAY 'PRODUCT NUMBER: ' PRODNUM-VALUE.
	       DISPLAY 'SERIAL: ' SERIAL-VALUE.

      *    CHECKS IF OS IS NULL
           IF NL-OS < 0
               DISPLAY 'OS: UNKNOWN' 
           ELSE
               DISPLAY 'OS: ' OS-VALUE.

		   DISPLAY 'YEAR: ' O-YEAR.

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

      *    CHECKS IF CPU IS NULL
           IF NL-CPU < 0
               DISPLAY 'CPU: UNKNOWN'
           ELSE
               DISPLAY 'CPU: ' CPU-VALUE.

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

      *    CHECKS IF O-PRICE-FORM CONTAINS ONLY SPACES WHEN THE PRICE
      *    IS AT MAX LENGTH
           IF O-PRICE-FORM = ' '
               DISPLAY 'PRICE: ' O-PRICE
           ELSE
               DISPLAY 'PRICE: ' O-PRICE-FORM.

      *    CHECKS IF WARRANTY IS NULL
           IF NL-WARRANTY < 0
               DISPLAY 'WARRANTY: NONE'
           ELSE
               MOVE WARRANTY TO O-WARRANTY
               DISPLAY 'WARRANTY: ' O-WARRANTY.

       SHUT-DOWN.
           DISPLAY 'PROGRAM STOPPING'.
           ACCEPT WKHOLD.
           STOP 'PRESS <CR> TO TERMINATE'.
           STOP RUN.
		   
       OPENESQL-ERROR SECTION.
           DISPLAY 'SQL ERROR = ' SQLSTATE ' ' SQLCODE.
           DISPLAY MFSQLMESSAGETEXT.
           ACCEPT WKHOLD.
           STOP RUN.