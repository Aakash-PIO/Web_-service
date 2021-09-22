   **===============HEADER==================================**
      **
     H DFTACTGRP(*NO) ACTGRP(*NEW) BNDDIR('AAKASH/B5')
      **
      **===============PHYSICAL FILE DECLARATION===============**
      **
     FEMP_MAST1 IF   E           K DISK
      **
      **======ERROR DATA STRUCTURE=============================**
      **
     DErrDs            ds                  Qualified
     D BytesProv                     10I 0 Inz(0)
     D BytesAvail                    10I 0 Inz(0)
      *
     D CRLF            C                   x'0d25'
     D DATA            S           5000A
     D URL             S            100A
     D POS             S              6s 0
     D URLID           S              4S 0

      *=========PROCEDURE DECLARATION=================================**
      **
     DGetenv           pr              *   ExtProc('getenv')
     D var                             *   value Options(*string)

      **
      **========PROCEDURE DECLARATION=================================**
      **
     DWriteToWeb       pr                  ExtProc('QtmhWrStout')
     D Datavar                    65535A   Options(*VarSize)
     D Datavarlen                    10I 0 const
     D Err_code                    8000A   Options(*VarSize)
      **
      **=============MAIN PROGRAM START===============================**
      **
      /Free
      **                 
      **
         DATA = 'Content-type: Text/html' + CRLF + CRLF ;
         writetoweb(DATA: %len(%trim(DATA)): ErrDs);

         URL = %Str(GetEnv('REQUEST_URI'));
         POS = %SCAN('/':URL);
         POS = %SCAN('/':URL:POS+1) + 1;
         POS = %SCAN('/':URL:POS+1) + 1;

         MONITOR;
           URLID = %DEC(%SUBST(URL:POS:%LEN(%TRIM(URL))-(POS-1)):4:0);
           CHAIN URLID EMP_mast1;
           IF %FOUND(EMP_mast1);
             DATA = 'EMPLOYEE ID:'+(%CHAR(EMPID))+CRLF +
                    'EMPLOYEE NAME:'+EMPNAM+CRLF +
                    'EMPLOYEE AGE:'+(%CHAR(EMPAGE))+CRLF +
                    'EMPLOYEE MOBILE NO:'+(%CHAR(EMPMOB))+CRLF +
                    'EMPLOYEE DEPARTMENT:'+EMPDPT+CRLF;
           ELSE;
             DATA = 'INVALID EMPLOYEE ID';
           ENDIF;
      **
         ON-ERROR;
           DATA = 'INVALID URL';
         ENDMON;
      **
         writetoweb(DATA: %len(%trim(DATA)): ErrDs);

         *Inlr = *On;
         Return;
      **
      **
      /End-Free
