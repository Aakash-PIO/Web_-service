     Femp_mast2 IF A E             Disk
     D W_Msg           s            100A   Varying
     D W_Head          s            100A   Varying
     D W_URL           s            100A   Varying
     D W_Hdr           s            200A   Varying
     D W_body          s            100A   Varying
     D W_pos           s             10A   Varying
     D W_empid         s              5s 0 inz
      **
      **
     c/Exec Sql
     c+ Set Option Commit = *none
     c/End-Exec
            Exec sql call qsys2.qcmdexc('Chgjob ccsid(37)');
     c     'Enter UserID'Dsply
     c                   Eval      w_url='https://gorest.co.in/public/v1/users/+
     c                               104'
     c                   Eval      w_hdr ='<httpHeader>'+
     c                             '<header name = "Content-Type" Value =+
     c                              "Application/json">'+
     c                               '</header>' +
     c                               '</httpHeader>'
     c                   Monitor
     C/Exec Sql
     C+ Select coalesce(varChar(responseMsg,20000),' '),
     C+ varChar(responseHttpHeader,10000) INTO :w_msg,:W_head
     C+ from Table(Systools.HttpGetClobVerbose(Trim(:w_URL),Trim(:W_HDr)))
     C/End-Exec
     c                   eval      empnam = W_msg
     C                   write     emprec
     C     'Get Success' Dsply
     C                   ON-ERROR
     C     'Sql Error'   Dsply
     C                   Endmon
     C                   Eval      *inlr =*on
     c
