MODULE ausgabe
CONTAINS
      SUBROUTINE outbod(imod,iform,nb1,nb2,nbmax,tnow,pos)
      INTEGER imod,iform,i,j,iobod,nbody,ndim,nbmax,nb1,nb2
      DOUBLE PRECISION tnow,pos(1:nbmax,1:3)
      PARAMETER(iobod=42,ndim=3)


      nbody = nb1 + nb2

      IF(imod.EQ.0) THEN
         IF(iform.EQ.0) THEN
            OPEN(iobod,FILE='outbo.bin',STATUS='unknown',FORM='unformatted')
         ELSE
            OPEN(iobod,FILE='outbo.asc',STATUS='unknown',FORM='formatted')
         ENDIF
      ENDIF


      IF(imod.EQ.1 .OR. imod.EQ.0) THEN


         IF(iform.EQ.0) THEN
            WRITE(iobod) nbody,nb1,nb2,ndim,tnow
            WRITE(iobod) ((pos(i,j),i=1,nbody),j=1,3)
         ELSE

            WRITE(iobod,110) nbody,nb1,nb2
            WRITE(iobod,120) ndim
            WRITE(iobod,130) tnow
            DO 100 i=1,nbody
               WRITE(iobod,140) (pos(i,j),j=1,3)
100         CONTINUE
 
110         FORMAT(5X,3(I10,2X),14X,' NBODIES')
120         FORMAT(12X,I3,40X,' NDIM')
130         FORMAT(5X,1P,E10.3,40X,' TNOW')
140         FORMAT(1P,3(E12.4,1X))
         ENDIF
      ENDIF 

      IF(imod.EQ.2) THEN
         CLOSE(iobod)
      ENDIF
      END SUBROUTINE


END MODULE


MODULE nrlib    !Modul für Funktionen aus Numerical Recipies (könnte auch noch ausgelagert werden)
CONTAINS

	FUNCTION rtsafe(funcd,x1,x2,xacc)  !Nullstellensuche
	USE nrtype; USE nrutil, ONLY : nrerror
	IMPLICIT NONE
	REAL(SP), INTENT(IN) :: x1,x2,xacc
	REAL(SP) :: rtsafe
	INTERFACE
		SUBROUTINE funcd(x,fval,fderiv)
		USE nrtype
		IMPLICIT NONE
		REAL(SP), INTENT(IN) :: x
		REAL(SP), INTENT(OUT) :: fval,fderiv
		END SUBROUTINE funcd
	END INTERFACE
	INTEGER(I4B), PARAMETER :: MAXIT=100
	INTEGER(I4B) :: j
	REAL(SP) :: df,dx,dxold,f,fh,fl,temp,xh,xl
	call funcd(x1,fl,df)
	call funcd(x2,fh,df)
	if ((fl > 0.0 .and. fh > 0.0) .or. &
		(fl < 0.0 .and. fh < 0.0)) &
		call nrerror('root must be bracketed in rtsafe')
	if (fl == 0.0) then
		rtsafe=x1
		RETURN
	else if (fh == 0.0) then
		rtsafe=x2
		RETURN
	else if (fl < 0.0) then
		xl=x1
		xh=x2
	else
		xh=x1
		xl=x2
	end if
	rtsafe=0.5_sp*(x1+x2)
	dxold=abs(x2-x1)
	dx=dxold
	call funcd(rtsafe,f,df)
	do j=1,MAXIT
		if (((rtsafe-xh)*df-f)*((rtsafe-xl)*df-f) >= 0.0 .or. &
			abs(2.0_sp*f) > abs(dxold*df) ) then
			dxold=dx
			dx=0.5_sp*(xh-xl)
			rtsafe=xl+dx
			if (xl == rtsafe) RETURN
		else
			dxold=dx
			dx=f/df
			temp=rtsafe
			rtsafe=rtsafe-dx
			if (temp == rtsafe) RETURN
		end if
		if (abs(dx) < xacc) RETURN
		call funcd(rtsafe,f,df)
		if (f < 0.0) then
			xl=rtsafe
		else
			xh=rtsafe
		end if
	end do
	call nrerror('rtsafe: exceeded maximum iterations')
	END FUNCTION rtsafe

END MODULE
