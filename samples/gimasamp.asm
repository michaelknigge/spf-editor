BALAPI   CSECT
         STM    14,12,12(13)
         LR     12,15
@PSTART  EQU    BALAPI
         USING  @PSTART,12
         ST     13,SAVE+4
         LA     14,SAVE
         ST     14,8(13)
         LR     13,14
*
* END OF STANDARD LINKAGE
*
BALAPI   AMODE 31
*
* SET UP PARAMETERS FOR QUERY
*
         XC    QUERY_PARMS,QUERY_PARMS
         LA    3,MYCSI
         ST    3,PCSI
         LA    3,19
         ST    3,CSILEN
         LA    3,MYZONE
         ST    3,PZONE
         LA    3,3
         ST    3,ZONELEN
         LA    3,MYENTRY
         ST    3,PENTRY
         LA    3,6
         ST    3,ENTRYLEN
         LA    3,MYSUBNTY
         ST    3,PSUBENTRY
         LA    3,1
         ST    3,SUBENTRYLEN
         LA    3,MYFILTER
         ST    3,PFILTER
         LA    3,16
         ST    3,FILTERLEN
*
* NOW LOAD THE API
*
         LA    2,APIPGM
         LOAD EPLOC=(2),LOADPT=PGMADR
*
* NOW DO THE QUERY
*
         L     15,PGMADR
         CALL (15),(QUERYCMD,QUERY_PARMS@,CMDOUT,APILANG,RC,CC,MSG@)
*
*
* NOW SEE WHAT WAS RETURNED
*
         L     3,RC
         LTR   3,3
         BNZ   ERRPRINT
*
* ESTABLISH ADDRESSABILITY
*
         OPEN (SYSPRINT,OUTPUT)
         L     3,CMDOUT
         USING ENTRY_LIST,3
         L      4,ENTRIES
         USING CSIENTRY,4
         L      5,SUBENTRIES
         USING SUBENTRY,5
         L      6,SUBENTDATA
         USING ITEM_LIST,6
         L      7,DATA
         USING RETDATA,7
*
* PRINT ENTRIES
*
PRTENT   LTR    4,4
         BZ     CLOSEOUT
         MVI    BUFFER,C' '
         MVC    BUFFER+1(119),BUFFER
         MVC    BUFFER(8),ENTRYNAME
         MVC    BUFFER+10(7),ZONENAME
         LA     2,ANSICHAR
         PUT    SYSPRINT,(2)
         B      PRTSUB
MOREENT  L      4,CSINEXT
         B      PRTENT
*
* PRINT SUBENTRIES
*
PRTSUB   LTR    5,5
         BZ     MOREENT
         MVI    BUFFER,C' '
         MVC    BUFFER+1(119),BUFFER
         MVC    BUFFER(11),SUBTYPE
         PUT    SYSPRINT,(2)
         B      PRTDATA
MORESUB  L      5,SUBNEXT
         B      PRTSUB
*
* PRINT DATA
*
PRTDATA  LTR    7,7
         BZ     MORESUB
         L      8,DATALEN
CHECKLEN C      8,OUTRECLN
         BNH    SETLEN
         L      8,OUTRECLN
SETLEN   LA    15,1
         SLR    8,15
         MVI   BUFFER,C' '
         MVC   BUFFER+1(119),BUFFER
         EX     8,@MOVDATA
         LA   2,ANSICHAR
         PUT  SYSPRINT,(2)
         L      8,DATALEN
         C      8,OUTRECLN
         BNH    MORESUB
         S      8,OUTRECLN
         ST     8,DATALEN
         A      7,OUTRECLN
         B      CHECKLEN
*
* PRINT ERROR MESSAGES
*
ERRPRINT OPEN   (SYSPRINT,OUTPUT)
         L      6,MSG@
         L      7,DATA
         L      8,DATALEN
CHKMSGLN C      8,OUTRECLN
         BNH    SETMSGLN
         L      8,OUTRECLN
SETMSGLN LA     15,1
         SLR    8,15
         MVI    BUFFER,C' '
         MVC    BUFFER+1(119),BUFFER
         EX     8,@MOVDATA
         LA     2,ANSICHAR
         PUT    SYSPRINT,(2)
         L      8,DATALEN
         C      8,OUTRECLN
         BNH    CLOSEOUT
         S      8,OUTRECLN
         ST     8,DATALEN
         A      4,OUTRECLN
         B      CHKMSGLN
*
CLOSEOUT CLOSE  SYSPRINT
*
* NOW FREE THE STORAGE OBTAINED DURING THE QUERY
*
CLEANUP  L     15,PGMADR
         CALL (15),(FREECMD,0,CMDOUT,APILANG,RC,CC,MSG@)
*
* NOW DELETE GIMAPI
*
         DELETE EPLOC=APIPGM
*
* EXIT
*
EXIT     LA     15,0
         L      13,4(,13)
         L      14,12(,13)
         LM     00,12,20(13)
         BR     14
*
*
@MOVDATA MVC    BUFFER(0),RETDATA
SYSPRINT DCB   DDNAME=SYSPRINT,DSORG=PS,MACRF=PM,LRECL=121,RECFM=FBA
ANSICHAR DC     CL1' '
BUFFER   DS     CL120
MYCSI    DC     CL19'TOPGUN.WAG.VSAM.CSI'
MYZONE   DC     CL3'TZ1'
MYENTRY  DC     CL6'SYSMOD'
MYFILTER DC     CL16'SMODTYPE=''PTF'''
MYSUBNTY DC     CL3'*'
APIPGM   DC     CL8'GIMAPI  '
QUERYCMD DC     CL8'QUERY   '
FREECMD  DC     CL8'FREE    '
APILANG  DC     CL3'ENU'
         DS     0F
QUERY_PARMS@ DC AL4(QUERY_PARMS)
PGMADR   DC     AL4(0)
CMDOUT   DC     AL4(0)
MSG@     DC     AL4(0)
OUTRECLN DC     F'120'
RC       DS     F'0'
CC       DS     F'0'
SAVE     DC     18F'0'
         GIMMASM
RETDATA  DSECT  CL0
         END
