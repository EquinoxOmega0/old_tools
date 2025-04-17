      PROGRAM Diffdouble3
      IMPLICIT NONE
      DOUBLE PRECISION x,h,dfex,dfnum,r
C     Initialisierung der Variablen
      x=5.D0
      dfex=COS(x)
      h=1.D-15
C     ™ffnet Ausgabedatei
      OPEN(20,FILE='diffdouble3.dat',STATUS='UNKNOWN')
C     Berechnet Werte in Schleife
101   IF (h.le.1.D0) THEN
      h=h*10.D0
      dfnum=(SIN(x+h)-SIN(x-h))/(2.D0*h)
      r=ABS(dfex-dfnum)/ABS(dfex)
C     Ausgabe in Datei
      WRITE(20,201) h,r
201   FORMAT(2X,1P,E8.2,3X,'|',2X,E10.4)
      GOTO 101
      ENDIF
      
      CLOSE(20)
      END