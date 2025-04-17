
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


