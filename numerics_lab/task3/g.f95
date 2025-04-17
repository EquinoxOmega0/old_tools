MODULE Para
  IMPLICIT NONE
  DOUBLE PRECISION :: Rmin,M1,M2,k,Mred,l,zeit

END MODULE



MODULE GalPos

CONTAINS 

SUBROUTINE func5(x,fval,fderiv)
!
!    function used in root finding
!
  USE nrtype
  USE Para
  IMPLICIT NONE
  REAL(SP), INTENT(IN) :: x
  REAL(SP), INTENT(OUT) :: fval, fderiv
  DOUBLE PRECISION :: vorfak
  vorfak = (l**3)/(2.D0*Mred*k**2)	
  fval   = vorfak*(DTAN(x/2.D0)+((DTAN(x/2.D0))**3)/3.D0)-zeit
  fderiv = vorfak/(2.D0*((DCOS(x/2.D0))**4))

END SUBROUTINE func5


SUBROUTINE Posi(theta,R1x,R1y,R2x,R2y)
  USE Para
  IMPLICIT NONE
  DOUBLE PRECISION :: theta,R1x,R1y,R2x,R2y,radius,qcos,qsin
  qcos=DCOS(theta)
  qsin=DSIN(theta)
  radius=2.D0*Rmin/(1.D0+qcos)
  R1x=-M2/(M1+M2)*radius*qcos
  R1y=-M2/(M1+M2)*radius*qsin
  R2x=M1/(M1+M2)*radius*qcos 
  R2y=M1/(M1+M2)*radius*qsin  
END SUBROUTINE

END MODULE


PROGRAM galaxien
  USE nrtype
  USE nrutil
  USE Para
  USE GalPos
  USE nr
  IMPLICIT NONE
  DOUBLE PRECISION :: genau,thetamin,thetamax,zeit0
  DOUBLE PRECISION :: R1x,R1y,R2x,R2y,Rstart,theta

EXTERNAL func5   

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


thetamin=-PIO2_D
thetamax=PIO2_D
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

WRITE (*,*) zeit,R1x,R1y,R2x,R2y

zeit=zeit+1.D0
IF (zeit.LT.zeit0) THEN
GOTO 101
ENDIF

END PROGRAM galaxien

