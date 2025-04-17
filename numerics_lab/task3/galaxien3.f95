!Modul Para(meter) für "globale" Variablen
MODULE Para
  IMPLICIT NONE
  !Rmin=Minimalabstand zwischen beiden Galaxien; M1=Masse der ersten Galaxie; M2=Masse der zweiten Galaxie;
  !k=Produkt der beiden Galaxienmassen; Mred=reduzierte Masse des 2. Körperproblems;
  !l=Drehimpuls Wurzel(2*Rmin*(M1+M2)*Mred^2) ; zeit=aktuelle Zeit der Berechnung;
  !R1x,R1y,R2y,R2y= Koordinaten der beiden Galaxienzentren; genau=Genauigkeit der Nullstellen und DGL-Berechung;
  !distring=Abstand zwischen 2 Teilchenringen; soft=Softening Parameter; moving=Ungestörte Beweungsgeschw.; 
  !hnext=hier ein (noch) nicht benutzter Parameter, braucht aber die neu definiert odeint damit sie funktioniert 
  DOUBLE PRECISION :: zeit0,Rmin,M1,M2,k,Mred,l,zeit,R1x,R1y,R2x,R2y,genau,distring,soft,moving,hnext
  !nring=Anzahl der Teilchenringe um Galaxie; npr=Anzahl der Teilchen pro Ring;
  !ngal=Anzahl der Galaxien mit Teilchen (1=nur eine, 2=beide); modus=auswählbarer Rechenmodus
  INTEGER :: nring,npr,ngal,modus
END MODULE

 
!Modul für Funktionen zur Bestimmung der Galaxienpostion und der Wechselwirkung
MODULE GalPos   

CONTAINS 

! Funktion für Odeint; 2 Galaxien bewegen sich fließend
SUBROUTINE derivs(x,y,dydx)
USE nrtype
USE Para
USE nrlib
IMPLICIT NONE
REAL(SP), INTENT(IN) :: x
REAL(SP), DIMENSION(:), INTENT(IN) :: y
REAL(SP), DIMENSION(:), INTENT(OUT) :: dydx
DOUBLE PRECISION dist1,dist2,theta
zeit=x
theta = rtsafe(func5,-PI_D,PI_D,genau)
CALL Posi(theta,R1x,R1y,R2x,R2y)
dydx(1) = y(4)  
dydx(2) = y(5) 
dydx(3) = y(6) 
dist1=DSQRT(((y(1)-R1x)**2)+((y(2)-R1y)**2)+((y(3))**2)+(soft**2))
dist2=DSQRT(((y(1)-R2x)**2)+((y(2)-R2y)**2)+((y(3))**2)+(soft**2))
dydx(4) = -((M1*(y(1)-R1x))/(dist1**3)+(M2*(y(1)-R2x))/(dist2**3))
dydx(5) = -((M1*(y(2)-R1y))/(dist1**3)+(M2*(y(2)-R2y))/(dist2**3)) 
dydx(6) = -((M1*(y(3)))/(dist1**3)+(M2*(y(3)))/(dist2**3))

END SUBROUTINE derivs


! Funktion für Odeint; 2 Galaxien bewegen sprunghaft
SUBROUTINE derivs2(x,y,dydx)
USE nrtype
USE Para
USE nrlib
IMPLICIT NONE
REAL(SP), INTENT(IN) :: x
REAL(SP), DIMENSION(:), INTENT(IN) :: y
REAL(SP), DIMENSION(:), INTENT(OUT) :: dydx
DOUBLE PRECISION dist1,dist2
dydx(1) = y(4)  
dydx(2) = y(5) 
dydx(3) = y(6) 
dist1=DSQRT(((y(1)-R1x)**2)+((y(2)-R1y)**2)+((y(3))**2)+(soft**2))
dist2=DSQRT(((y(1)-R2x)**2)+((y(2)-R2y)**2)+((y(3))**2)+(soft**2))
dydx(4) = -((M1*(y(1)-R1x))/(dist1**3)+(M2*(y(1)-R2x))/(dist2**3))
dydx(5) = -((M1*(y(2)-R1y))/(dist1**3)+(M2*(y(2)-R2y))/(dist2**3)) 
dydx(6) = -((M1*(y(3)))/(dist1**3)+(M2*(y(3)))/(dist2**3))

END SUBROUTINE derivs2


! Funktion für Odeint; Galaxie bewegt sich fließend, ohne Störung
SUBROUTINE derivs3(x,y,dydx)
USE nrtype
USE Para
USE nrlib
IMPLICIT NONE
REAL(SP), INTENT(IN) :: x
REAL(SP), DIMENSION(:), INTENT(IN) :: y
REAL(SP), DIMENSION(:), INTENT(OUT) :: dydx
DOUBLE PRECISION dist1
dydx(1) = y(4)  
dydx(2) = y(5) 
dydx(3) = y(6) 
dist1=DSQRT(((y(1)-R1x)**2)+((y(2)-R1y)**2)+((y(3))**2)+(soft**2))
dydx(4) = -((M1*(y(1)-R1x))/(dist1**3))
dydx(5) = -((M1*(y(2)-R1y))/(dist1**3)) 
dydx(6) = -((M1*(y(3)))/(dist1**3))

END SUBROUTINE derivs3


! Funktion für Odeint; Galaxie bewegt sich sprunghaft, ohne Störung
SUBROUTINE derivs4(x,y,dydx)
USE nrtype
USE Para
USE nrlib
IMPLICIT NONE
REAL(SP), INTENT(IN) :: x
REAL(SP), DIMENSION(:), INTENT(IN) :: y
REAL(SP), DIMENSION(:), INTENT(OUT) :: dydx
DOUBLE PRECISION dist1
R1x=-50.D0+moving*(x+zeit0)
R1y=-50.D0+moving*(x+zeit0)
dydx(1) = y(4)  
dydx(2) = y(5) 
dydx(3) = y(6) 
dist1=DSQRT(((y(1)-R1x)**2)+((y(2)-R1y)**2)+((y(3))**2)+(soft**2))
dydx(4) = -((M1*(y(1)-R1x))/(dist1**3))
dydx(5) = -((M1*(y(2)-R1y))/(dist1**3)) 
dydx(6) = -((M1*(y(3)))/(dist1**3))

END SUBROUTINE derivs4



! Funktion ermittelt Abweichung von der Kreisbahngeschwindigkeit
SUBROUTINE kreisabwg(partik,Rx,Ry,Masse,winkel,number)
USE Para
DOUBLE PRECISION, DIMENSION(6), INTENT(IN) :: partik
DOUBLE PRECISION, INTENT(IN) :: Rx
DOUBLE PRECISION, INTENT(IN) :: Ry
DOUBLE PRECISION, INTENT(IN) :: Masse
DOUBLE PRECISION, INTENT(IN) :: winkel
INTEGER, INTENT(IN) :: number
DOUBLE PRECISION abst,geschw,vkreis,abw

abst=((partik(1)-Rx)**2)+((partik(2)-Ry)**2)+((partik(3))**2)
abst=DSQRT(abst)
IF (modus.NE.3) THEN
geschw=((partik(4)-DSIN(winkel)*Rmin*Mred*(k**2)/(l**3))**2)
geschw=geschw+((partik(5)+((DCOS(winkel/2.D0))**2)*Rmin*2*Mred*(k**2)/(l**3))**2)
geschw=geschw+((partik(6))**2)
ELSE
geschw=((partik(4))**2)+((partik(5))**2)+((partik(6))**2)

ENDIF
geschw=DSQRT(geschw)
vkreis=DSQRT(Masse/abst)

abw=(geschw/vkreis-1.D0)*100.D0

IF (abw.LT.0.D0) THEN
abw=-abw
ENDIF

WRITE(206,*) number,abw
END SUBROUTINE kreisabwg


! Funktion ermittelt Abweichung von der Kreisbahn (Abstand)
SUBROUTINE kreisabwd(partik,Rx,Ry,number,zeitpkt)
USE Para
USE nrtype
!Array für Teilchenpostion und Geschwindigkeit
DOUBLE PRECISION, DIMENSION(6), INTENT(IN) :: partik
!Position der Galaxie
DOUBLE PRECISION, INTENT(IN) :: Rx
DOUBLE PRECISION, INTENT(IN) :: Ry
!aktuelle (Rechen)-Zeit
DOUBLE PRECISION, INTENT(IN) :: zeitpkt
!Masse der betrachteten Galaxie
DOUBLE PRECISION :: Masse
!Index des Testteilchen 
INTEGER, INTENT(IN) :: number
!"Nummer" des Rings
INTEGER :: ringnum
!abst=Abstand vom Zentrum der Galaxie; umlauf=bisher durchgeführte Umläufe;
!abw=Abweichung; abstsoll=galaktozentrischer Abstand für Teilchen, wenn es auf Kreisbahn wäre
DOUBLE PRECISION :: abst,umlauf,abw,abstsoll

!Berechne den galaktozentrischen Abstand
abst=((partik(1)-Rx)**2)+((partik(2)-Ry)**2)+((partik(3))**2)
abst=DSQRT(abst)

!Fall nur eine Galaxie berechent wird
IF (ngal.EQ.1) THEN

!Ermittle Ringnummer aus Teilchenindex
ringnum=((number-1)/npr)+1
!Berechen Soll-Abstand aus Ringnummer
abstsoll=distring*DBLE(ringnum)
!Wähle die Masse der Galaxie
Masse=M1

ELSE

!Schaue ob Teilchen zur ersten Galaxie gehört
IF (number.LE.(npr*nring)) THEN
!Ermittle Ringnummer aus Teilchenindex
ringnum=((number-1)/npr)+1
!Berechen Soll-Abstand aus Ringnummer
abstsoll=distring*DBLE(ringnum)
!Wähle die Masse der Galaxie
Masse=M1

ELSE !falls bei zweiter Galaxie
!Ermittle Ringnummer aus Teilchenindex
ringnum=((number-1-(npr*nring))/npr)+1
!Berechen Soll-Abstand aus Ringnummer
abstsoll=distring*DBLE(ringnum)
!Wähle die Masse der Galaxie
Masse=M2

ENDIF

ENDIF

!Berechne die Abweichung vom Soll-Abstand in Prozent
abw=(abst/abstsoll-1.D0)*100.D0

! Wert soll positiv sein!
IF (abw.LT.0.D0) THEN
abw=-abw
ENDIF

!Berechne aus Abstand und Zeit die Anzahl der Umläufe von Start bis jetzt
umlauf=2.D0*PI_D*DSQRT(Masse/((abstsoll)**3))*zeitpkt
!Ausgabe
WRITE(206,*) number,umlauf,abw

END SUBROUTINE kreisabwd





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



!Hauptprogramm
PROGRAM galaxien
  USE nr
  USE nrtype
  USE nrutil
  USE Para
  USE GalPos
  USE nrlib
  USE ode_path
 
  IMPLICIT NONE
  DOUBLE PRECISION :: zeitout,hzeit,ahzeit,printst
  DOUBLE PRECISION :: Rstart,theta,t1,t2,h1,hmin
  DOUBLE PRECISION, ALLOCATABLE :: testbody(:,:)
  REAL(SP), DIMENSION(6) :: ystart
  INTEGER i,ii,hilf,kreis,inputfile

 EXTERNAL derivs
 EXTERNAL derivs2
 EXTERNAL derivs3
 EXTERNAL derivs4
 EXTERNAL func5 

WRITE(*,*) 'Galaxienwechselwirkung'
WRITE(*,*)
WRITE(*,*) 'Wollen Sie die Parameter von einer Eingabedatei einlesen (1) oder direkt eingeben (2)?'
READ(*,*) inputfile

IF (inputfile.EQ.1) THEN

OPEN (299,FILE='input3.dat', STATUS='OLD')

READ(299,*) 
READ(299,*) M1
READ(299,*) 
READ(299,*) M2
READ(299,*) 
READ(299,*) Rstart
READ(299,*) 
READ(299,*) Rmin
READ(299,*) 
READ(299,*) ngal
READ(299,*) 
READ(299,*) nring
READ(299,*) 
READ(299,*) distring
READ(299,*) 
READ(299,*) npr
READ(299,*) 
READ(299,*) genau
READ(299,*) 
READ(299,*) soft
READ(299,*) 
READ(299,*) printst
READ(299,*) 
READ(299,*) modus
READ(299,*) 
READ(299,*) kreis


CLOSE(299)
WRITE(*,*)
WRITE(*,*) 'Werte aus Datei eingelesen'
WRITE(*,*)

  ELSE
WRITE(*,*) 'Bitte geben Sie die Masse(in 100Mrd Sonnenmassen) der 1. Galaxie ein:'
READ(*,*) M1
WRITE(*,*) 'Bitte geben Sie die Masse(in 100Mrd Sonnenmassen) der 2. Galaxie ein:'
READ(*,*) M2
WRITE(*,*) 'Bitte geben Sie den Startabstand(in kpc) zwischen den Galaxien ein:'
READ(*,*) Rstart
WRITE(*,*) 'Bitte geben Sie den Mindestabstand(in kpc) zwischen den Galaxien ein:'
READ(*,*) Rmin
WRITE(*,*) 'Um wieviele Galaxien sollen Testpartikel haben:'
READ(*,*) ngal
WRITE(*,*) 'Bitte geben Sie die Anzahl der Ringe aus Testpartikeln pro Galaxie an:'
READ(*,*) nring
WRITE(*,*) 'Was soll der Abstand(in kpc) zwischen den Ringen sein:'
READ(*,*) distring
WRITE(*,*) 'Bitte geben Sie die Anzahl der Testpartikeln pro Ring an:'
READ(*,*) npr
WRITE(*,*) 'Geben Sie die gewünschte Genauigkeit an:'
READ(*,*) genau
WRITE(*,*) 'Geben Sie den Softening-Parameter(in kpc) ein:'
READ(*,*) soft
WRITE(*,*) 'Ausgabeschrittweite(in Mill Jahren):'
READ(*,*) printst
WRITE(*,*) 'Wählen Sie den Rechenmodus aus:'
READ(*,*) modus
WRITE(*,*) 'relative Abweichung von der Kreisbahn berechnen (0=Nein;1=Abstand;2=Geschwindigkeit):'
READ(*,*) kreis
WRITE(*,*)





ENDIF


IF ((modus.EQ.3).OR.(modus.EQ.4)) THEN
ngal=1
  ENDIF

CALL CPU_TIME(t1)
OPEN (200,FILE='3galpos1.dat', STATUS='UNKNOWN')
OPEN (201,FILE='3galpos2.dat', STATUS='UNKNOWN')
OPEN (205,FILE='testpar.dat', STATUS='UNKNOWN')
OPEN (210,FILE='3galinput.dat', STATUS='UNKNOWN')
OPEN (206,FILE='kbaw.dat', STATUS='UNKNOWN')
hilf=nring*npr*ngal
ALLOCATE(testbody(6,hilf))

WRITE(210,*) 'M1= ',M1
WRITE(210,*) 'M2= ',M2
WRITE(210,*) 'RStart= ',RStart
WRITE(210,*) 'Rmin= ',Rmin
WRITE(210,*) 'Galaxien mit Testpartikel= ',ngal
WRITE(210,*) 'Anzahl der Ringe= ',nring
WRITE(210,*) 'Ringabstand= ',distring
WRITE(210,*) 'Partikel pro Ring= ',npr
WRITE(210,*) 'Genauigkeit= ',genau
WRITE(210,*) 'Ausgabeschrittweite= ',printst
WRITE(210,*) 'Modus= ',modus

printst=printst/1.49D0


moving=1.D-1
  h1   = 0.01D0
  hmin = 0.D0
theta=DACOS(2.D0*Rmin/Rstart-1.D0)
Mred=M1*M2/(M1+M2)
k=M1*M2
l=DSQRT(2.D0*Rmin*(M1+M2))*Mred
zeit0=(l**3)/(2.D0*Mred*k**2)*(DTAN(theta/2.D0)+((DTAN(theta/2.D0))**3)/3.D0)
hzeit=-zeit0

R1x=-M2/(M1+M2)*Rstart*DCOS(theta)
R1y=M2/(M1+M2)*Rstart*DSIN(theta)
R2x=M1/(M1+M2)*Rstart*DCOS(theta) 
R2y=-M1/(M1+M2)*Rstart*DSIN(theta)  

IF (modus.LT.3) THEN

IF (ngal.GT.0) THEN

 DO i=1,npr
 DO ii=1,nring
testbody(1,i+(ii-1)*npr)=distring*DBLE(ii)*DCOS(2.D0*PI_D/DBLE(npr)*DBLE(i))
testbody(2,i+(ii-1)*npr)=distring*DBLE(ii)*DSIN(2.D0*PI_D/DBLE(npr)*DBLE(i))
testbody(3,i+(ii-1)*npr)=0
testbody(4,i+(ii-1)*npr)=-DSQRT(M1/(distring*DBLE(ii)))*DSIN(2.D0*PI_D/DBLE(npr)*DBLE(i))
testbody(5,i+(ii-1)*npr)=DSQRT(M1/(distring*DBLE(ii)))*DCOS(2.D0*PI_D/DBLE(npr)*DBLE(i))
testbody(6,i+(ii-1)*npr)=0
 ENDDO  
 ENDDO 

hilf=nring*npr
DO i=1,hilf
testbody(1,i)=testbody(1,i)+R1x
testbody(2,i)=testbody(2,i)+R1y
testbody(3,i)=testbody(3,i)
testbody(4,i)=testbody(4,i)-DSIN(theta)*Rmin*Mred*(k**2)/(l**3)
testbody(5,i)=testbody(5,i)+((DCOS(theta/2.D0))**2)*Rmin*2*Mred*(k**2)/(l**3)
testbody(6,i)=testbody(6,i)
ENDDO

ENDIF


IF (ngal.EQ.2) THEN

 DO i=1,npr
 DO ii=1,nring
testbody(1,i+(ii-1)*npr+npr*nring)=distring*DBLE(ii)*DCOS(2.D0*PI_D/DBLE(npr)*DBLE(i))
testbody(2,i+(ii-1)*npr+npr*nring)=distring*DBLE(ii)*DSIN(2.D0*PI_D/DBLE(npr)*DBLE(i))
testbody(3,i+(ii-1)*npr+npr*nring)=0
testbody(4,i+(ii-1)*npr+npr*nring)=-DSQRT(M2/(distring*DBLE(ii)))*DSIN(2.D0*PI_D/DBLE(npr)*DBLE(i))
testbody(5,i+(ii-1)*npr+npr*nring)=DSQRT(M2/(distring*DBLE(ii)))*DCOS(2.D0*PI_D/DBLE(npr)*DBLE(i))
testbody(6,i+(ii-1)*npr+npr*nring)=0
 ENDDO  
 ENDDO 

DO i=1,(nring*npr)
testbody(1,i+npr*nring)=testbody(1,i+npr*nring)+R2x
testbody(2,i+npr*nring)=testbody(2,i+npr*nring)+R2y
testbody(3,i+npr*nring)=testbody(3,i+npr*nring)
testbody(4,i+npr*nring)=testbody(4,i+npr*nring)+DSIN(theta)*Rmin*Mred*(k**2)/(l**3)
testbody(5,i+npr*nring)=testbody(5,i+npr*nring)-((DCOS(theta/2.D0))**2)*Rmin*2*Mred*(k**2)/(l**3)
testbody(6,i+npr*nring)=testbody(6,i+npr*nring)
ENDDO

ENDIF

ELSE
R1x=-50
R1y=-50
R2x=200
R2y=0  

 DO i=1,npr
 DO ii=1,nring
testbody(1,i+(ii-1)*npr)=distring*DBLE(ii)*DCOS(2.D0*PI_D/DBLE(npr)*DBLE(i))
testbody(2,i+(ii-1)*npr)=distring*DBLE(ii)*DSIN(2.D0*PI_D/DBLE(npr)*DBLE(i))
testbody(3,i+(ii-1)*npr)=0
testbody(4,i+(ii-1)*npr)=-DSQRT(M1/(distring*DBLE(ii)))*DSIN(2.D0*PI_D/DBLE(npr)*DBLE(i))
testbody(5,i+(ii-1)*npr)=DSQRT(M1/(distring*DBLE(ii)))*DCOS(2.D0*PI_D/DBLE(npr)*DBLE(i))
testbody(6,i+(ii-1)*npr)=0
 ENDDO  
 ENDDO 

hilf=nring*npr
DO i=1,hilf
testbody(1,i)=testbody(1,i)+R1x
testbody(2,i)=testbody(2,i)+R1y
testbody(3,i)=testbody(3,i)
testbody(4,i)=testbody(4,i)+moving
testbody(5,i)=testbody(5,i)+moving
testbody(6,i)=testbody(6,i)
ENDDO

ENDIF




IF (modus.EQ.1) THEN

101 CONTINUE
ahzeit=hzeit
hzeit=hzeit+printst
zeitout=hzeit*1.49D0

DO i=1,(nring*npr*ngal)
ystart(1)=testbody(1,i)
ystart(2)=testbody(2,i)
ystart(3)=testbody(3,i)
ystart(4)=testbody(4,i)
ystart(5)=testbody(5,i)
ystart(6)=testbody(6,i)
CALL odeint(ystart,ahzeit,hzeit,genau,h1,hmin,derivs,rkqs,hnext)
testbody(1,i)=ystart(1)
testbody(2,i)=ystart(2)
testbody(3,i)=ystart(3)
testbody(4,i)=ystart(4)
testbody(5,i)=ystart(5)
testbody(6,i)=ystart(6)
WRITE(205,*) zeitout,testbody(1,i),testbody(2,i),testbody(3,i)

IF (kreis.EQ.2) THEN
  
zeit=hzeit
theta = rtsafe(func5,-PI_D,PI_D,genau)
CALL Posi(theta,R1x,R1y,R2x,R2y)

CALL kreisabwg(ystart,R1x,R1y,M1,theta,i)
ENDIF
IF (kreis.EQ.1) THEN
  
zeit=hzeit
theta = rtsafe(func5,-PI_D,PI_D,genau)
CALL Posi(theta,R1x,R1y,R2x,R2y)
  
CALL kreisabwd(ystart,R1x,R1y,i,hzeit+zeit0)
ENDIF

ENDDO  



WRITE (*,*) zeitout
WRITE (200,*) zeitout,R1x,R1y
WRITE (201,*) zeitout,R2x,R2y
IF (hzeit.LT.zeit0) THEN
GOTO 101
ENDIF


ELSEIF (modus.EQ.2) THEN


102 CONTINUE
ahzeit=hzeit
hzeit=hzeit+printst

zeit=hzeit
theta = rtsafe(func5,-PI_D,PI_D,genau)
CALL Posi(theta,R1x,R1y,R2x,R2y)
zeitout=hzeit*1.49D0

DO i=1,(nring*npr*ngal)
ystart(1)=testbody(1,i)
ystart(2)=testbody(2,i)
ystart(3)=testbody(3,i)
ystart(4)=testbody(4,i)
ystart(5)=testbody(5,i)
ystart(6)=testbody(6,i)
CALL odeint(ystart,ahzeit,hzeit,genau,h1,hmin,derivs2,rkqs,hnext)
testbody(1,i)=ystart(1)
testbody(2,i)=ystart(2)
testbody(3,i)=ystart(3)
testbody(4,i)=ystart(4)
testbody(5,i)=ystart(5)
testbody(6,i)=ystart(6)
WRITE(205,*) zeitout,testbody(1,i),testbody(2,i),testbody(3,i)

IF (kreis.EQ.2) THEN
CALL kreisabwg(ystart,R1x,R1y,M1,theta,i)
ENDIF

IF (kreis.EQ.1) THEN
CALL kreisabwd(ystart,R1x,R1y,i,hzeit+zeit0)
ENDIF

ENDDO  



WRITE (*,*) zeitout
WRITE (200,*) zeitout,R1x,R1y
WRITE (201,*) zeitout,R2x,R2y
IF (hzeit.LT.zeit0) THEN
GOTO 102
ENDIF

ELSEIF (modus.EQ.4) THEN

104 CONTINUE
ahzeit=hzeit
hzeit=hzeit+printst
zeitout=hzeit*1.49D0

DO i=1,(nring*npr*ngal)
ystart(1)=testbody(1,i)
ystart(2)=testbody(2,i)
ystart(3)=testbody(3,i)
ystart(4)=testbody(4,i)
ystart(5)=testbody(5,i)
ystart(6)=testbody(6,i)
CALL odeint(ystart,ahzeit,hzeit,genau,h1,hmin,derivs4,rkqs,hnext)
testbody(1,i)=ystart(1)
testbody(2,i)=ystart(2)
testbody(3,i)=ystart(3)
testbody(4,i)=ystart(4)
testbody(5,i)=ystart(5)
testbody(6,i)=ystart(6)
WRITE(205,*) zeitout,testbody(1,i),testbody(2,i),testbody(3,i)


  
IF (kreis.EQ.2) THEN
R1x=-50.D0+moving*(hzeit+zeit0)
R1y=-50.D0+moving*(hzeit+zeit0)
CALL kreisabwg(ystart,R1x,R1y,M1,theta,i)
ENDIF

IF (kreis.EQ.1) THEN
R1x=-50.D0+moving*(hzeit+zeit0)
R1y=-50.D0+moving*(hzeit+zeit0)
CALL kreisabwd(ystart,R1x,R1y,i,hzeit+zeit0)
ENDIF

ENDDO  



WRITE (*,*) zeitout
WRITE (200,*) zeitout,R1x,R1y
WRITE (201,*) zeitout,R2x,R2y
IF (hzeit.LT.zeit0) THEN
GOTO 104
ENDIF

ELSE   !modus=3
  

103 CONTINUE
ahzeit=hzeit
hzeit=hzeit+printst

zeit=hzeit
R1x=R1x+moving
R1y=R1y+moving
zeitout=hzeit*1.49D0

DO i=1,(nring*npr*ngal)
ystart(1)=testbody(1,i)
ystart(2)=testbody(2,i)
ystart(3)=testbody(3,i)
ystart(4)=testbody(4,i)
ystart(5)=testbody(5,i)
ystart(6)=testbody(6,i)
CALL odeint(ystart,ahzeit,hzeit,genau,h1,hmin,derivs3,rkqs,hnext)
testbody(1,i)=ystart(1)
testbody(2,i)=ystart(2)
testbody(3,i)=ystart(3)
testbody(4,i)=ystart(4)
testbody(5,i)=ystart(5)
testbody(6,i)=ystart(6)
WRITE(205,*) zeitout,testbody(1,i),testbody(2,i),testbody(3,i)

IF (kreis.EQ.2) THEN
CALL kreisabwg(ystart,R1x,R1y,M1,theta,i)
ENDIF

IF (kreis.EQ.1) THEN
CALL kreisabwd(ystart,R1x,R1y,i,hzeit+zeit0)
ENDIF

ENDDO  



WRITE (*,*) zeitout
WRITE (200,*) zeitout,R1x,R1y
WRITE (201,*) zeitout,R2x,R2y
IF (hzeit.LT.zeit0) THEN
GOTO 103
ENDIF

ENDIF


!Berechnen die benötigte CPU-Zeit
CALL CPU_TIME(t2)
t2=t2-t1
WRITE(*,*) 'CPU-Zeit: ',t2
WRITE(210,*) 'CPU-Zeit: ',t2
!Schließe alle offenen Dateien
CLOSE(200)
CLOSE(201)
CLOSE(210)
CLOSE(205)
CLOSE(206)
  

!Programm Ende
END PROGRAM galaxien

