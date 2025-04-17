      PROGRAM Diffreal
      IMPLICIT NONE
      REAL x,h,f,dfex,dfnum,r
C Initialisierung von Variablen
      x=5.0
      f=SIN(x)
      dfex=COS(x)
      h=0.5*(10.0**(-6.0))
C     ”ffnet Datei zum Speichern der Ergebnisse
      OPEN(20,FILE='diffreal.dat',STATUS='UNKNOWN')
C     Schleife zur Berechnung der Werte
101   IF (h.lt.1.0) THEN
      h=h*2.0
      dfnum=(SIN(x+h)-f)/h
      r=ABS(dfex-dfnum)/ABS(dfex)
C     Ausgabe in Datei
      WRITE(20,201) h,r
201   FORMAT(2X,F10.6,3X,'|',2X,1P,E10.4)
      GOTO 101
      ENDIF
      
      CLOSE(20)
      END