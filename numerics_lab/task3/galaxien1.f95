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
!wenn tan(theta/2) gesucht wird
SUBROUTINE func52(x,fval,fderiv)  
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
  fval   = vorfak*((x+x**3)/3.D0)-zeit
 ! Berechne Wert der Ableitung (abhängig von x)
  fderiv = vorfak*(1.D0+x**2)

END SUBROUTINE func52


! Funktion für die mit Nullstellensuche gelöst werden soll
!wenn theta direkt gesucht wird
SUBROUTINE func51(x,fval,fderiv)
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

END SUBROUTINE func51




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




!Hauptprogramm
PROGRAM galaxien
 USE nrtype
 USE nrutil
 USE Para
 USE GalPos
 USE nrlib
 IMPLICIT NONE
 !genau=Genauigkeit des Gleichungslösverfahren; thetamin=kleinster erlaubter Wert für Lösung;
 !thetamax= größter erlaubter Wert für Lösung; zeit0=Start/Endzeitpkt der Berechnung;
 !zeitout=Ausgabezeit in Mill Jahren
 DOUBLE PRECISION :: genau,thetamin,thetamax,zeit0,zeitout
 ! R1x,R1y,R2x,R2y=Koordinaten der beiden Galaxien; Rstart=Abstand zwischen den Galaxien am Anfang der Berechnung;
 !theta=Winkel zu den Galaxien vom Zentrum aus; t1,t2=zur Messung der Computerzeit(Rechenzeit)
 DOUBLE PRECISION :: R1x,R1y,R2x,R2y,Rstart,theta,t1,t2
 ! loesart= gibt an ob nach theta direkt oder nach tan(theta/2) gelöst werden soll
 INTEGER :: loesart
! Funktion welche gelöst werden soll, müssen für Prozedur als Extern definiert sein
 EXTERNAL func51
 EXTERNAL func52

!Einlesen der Parameter für die Berechnung
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
  WRITE(*,*) 'Soll nach theta dirket gelöst werden (1) oder nach tan(theta/2) (2)?:'
  READ(*,*) loesart
  WRITE(*,*)

  !Messung der Computerzeit
   CALL CPU_TIME(t1)
  
!Öffne und erstelle alle benötigten Dateien
  OPEN (200,FILE='1galpos1.dat', STATUS='UNKNOWN')
  OPEN (201,FILE='1galpos2.dat', STATUS='UNKNOWN')
  OPEN (210,FILE='1galinput.dat', STATUS='UNKNOWN')

!Schreibe Parameter der Berechnung in Datei
  WRITE(210,*) 'M1= ',M1
  WRITE(210,*) 'M2= ',M2
  WRITE(210,*) 'RStart= ',RStart
  WRITE(210,*) 'Rmin= ',Rmin

!Setze Grenzen für die Lösung der Bewegungsgleichung der Galaxien
   IF (loesart.EQ.1) THEN
    thetamin=-PI_D
    thetamax=PI_D
   ELSE
    thetamin=-1.D03
    thetamax=1.D3
   ENDIF
   
!Berechne die Systemzeit zum Beginn der Bahnberechnung
  genau=1.D-8
  theta=DACOS(2.D0*Rmin/Rstart-1.D0)
  Mred=M1*M2/(M1+M2)
  k=M1*M2
  l=DSQRT(2.D0*Rmin*(M1+M2))*Mred
  zeit0=(l**3)/(2.D0*Mred*k**2)*(DTAN(theta/2.D0)+((DTAN(theta/2.D0))**3)/3.D0)
  zeit=-zeit0

! Beginn der Hauptschleife des Programm 
 !endet wenn Galaxien eine symetrische Parable zurückgelegt haben
   101 CONTINUE
!Überprüft, welche lösart gewählt ist
     IF (loesart.EQ.1) THEN
     !Berechnet den Winkel theta, direkt
      theta = rtsafe(func51, thetamin, thetamax, genau)
     ELSE
    ! Berechnet den winkel theta, jedoch nicht direkt sondern indem indem die kubische Gleichung
   ! nach tan(theta/2) gelöst wird
	  theta = rtsafe(func52, thetamin, thetamax, genau)
	  theta=2.D0*DATAN(theta)
     ENDIF
    
  !Berechne die Positionen der Galaxien
	 CALL Posi(theta,R1x,R1y,R2x,R2y)

 !ermittle die Ausgabezeit in Mill Jahren
	zeitout=zeit*1.49

!Gebe Koordinaten und Zeit aus
	WRITE (*,*) zeitout
	WRITE (200,*) zeitout,R1x,R1y
	WRITE (201,*) zeitout,R2x,R2y

!Erhöhe die Zeit für den nächsten Rechenschritt
	zeit=zeit+1.D-1

!So lange die Abbruchbedingung nicht erfüllt ist setzte die Schleife fort
	 IF (zeit.LT.zeit0) THEN
   GOTO 101
	 ENDIF


!Ermittle die benötige Rechenzeit des Programms
   CALL CPU_TIME(t2)
  t2=t2-t1
  WRITE(*,*) t2
  WRITE(210,*) 'CPU-Zeit: ',t2

!Schließe alle Dateien
  CLOSE(210)
  CLOSE(200)
  CLOSE(201)
  
!Programm Ende
END PROGRAM galaxien