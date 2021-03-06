h12179
s 00001/00001/00141
d D 3.2 93/11/23 13:53:29 patbrown 5 4
c Changed FDATE to LBLDAT.  (patbrown)
e
s 00010/00000/00132
d D 3.1 93/08/17 19:23:04 patbrown 4 3
c Added feature which writes SCCS version numbers of modules used in a calculation to the end of TAPE6.  (patbrown)
e
s 00009/00011/00123
d D 1.2 92/10/23 15:10:50 clough 3 1
c Changed subroutines BUFIN and BUFOUT to decrease I/O time. (patbrown)
e
s 00008/00010/00124
d R 1.2 92/10/23 14:03:25 clough 2 1
c Changed subroutines "BUFIN" and "BUFOUT" to decrease I/O time. (patbrown)
e
s 00134/00000/00000
d D 1.1 92/09/01 09:16:33 patbrown 1 0
c date and time created 92/09/01 09:16:33 by patbrown
e
u
U
f e 0
t
T
I 1
C     path:      %P%
C     revision:  %I%
C     created:   %G%  %U%
C     presently: %H%  %T%
D 3
      SUBROUTINE BUFIN (IFILE,IEOF,ILO,IWORDS,IARRAY)                     A10770
E 3
I 3
      SUBROUTINE BUFIN (IFILE,IEOF,IARRAY,IWORDS)                         A10770
E 3
C                                                                         A10780
C     THIS SUBROUTINE BUFFERS IN (READS) IWORDS INTO  IARRAY STARTING     A10790
D 3
C     AT LOCATION ILO                                                     A10800
E 3
I 3
C     AT LOCATION IARRAY                                                  A10800
E 3
C                                                                         A10810
C     IFILE IS THE FILE DESIGNATION                                       A10820
C                                                                         A10830
I 4
      COMMON /HVERSN/  HVRLBL,HVRCNT,HVRFFT,HVRATM,HVRLOW,HVRNCG,
     *                HVROPR,HVRPST,HVRPLT,HVRTST,HVRUTL,HVRXMR
C
      CHARACTER*8 HVRLBL,HVRCNT,HVRFFT,HVRATM,HVRLOW,HVRNCG,HVROPR,
     *            HVRPLT,HVRPST,HVRTST,HVRUTL,HVRXMR
C
E 4
D 3
      DIMENSION IARRAY(*)                                                 A10840
E 3
I 3
      DIMENSION IARRAY(IWORDS)                                            A10840
I 4
C
C     ASSIGN SCCS VERSION NUMBER TO MODULE 
C
      HVRUTL = '%I%' 
E 4
E 3
C                                                                         A10850
      IEOF = 1                                                            A10860
D 3
      IHI = ILO+IWORDS-1                                                  A10870
E 3
C                                                                         A10880
C#    BUFFER IN (IFILE,1) (IARRAY(ILO),IARRAY(IHI))                       A10890
C#    IF (UNIT(IFILE).EQ.0.) GO TO 10                                     A10900
C                                                                         A10910
D 3
      READ (IFILE,END=10) (IARRAY(I),I=ILO,IHI)                           A10920
      ITEST = MIN(IWORDS,ILO+3)                                           A10930
E 3
I 3
      READ (IFILE,END=10) IARRAY                                          A10920
      ITEST = MIN(IWORDS,4)                                               A10930
E 3
      IF (IARRAY(ITEST).EQ.-99) IEOF = -99                                A10940
C                                                                         A10950
      RETURN                                                              A10960
C                                                                         A10970
   10 IEOF = 0                                                            A10980
C                                                                         A10990
      RETURN                                                              A11000
C                                                                         A11010
      END                                                                 A11020
D 3
      SUBROUTINE BUFOUT (IFILE,ILO,IWORDS,IARRAY)                         A11030
E 3
I 3
      SUBROUTINE BUFOUT (IFILE,IARRAY,IWORDS)                             A11030
E 3
C                                                                         A11040
C     THIS SUBROUTINE BUFFERS OUT (WRITES) IWORDS FROM IARRAY STARTING    A11050
D 3
C     AT LOCATION ILO                                                     A11060
E 3
I 3
C     AT LOCATION IARRAY                                                  A11060
E 3
C                                                                         A11070
C     IFILE IS THE FILE DESIGNATION                                       A11080
C                                                                         A11090
D 3
      DIMENSION IARRAY(*)                                                 A11100
      IHI = ILO+IWORDS-1                                                  A11110
E 3
I 3
      DIMENSION IARRAY(IWORDS)                                            A11100
E 3
C                                                                         A11120
C#    BUFFER OUT (IFILE,1) (IARRAY(ILO),IARRAY(IHI))                      A11130
C#    IF (UNIT(IFILE).EQ.0.) STOP ' ERROR IN BUFOUT '                     A11140
C                                                                         A11150
D 3
      WRITE (IFILE) (IARRAY(I),I=ILO,IHI)                                 A11160
E 3
I 3
      WRITE (IFILE) IARRAY                                                A11160
E 3
C                                                                         A11170
      RETURN                                                              A11180
C                                                                         A11190
      END                                                                 A11200
D 5
      SUBROUTINE FDATE (HDATE)                                            A07730
E 5
I 5
      SUBROUTINE LBLDAT(HDATE)                                            A07730
E 5
C                                                                         A07740
C&    DOUBLE PRECISION HDATE                                            & A07750
C                                                                         A07760
      CHARACTER GDATE*10                                                  A07770
C                                                                         A07780
C>UNX INTEGER*4 IARRAY(3)                                               > A07790
C                                                                         A07800
      CALL DATE (GDATE)                                                 > A07810
C>UNX CALL IDATE(IARRAY)                                                > A07820
C>UNX IARRAY(3)=MOD(IARRAY(3),100)                                      > A07830
C>UNX WRITE (GDATE,900) IARRAY(3),IARRAY(2),IARRAY(1)                   > A07840
C                                                                         A07850
      READ (GDATE,901) HDATE                                              A07860
C                                                                         A07870
C     GDATE AND FORMAT ARE FOR CYBER AND CRAY                             A07880
C                                                                         A07890
C       -- CYBER REQUIRES FORMAT (1X,A8)                                  A07900
C       -- CRAY  REQUIRES FORMAT (A8)                                     A07910
C                                                                         A07920
C     CHANGE THESE TO WORD SIZE AND FORMAT OF ROUTINE DATE                A07930
C                                                                         A07940
      RETURN                                                              A07950
C                                                                         A07960
  900 FORMAT (1X,I2,2('/',I2.2))                                          A07970
C>901 FORMAT (1X,A8)                                                    > A07980
  901 FORMAT (A8)                                                       > A07990
C                                                                         A08000
      END                                                                 A08010
      SUBROUTINE FTIME (HTIME)                                            A08020
C                                                                         A08030
C&    DOUBLE PRECISION HTIME                                            & A08040
C                                                                         A08050
      CHARACTER GTIME*10                                                  A08060
C                                                                         A08070
C>UNX INTEGER*4 IARRAY(3)                                               > A08080
C                                                                         A08090
      CALL CLOCK (GTIME)                                                > A08100
C>VAX CALL TIME (GTIME)                                                 > A08110
C>UNX CALL ITIME (IARRAY)                                               > A08120
C>UNX WRITE (GTIME,900) IARRAY                                          > A08130
C                                                                         A08140
      READ (GTIME,901) HTIME                                              A08150
C                                                                         A08160
C     GTIME AND FORMAT ARE FOR CYBER AND CRAY                             A08170
C                                                                         A08180
C       -- CYBER REQUIRES FORMAT (1X,A8)                                  A08190
C       -- CRAY  REQUIRES FORMAT (A8)                                     A08200
C                                                                         A08210
C     CHANGE THESE TO WORD SIZE AND FORMAT OF ROUTINE GTIME               A08220
C                                                                         A08230
      RETURN                                                              A08240
C                                                                         A08250
  900 FORMAT (1X,I2,2(':',I2.2))                                          A08260
C>901 FORMAT (1X,A8)                                                    > A08270
  901 FORMAT (A8)                                                       > A08280
C                                                                         A08290
      END                                                                 A08300
      SUBROUTINE CPUTIM (TIME)                                            A08310
C                                                                         A08320
      COMMON /TIMIN/ A1                                                   A08330
C                                                                         A08340
C>UNX REAL*4 ETIME,TARRAY(2)                                            > A08350
C                                                                         A08360
C     THIS SUBROUTINE OBTAINS CPU TIME                                    A08370
C                                                                         A08380
      IF (A1.LE.0.) THEN                                                  A08390
         CALL SECOND (TIME)                                             > A08400
C>VAX    A1 = SECNDS(0.0)                                               > A08410
C>UNX    TIME = ETIME(TARRAY)                                           > A08420
      ELSE                                                                A08430
         CALL SECOND (TIME)                                             > A08440
C>VAX    TIME = SECNDS(A1)                                              > A08450
C>UNX    TIME = ETIME(TARRAY)                                           > A08460
      ENDIF                                                               A08470
C                                                                         A08480
      RETURN                                                              A08490
C                                                                         A08500
      END                                                                 A08510
      BLOCK DATA BTIM                                                     A08520
C                                                                         A08530
      COMMON /TIMIN/ A1                                                   A08540
C                                                                         A08550
      DATA A1 / 0. /                                                      A08560
C                                                                         A08570
      END                                                                 A08580
E 1
