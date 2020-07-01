       WORKING-STORAGE SECTION.
       01  WKHOLD                          PIC X.
       
           EXEC SQL INCLUDE SQLCA END-EXEC. 
       
       01  MFSQLMESSAGETEXT                PIC X(250).  

   	  *    HOST VARIABLE DECLARATION AREA
           EXEC SQL BEGIN DECLARE SECTION END-EXEC.
      *    CUSTOMERS TABLE
       01  DCLCUSTOMERS.
           03  PK-CUSTID                   PIC X(4).   
           03  FNAME.
               49  FNAME-LENG              PIC S9(4)       COMP.
               49  FNAME-VALUE             PIC X(12).
           03  LNAME.                      
               49  LNAME-LENG              PIC S9(4)       COMP.
               49  LNAME-VALUE             PIC X(12).
           03  UNITNUM                     PIC S9(9)       COMP.
           03  STREET.
               49  STREET-LENG             PIC S9(4)       COMP.
               49  STREET-VALUE            PIC X(20).
           03  CITY.
               49  CITY-LENG               PIC S9(4)       COMP.
               49  CITY-VALUE              PIC X(20).
           03  STATE.
               49  STATE-LENG              PIC S9(4)       COMP.
               49  STATE-VALUE             PIC XX.
           03  ZIP                         PIC S9(9)       COMP.
           03  EMAIL.
               49  EMAIL-LENG              PIC S9(4)       COMP.
               49  EMAIL-VALUE             PIC X(30).
           03  RECUR                       PIC X.

      *    ORDERS TABLE
       01  DCLORDERS.
           03  PK-ORDERID                  PIC X(4).
           03  FK-CUSTID                   PIC X(4).
           03  ORDERDATE                   PIC X(10).
           03  SHIPDATE                    PIC X(10).
           03  ARRIVALDATE                 PIC X(10).
           03  SHIPCITY.
               49 SHIPCITY-LENG            PIC S9(4)       COMP.
               49 SHIPCITY-VALUE           PIC X(20).
           03  SHIPST.
               49  SHIPST-LENG             PIC S9(4)       COMP.
               49  SHIPST-VALUE            PIC XX.
           03  SHIPFEE                     PIC S9V99       COMP-3.

      *    COMPANY TABLE 
       01  DCLCOMPANY.
           03  COMPID                      PIC X(4).
           03  COMPNAME.
               49  COMPNAME-LENG           PIC S9(4)       COMP.
               49  COMPNAME-VALUE          PIC X(25).
           03  ADDR.
               49  ADDR-LENG               PIC S9(4)       COMP.
               49  ADDR-VALUE              PIC X(52).
           03  EMAILADDR.
               49  EMAILADDR-LENG          PIC S9(4)       COMP.
               49  EMAILADDR-VALUE         PIC X(30).
           03  PHONENUM.
               49  PHONENUM-LENG           PIC S9(4)       COMP.
               49  PHONENUM-VALUE          PIC X(16).

      *    LAPTOPS TABLE
       01  DCLLAPTOPS.
           03  PK-LAPID                    PIC X(4).
           03  FK-COMPID                   PIC X(4).
           03  LAPNAME.
               49  LAPNAME-LENG            PIC S9(4)       COMP.
               49  LAPNAME-VALUE           PIC X(25).
           03  PRODNUM.
               49  PRODNUM-LENG            PIC S9(4)       COMP.
               49  PRODNUM-VALUE           PIC X(10).
           03  SERIAL.
               49  SERIAL-LENG             PIC S9(4)       COMP.
               49  SERIAL-VALUE            PIC X(8).
           03  OS.
               49  OS-LENG                 PIC S9(4)       COMP.
               49  OS-VALUE                PIC X(15).
           03  YYYY                        PIC S9(9)       COMP.
           03  STORAGE                     PIC S9(3)V9     COMP-3.
           03  CPU.
               49  CPU-LENG          	   PIC S9(4)       COMP.
               49  CPU-VALUE         	   PIC X(20).
           03  RAM                         PIC S9(3)V9     COMP-3.
           03  PRICE                       PIC S9(6)V99    COMP-3.
           03  WARRANTY                    PIC S9(9)       COMP.

      *    LAPTOPORDERS TABLE
       01  DCLLAPORDERS.
           03  FK-ORDERID                  PIC X(4).
           03  FK-LAPID                    PIC X(4).
           03  QTY                         PIC S9(9)       COMP.
           03  ORDERCOST                   PIC S9(9)V99    COMP-3.
           03  DEALS                       PIC SV99        COMP-3.

           EXEC SQL END DECLARE SECTION END-EXEC.

      *    CONTAINS ALL THE FORMATTED VARIABLES
       01  FORMATTED-DATA.
           05  O-UNITNUM                   PIC ZZ9.
           05  O-ZIP                   	   PIC 9(5).
		   05  O-SHIPFEE     			   PIC $$V99.
		   05  O-YYYY					   PIC 9(4).
		   05  O-STORAGE				   PIC ZZZV9.
		   05  O-RAM					   PIC ZZZV9.
		   05  O-PRICE					   PIC $$$$,$$$V99.
		   05  O-WARRANTY				   PIC 9.
		   05  O-QTY     				   PIC ZZ9.
		   05  O-ORDERCOST				   PIC $$$$,$$$,$$$V99.
		   05  O-DEALS					   PIC V99.

       PROCEDURE DIVISION.
       RUN-START.
           DISPLAY 'START'.
           ACCEPT WKHOLD.
           EXEC SQL 
               WHENEVER SQLERROR PERFORM OpenESQL-Error 
           END-EXEC.
           PERFORM CONNECT-TO-DATABASE.
           PERFORM SELECT-DATA.
           PERFORM SHUT-DOWN.
                  
       CONNECT-TO-DATABASE.    
            EXEC SQL 
                CONNECT TO SAMPLE 
            END-EXEC.
           
       SELECT-DATA.    
           MOVE '1000' TO PK-CUSTID.
           EXEC SQL 
               SELECT FirstName, LastName, UnitNumber, Street, City, ST,
               Zip, Email, Recurring
               INTO :FNAME, :LNAME, :UNITNUM, :STREET, :CITY, :STATE, 
               :ZIP, :EMAIL, :RECUR
               FROM Customers
               WHERE CustomerID = :PK-CUSTID
           END-EXEC. 
           IF SQLCODE = 0 
               MOVE UNITNUM TO O-UNITNUM
               MOVE ZIP TO O-ZIP
	           DISPLAY 'Customer was found, press Enter to continue'
			   ACCEPT WKHOLD
               DISPLAY 'Customer ID: ' PK-CUSTID 
               DISPLAY 'First Name: ' FNAME-VALUE 
		       DISPLAY 'Last Name: ' LNAME-VALUE 
               DISPLAY 'Unit Number: ' O-UNITNUM
	           DISPLAY 'STREET: ' STREET-VALUE
			   DISPLAY 'City: ' CITY-VALUE
               DISPLAY 'State: ' STATE-VALUE 
			   DISPLAY 'Zip Code: ' O-ZIP
               DISPLAY 'Email: ' EMAIL-VALUE
               DISPLAY 'Recurring Customer: ' RECUR
           ELSE
               DISPLAY 'Customer was not found'.
           
           DISPLAY 'Press Enter to continue'.
           ACCEPT WKHOLD.
		   
       SHUT-DOWN.
           DISPLAY 'Program stopping '
           ACCEPT WKHOLD.
           STOP 'Press <CR> to terminate'
           STOP RUN.
		   
       OpenESQL-Error SECTION.
           DISPLAY 'SQL Error = ' SQLSTATE ' ' SQLCODE.
           DISPLAY MFSQLMESSAGETEXT
           ACCEPT WKHOLD.
           STOP RUN.