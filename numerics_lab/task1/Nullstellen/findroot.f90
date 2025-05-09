MODULE param
!beinhaltet den Genauigkeitsparameter
DOUBLE PRECISION, PARAMETER :: eps=1.D0-4
END MODULE

MODULE functions
!beinhaltet Testfunktionen und deren Ableitungen
CONTAINS
FUNCTION f1(x)
	DOUBLE PRECISION :: f1,x
	f1=x**3-5.D0*x**2+100.D0*x-400.D0
END FUNCTION f1
FUNCTION f2(x)
	DOUBLE PRECISION :: f2,x
	f2=EXP(-x)-0.1D0/(1.D0+x)
END FUNCTION f2
FUNCTION df1(x)
	DOUBLE PRECISION :: df1,x
	df1=3*x**2-10.D0*x+100.D0
END FUNCTION df1
FUNCTION df2(x)
	DOUBLE PRECISION :: df2,x
	df2=-EXP(-x)-0.1D0*LOG(1.D0+x)
END FUNCTION df2
!Funktionen f�r das Fixpunktverfahren
FUNCTION gf1(x)
	DOUBLE PRECISION :: gf1,x
    gf1=4.D0+0.05D0*x**2-0.01D0*x**3
END FUNCTION
FUNCTION gf2(x)
	DOUBLE PRECISION gf2,x
    gf2=0.1D0*EXP(x)-1.D0
END FUNCTION
END MODULE

MODULE methods !beinhaltet die verschiedenen Methoden zur Nullstellensuche
USE param

CONTAINS
SUBROUTINE bisec(x,f,steps,ausgabe) !implementiert Bisektionsverfahren
!Dummy-Funktionen und Argumente	
INTERFACE
    	FUNCTION f(x); DOUBLE PRECISION :: f,x; END FUNCTION
    END INTERFACE
DOUBLE PRECISION :: a, b, x
INTEGER :: steps
!definiert ein im Hauptprogramm spezifiziertes Ausgabefile
CHARACTER :: ausgabe

OPEN (100,FILE=ausgabe, STATUS='UNKNOWN')
steps=0

!manuelle Eingabe der Intervallgrenzen
WRITE(*,*) "Bitte Intervallgrenzen eingeben:"
WRITE(*,*) "a= "
READ(*,*) a
WRITE(*,*) "b= "
READ(*,*) b

WRITE(100,*) "Ausgangswerte - a= ", a, ", b= ", b

DO 
  x=(a+b)/2.D0
  WRITE(100, *) steps, x, f(x)
    !�berpr�ft auf welcher Seite die Nullstelle liegt
  	IF (SGN(f(a))==SGN(f(x))) THEN
    	a=x
  	ELSE
   		b=x
  	END IF
    steps=steps+1
    IF (ABS(f(x)).LT.eps) EXIT
END DO
CLOSE(100)
END SUBROUTINE bisec

!********************************************************************

SUBROUTINE newton(xstart,steps,f,df,ausgabe)  !implementiert den Newton-Algorithmus zur Nullstellensuche
  !Genauigkeitsparameter
  USE param
  DOUBLE PRECISION :: newton_zero,xstart
  INTEGER :: steps
  LOGICAL :: terminate
  CHARACTER :: ausgabe     
  ! Dummy-Funktionen und -Argumente
  INTERFACE
     FUNCTION f(t)
         DOUBLE PRECISION :: f,t
     ENDFUNCTION
     FUNCTION df(y)
         DOUBLE PRECISION :: df, y
     ENDFUNCTION
  END INTERFACE
         
  steps=0        
  ! Abbruchbedingung: TRUE, wenn der Funktionswert des errechneten x-Werts unter der vorgegebenen Genauigkeit liegt
  terminate=ABS(f(xstart)).LT.eps
  
  OPEN (100,FILE=ausgabe, STATUS='UNKNOWN')
  WRITE(100,*) "Startwert= ", xstart
  DO
  ! Newton-Algorithmus
  newton_zero=xstart-f(xstart)/df(xstart)
  WRITE(100, *) steps, xstart, f(xstart)
  ! speichert den errechneten Wert als neuen Ausgangswert
  xstart=newton_zero
  ! Test zum Verfolgen der Berechnung:
  ! WRITE(*,*) xstart, (ABS(f(xstart))-eps), nr_steps
  steps=steps+1
  IF (terminate) EXIT
  ENDDO
  CLOSE(100)
END SUBROUTINE newton

!**********************************************************************

!SUBROUTINE regf(xstart, f)
!	INTERFACE
!END SUBROUTINE regf


!**********************************************************************

SUBROUTINE fix(x,xstart,f,steps,ausgabe) !implementiert Fixpunkt-Verfahren
	INTERFACE 
    	FUNCTION f(x); DOUBLE PRECISION f,x; END FUNCTION
    END INTERFACE
DOUBLE PRECISION :: xstart,x
INTEGER :: steps
Character :: ausgabe
steps=0

WRITE(*,*)"Bitte Startwert eingeben"
READ(*,*) xstart

 OPEN (100,FILE=ausgabe, STATUS='UNKNOWN')
 WRITE(100,*) "Startwert= ", xstart

DO WHILE (ABS(f(xstart)).GT.eps)
  x=f(xstart)
  WRITE(100, *) steps, xstart, x
  xstart=x
  steps=steps+1
END DO
CLOSE(100)
END SUBROUTINE fix
!**********************************************************************
END MODULE


PROGRAM findroot
USE functions
USE methods
IMPLICIT NONE


DOUBLE PRECISION :: x1b, x2b
INTEGER :: n1b, n2b
!Nullstellensuche bei Funktion f1 mit Bisektionsverfahren
CALL bisec(x1b,f1,n1b,'bisec_f1.dat')
WRITE(*,*) x1b, n1b

!Nullstellensuche bei Funktion f2 mit Bisektionsverfahren
CALL bisec(x2b, f2, n2b, 'bisec_f2.dat')
WRITE(*,*) x2b, n2b

!Nullstellensuche bei Funktion f1 mit newtonverfahren
!CALL newton(
 
END PROGRAM
!*******************************************************************


   
