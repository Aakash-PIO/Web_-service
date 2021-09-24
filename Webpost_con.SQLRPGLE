     H DFTACTGRP(*NO) ACTGRP(*NEW)
      **
      **==============Physical File Declaration================**
      **
     FEmp_mast2 IF A E             Disk
      **
      **==============Variable Declaration=====================**
      **
     D W_Msg           s             50A   Varying
     D W_Head          s            100A   Varying
     D W_URL           s            100A   Varying
     D W_Hdr           s            300A   Varying
     D W_body          s            100A   Varying
     D W_pos           s             10A   Varying
     D W_empid         s              5s 0 inz
     D W_auth          s            100A   Varying
     D Rsqlcode        s              5A
     D messageLength   s              5s 0
     D messageText     s          32740    Varying
      **
      **=============Main Programm=====================**
      **
     c/Exec Sql
     c+ Set Option Commit = *none
     c/End-Exec
     c/Exec Sql
     c+ call qsys2.qcmdexc('CHGJOB CCSID(37)')
     c/End-Exec
     c                   Eval      w_url='https://gorest.co.in/public/v1/users/+
     c                               1664'
     c                   Eval      W_auth='3ad0375384ec82548ea8ba5cbfba1c627598+
     c                                    cd80541e71a8b556a79fe19f2325'
     c                   Eval      w_hdr = '<httpHeader><header +
     c                                     name="Content-Type"  +
     c                                     value="Application/json">'+
     c                                     '</header><header   +
     c                                     name="Authorization" '+
     c                                     'value="Bearer '+%trim(w_auth)+
     c                                     '"></header></httpHeader>'
     C                   Eval      W_body ='{'+
     c                                      '"id":104,+
     c                                      "name":"aakash", +
     c                                      "email":"Aakash.sarathe@pio",+
     c                                      "gender":"Male",+
     c                                      "status":"Active"'+
     c                                     '}'
     C/Exec Sql
     C+ Select coalesce(varChar(responseMsg,20000),' '),
     C+ varChar(responseHttpHeader,10000) INTO :w_msg,:W_head
     C+ from Table(Systools.HttppostClobVerbose(Trim(:w_URL),Trim(:W_HDr),
     c+ trim(:W_body)))
     C/End-Exec
     C                   If        Sqlcode = 0
     c                   eval      empnam  = W_msg
     C                   write     emprec
     c     W_msg         dsply
     C                   Endif
     C                   Eval      *inlr =*on
     c
