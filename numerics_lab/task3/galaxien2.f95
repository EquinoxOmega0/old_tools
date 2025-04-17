!Modul Para(meter) für "globale" Variablen
MODULE Para
  IMPLICIT NONE
  !Rmin=Minimalabstand zwischen beiden Galaxien; M1=Masse der ersten Galaxie; M2=Masse der zweiten Galaxie;
  !k=Produkt der beiden Galaxienmassen; Mred=reduzierte Masse des 2. Körperproblems;
  !l=Drehimpuls Wurzel(2*Rmin*(M1+M2)*Mred^2) ; zeit=aktuelle Zeit der Berechnung;
  DOUBLE PRECISION :: Rmin,M1,M2,k,Mred,l,zeit
END MODULE

!Modul für Funktionen zur Bestimmung der Galaxienpostion und der Wechselwirkung
MODULE GalPos   
CONTAINS 

! Funktion für die mit Nullstellensuche gelöst werden soll
SUBROUTINE func5(x,fval,fderiv)
 USE nrtype
 USE Para
 IMPLICIT NONE
 !x=Variable nach der gelöst werden soll
 REAL(SP), INTENT(IN) :: x
 !fval=Funktion deren Nullstelle gefundenwerden soll, in Form f=0 ; fderiv=Ableitung der Funktion
 REAL(SP), INTENT(OUT) :: fval, fderiv
 !vorfak=Variable für Vorfaktor
 DOUBLE PRECISION :: vorfak
 
 ! Berechne Vorfaktor
  vorfak = (l**3)/(2.D0*Mred*k**2)	
 ! Berechne Wert der Funktion (abhängig von x)
  fval   = vorfak*(DTAN(x/2.D0)+((DTAN(x/2.D0))**3)/3.D0)-zeit
 ! Berechne Wert der Ableitung (abhängig von x)
  fderiv = vorfak/(2.D0*((DCOS(x/2.D0))**4))

END SUBROUTINE func5




! Funktion zur Positionsberechnung der beiden Galaxien
SUBROUTINE Posi(theta,R1x0,R1y0,R2x0,R2y0)
 USE Para
 IMPLICIT NONE
 ! theta=Winkel vom Koordinatenzentrum aus gesehen ; R1x0,R1y0,R2x0,R2y0=Koordinaten der Galaxien;
 ! radius=Abstand vom Koordinatenzentrum; qcos,qsin=Hilfsvariablen für Berechnung
 DOUBLE PRECISION :: theta,R1x0,R1y0,R2x0,R2y0,radius,qcos,qsin
  !Berechne Winkelfunktionen theta
  qcos=DCOS(theta)
  qsin=DSIN(theta)
  !Berechne den Abstand vom Nullpunkt
  radius=2.D0*Rmin/(1.D0+qcos)
  !Ermittle die Koordinaten der Galaxien
  R1x0=-M2/(M1+M2)*radius*qcos
  R1y0=-M2/(M1+M2)*radius*qsin
  R2x0=M1/(M1+M2)*radius*qcos 
  R2y0=M1/(M1+M2)*radius*qsin 
   
END SUBROUTINE


END MODULE



PROGRAM galaxien
 USE nrtype
 USE nrutil
 USE Para
 USE GalPos
 USE nrlib
 IMPLICIT NONE
 DOUBLE PRECISION :: genau,thetamin,thetamax,zeit0,zeitout
 DOUBLE PRECISION :: R1x,R1y,R2x,R2y,Rstart,theta,t1,t2



WRITE(*,*) 'Galaxienwechselwirkung'
WRITE(*,*)
WRITE(*,*) 'Bitte geben Sie die Masse(in 100Mrd Sonnenmassen) der 1. Galaxie ein:'
READ(*,*) M1
WRITE(*,*) 'Bitte geben Sie die Masse(in 100Mrd Sonnenmassen) der 2. Galaxie ein:'
READ(*,*) M2
WRITE(*,*) 'Bitte geben Sie den Startabstand(in kpc) zwischen den Galaxien ein:'
READ(*,*) Rstart
WRITE(*,*) 'Bitte geben Sie den Mindestabstand(in kpc) zwischen den Galaxien ein:'
READ(*,*) Rmin
WRITE(*,*)
CALL CPU_TIME(t1)
OPEN (200,FILE='2galpos1.dat', STATUS='UNKNOWN')
OPEN (201,FILE='2galpos2.dat', STATUS='UNKNOWN')
OPEN (210,FILE='2galinput.dat', STATUS='UNKNOWN')

WRITE(210,*) 'M1= ',M1
WRITE(210,*) 'M2= ',M2
WRITE(210,*) 'RStart= ',RStart
WRITE(210,*) 'Rmin= ',Rmin

thetamin=-PI_D
thetamax=PI_D
genau=1.D-8
theta=DACOS(2.D0*Rmin/Rstart-1.D0)
Mred=M1*M2/(M1+M2)
k=M1*M2
l=DSQRT(2.D0*Rmin*(M1+M2))*Mred
zeit0=(l**3)/(2.D0*Mred*k**2)*(DTAN(theta/2.D0)+((DTAN(theta/2.D0))**3)/3.D0)
zeit=-zeit0
101 CONTINUE

theta = rtsafe(func5, thetamin, thetamax, genau)

CALL Posi(theta,R1x,R1y,R2x,R2y)

zeitout=zeit*1.49
WRITE (*,*) zeitout
WRITE (200,*) zeitout,R1x,R1y
WRITE (201,*) zeitout,R2x,R2y

zeit=zeit+1.D-1

IF (zeit.LT.zeit0) THEN
GOTO 101
ENDIF

CLOSE(200)
CLOSE(201)
CALL CPU_TIME(t2)
t2=t2-t1
WRITE(*,*) t2
WRITE(210,*) 'CPU-Zeit: ',t2
CLOSE(210)
  
END PROGRAM galaxien

