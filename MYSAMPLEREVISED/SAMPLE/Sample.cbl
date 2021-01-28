       identification division.
       program-id. Sample.

       environment division.
       configuration section.

       data division.
       working-storage section.
       01 WK-HOLD         PIC X.

       procedure division.
           Display "HELLO ALL".
           ACCEPT WK-HOLD.
           goback.
           
       end program Sample.