**FREE
      CTL-OPT dftactgrp(*NO) Bnddir('AAKASH/WEB123');
      Dcl-PR WriteToWeb ExtProc('QtmhWrStout');
        Datavar  char(65535)  options(*Varsize);
        DataVarLen  int(10)  Const;
        errcode  char(8000)  options(*Varsize);
      End-PR;

       Dcl-ds Errds qualified;
         bytesprov int(10) inz(0);
         bytesavail int(10) inz(0);
       End-Ds;

       Dcl-s data char(5000);
       Dcl-C CRLF  x'0d25' ;

       Data = 'content-Type: text/plain' + CRLF + CRLF ;
       WriteToWeb(data : %len(%trim(data)):Errds);
       data= '<h1> Hello world from Rpg Practice web service</h1>';
       WriteToWeb(data : %len(%trim(data)):Errds);
       *inlr = *on;
      Return;
