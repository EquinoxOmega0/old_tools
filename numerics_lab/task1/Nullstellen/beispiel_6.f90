MODULE newton !implementiert den Newton-Algorithmus zur Nullstellensuche
  CONTAINS
  
	SUBROUTINE find_zero(xstart,nr_steps,f,fdot)
      !Genauigkeitsparameter
	  REAL, PARAMETER :: delta=0.000001
      REAL :: newton_zero,xstart
      INTEGER :: nr_steps
      LOGICAL :: terminate
      
      ! Dummy-Funktionen und -Argumente
    	INTERFACE
        	FUNCTION f(t)
        		REAL :: f,t
        	ENDFUNCTION
        	FUNCTION fdot(y)
        		REAL :: fdot, y
        	ENDFUNCTION
        END INTERFACE
        
      nr_steps=0
      
		DO
        ! Newton-Algorithmus
     	newton_zero=xstart-f(xstart)/fdot(xstart)
        ! speichert den errechneten Wert als neuen Ausgangswert
      	xstart=newton_zero
        ! Abbruchbedingung: TRUE, wenn der Funktionswert des errechneten x-Werts unter der vorgegebenen Genauigkeit liegt
      	terminate=abs(f(xstart)).LT.delta
			! Test zum Verfolgen der Berechnung:
			! WRITE(*,*) xstart, (abs(f(xstart))-delta), nr_steps
  		nr_steps=nr_steps+1
      		IF (terminate) EXIT
        ENDDO

     END SUBROUTINE find_zero
END MODULE newton

MODULE functions  !beinhaltet die Test-Funktion und deren Ableitung
  CONTAINS
   FUNCTION f1(x) !f1(x)=e^x-x^2
      REAL ::  f1,x
      f1=exp(x)-x**2
    END FUNCTION f1
  FUNCTION f1dot(x) !f1'(x)=e^x-2x
  	REAL :: f1dot, x
    f1dot=exp(x)-2*x
  END FUNCTION f1dot
END MODULE functions

 PROGRAM calculate_zero
 	USE functions
    USE newton
	REAL :: start
    INTEGER :: steps
    
   
 WRITE(*,*) "Please type in the starting value for calculation!"
 READ(*,*) start

 CALL find_zero(start,steps,f1,f1dot)

!Ausgabe der gefundenen Nullstelle, mit der Anzahl von Schritten die bis zur angegebenen Genauigkeit benoetigt wurden
 WRITE(*,*)"zero, number of steps"
 WRITE(*,*) start, steps
 
 
 END PROGRAM calculate_zero