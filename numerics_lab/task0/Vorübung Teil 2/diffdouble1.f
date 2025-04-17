      PROGRAM Diffdouble1
      IMPLICIT NONE
      DOUBLE PRECISION x,h,f,dfex,dfnum,r
C     Initialisierung der Variablen
      x=5.D0
      f=SIN(x)
      dfex=COS(x)
      h=0.5D-6
C     ôffnet Datei fÅr Ausgabe
      OPEN(20,FILE='diffdouble1.dat',STATUS='UNKNOWN')
C     Berechnung der Werte in Schleife
101   IF (h.lt.1.D0) THEN
      h=h*2.D0
      dfnum=(SIN(x+h)-f)/h
      r=ABS(dfex-dfnum)/ABS(dfex)
C     Ausgabe in Datei
      WRITE(20,201) h,r
201   FORMAT(2X,F10.6,3X,'|',2X,1P,E10.4)
      GOTO 101
      ENDIF
      
      CLOSE(20)
      END