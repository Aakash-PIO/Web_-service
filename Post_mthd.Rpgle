 **
      **================Header===========================**
      **
     HDFTACTGRP(*NO) ACTGRP(*NEW) BNDDIR('AAKASH/B8':'QC2LE')
      **
      **================Header===========================**
      **
     FEMP_MAST1 IF   E           K DISK
      **
      **========Procedure Declaration ===============================**
      **
     DGetenv           pr              *   ExtProc('getenv')
     D var                             *   value Options(*string)
      **

      **========Procedure Declaration ===============================**
      **
     Dwritetoweb       pr                  extproc('QtmhWrStout')
     D Datavar                    65535A   Options(*varsize)
     D Datavarlen                    10I 0 const
     D Errorcode                   8000A   Options(*Varsize)
      **
      **======Error Data Structure ==================================**
      **
     DErrDs            DS                  Qualified
     D BytesProv                     10I 0 Inz(0)
     D BytesAvail                    10I 0 Inz(0)

       /COPY QSYSINC/QRPGLESRC,QUSEC

      **
      **========Procedure Declaration ===============================**
     DReadStdInput     pr                  ExtProc('QtmhRdStin')
     D szRtnBuffer                65535A   Options(*varsize)
     D nBufLen                       10I 0 const
     D nRtnLen                       10I 0
     D QUSEC                               like(QUSEC)
      *
     D CRLF            C                   x'0d25'
     D DATA            S           5000A
     D URL             S            100A
     D REQMETHOD       S             20A
     D CONTENT         S            100A
      *
     D RtnBuffer       s           4096A   inz
     D RtnLen          s             10I 0
     D apiError        ds                  likeds(QUSEC) inz

      *--------------Main Program---------------*
      /Free
      **
      **
         DATA = 'Content-type: Text/html' + CRLF + CRLF ;
         WriteToWeb(DATA: %len(%trim(DATA)): ErrDs);

         URL = %Str(GetEnv('REQUEST_URI'));
         REQMETHOD = %STR(GetEnv('REQUEST_METHOD'));
         IF REQMETHOD = 'POST';
           CONTENT = %STR(GetEnv('CONTENT_TYPE'));
           ReadStdInput(RtnBuffer:%size(RtnBuffer):RtnLen:apiError);
         ENDIF;

         DATA ='URL:'+URL+CRLF+'REQUEST METHOD:'+REQMETHOD+CRLF+'CONTENT TYPE:'+
                 CONTENT+CRLF;
         writetoweb(DATA: %len(%trim(DATA)): ErrDs);
         DATA = 'DATA:'+%trim(RtnBuffer);
         writetoweb(DATA: %len(%trim(DATA)): ErrDs);

         *Inlr = *On;
         Return;
      /End-Free
