MODULE param
    IMPLICIT NONE
	DOUBLE PRECISION, PARAMETER :: rsun=6.953D+08,msun=1.983D+30,pi=3.1415926535897932384,gg=6.67428D-11,step=1.0D-02
END MODULE param


!************************rechte Seiten der Zustandsgleichungen*************************

MODULE functions 
	CONTAINS

	! Funktion dRho: entspricht drho/dr und hängt von Radius r, Dichte rho und Masse m ab
    ! gamma ist der Adiabatenindex
	FUNCTION drho(r,rho,m,gamma)
		IMPLICIT NONE
		DOUBLE PRECISION :: r,m,rho,gamma,drho
		!Abfrage ob Radius Null ist um Singularität zu vermeiden
		IF (r==0.D0) THEN
			drho=0.D0
		ELSE
         IF (rho.GE.0) THEN
			drho=-m*(rho**(2.D0-gamma))/(r**2)
         ELSE
			drho=m*((-rho)**(2.D0-gamma))/(r**2)
         ENDIF            
		ENDIF
	END FUNCTION

	! Funktion dm: entspricht dm/dr und hängt von Radius r und Dichte rho ab
	FUNCTION dm(r,rho)
		IMPLICIT NONE
		DOUBLE PRECISION :: r,rho
		DOUBLE PRECISION :: dm
		dm=(r**2)*rho
	END FUNCTION

END MODULE

!****************************RUNGEKUTTA**********************************************

SUBROUTINE rungekutta(deltar,g,rquer,mquer)
USE functions

IMPLICIT NONE
DOUBLE PRECISION, DIMENSION(2,4) :: k  !array k sind Koeffizienten fuer Runge-Kutta Verfahren
DOUBLE PRECISION :: deltar, g, rquer, mquer
DOUBLE PRECISION :: dichte,masse,radius !die Variable dichte ist der Dichtenparameter des DGLS
										! die Variable masse ist der Massenparameter des DGLS
										! Variable radius ist der Parameter Radius von dem die beiden DGL abhängen und nach dem integriert wird
INTEGER :: count
count=0

!Anfangsbedingungen für DGL
masse=0.D0
dichte=1.D0
radius=0.D0 

!Ausgabe auf Bildschirm und Datei
OPEN (200,FILE='density.dat', STATUS='UNKNOWN')
WRITE(*,*)
WRITE(*,*) '     Radius     |       Dichte       |       Masse'
WRITE(*,*) '___________________________________________________________'
WRITE(*,*)
WRITE(200,*) '     Radius     |       Dichte       |       Masse'
WRITE(200,*) '___________________________________________________________'
WRITE(200,*)

!Formatierungen für die Ausgabe
301 FORMAT(I5,'|',2X,1P,E10.4,5X,'|',5X,0P,F10.7,5X,'|',3X,1P,E10.4)

DO  
count=count+1  
WRITE(*,*) 'count=',count
!Berechnung der Koeffizienten des Runge-Kutta Verfahrens
k(1,1)=deltar*drho(radius,dichte,masse,g)
WRITE(*,*) 'k11, drho=', drho(radius, dichte, masse, g)
k(2,1)=deltar*dm(radius,dichte)
WRITE(*,*) 'k12, dichte+k11=', (dichte+k(1,1)/2.D0)
k(1,2)=deltar*drho(radius+deltar/2.D0,dichte+k(1,1)/2.D0,masse+k(2,1)/2.D0,g)
k(2,2)=deltar*dm(radius+deltar/2.D0,dichte+k(1,1)/2.D0)
WRITE(*,*)'k12, drho=',drho(radius+deltar/2.D0,dichte+k(1,1)/2.D0,masse+k(2,1)/2.D0,g)

k(1,3)=deltar*drho(radius+deltar/2.D0,dichte+k(1,2)/2.D0,masse+k(2,2)/2.D0,g)
k(2,3)=deltar*dm(radius+deltar/2.D0,dichte+k(1,2)/2.D0)

k(1,4)=deltar*drho(radius+deltar,dichte+k(1,3),masse+k(2,3),g)
k(2,4)=deltar*dm(radius+deltar,dichte+k(1,3))

! Berechnung der Dichte und Masse beim aktuellen Radius durch aufsummieren der Koeffizienten
dichte=dichte+k(1,1)/6.D0+k(1,2)/3.D0+k(1,3)/3.D0+k(1,4)/6.D0
masse=masse+k(2,1)/6.D0+k(2,2)/3.D0+k(2,3)/3.D0+k(2,4)/6.D0

radius=radius+deltar

!Ausgabe der Werte am Bildschirm und in Datei
WRITE(*,301) count,radius,dichte,masse
WRITE(200,301) count,radius,dichte,masse

rquer=radius
mquer=masse

IF (dichte.LE.1.D-10) EXIT

END DO

CLOSE(200)

END SUBROUTINE

PROGRAM whitedwarf
USE param
IMPLICIT NONE
DOUBLE PRECISION :: rq,mq,rhoc,pc,rstar,mstar,gamma

	gamma=5.D0/3.D0
	rstar=0.015*rsun
	mstar=0.6*msun


CALL rungekutta(step,gamma,rq,mq)

rhoc=(mstar/mq)/(1.D0/((4.D0*pi)*(rstar/rq)**3))
pc=(gg/(4D0*pi*gamma))*((mstar/mq)**2)*((rq/rstar)**4)

OPEN(100, FILE='density.dat', STATUS='APPEND')
WRITE(100,*)
WRITE(100,*)'--------------------------------------------------------------------------------------------------------'
WRITE(100,'(A25,A1,A25)')'core density rho(0)','|','core pressure P(0)'
WRITE(100,*)'--------------------------------------------------------------------------------------------------------'
WRITE(100,'(2E25.15)') rhoc,pc 

END PROGRAM