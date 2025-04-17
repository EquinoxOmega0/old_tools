
MODULE functions
CONTAINS
FUNCTION f1(x)
DOUBLE :: f1,x
f1=x**3-5.D0*x**2+100.D0*x-400.D0
END FUNCTION f1
FUNCTION f2(x)
DOUBLE :: f2,x
f2=exp(-x)-0.1D0/(1.D0+x)
END FUNCTION f2

FUNCTION df1(x)
DOUBLE :: df1,x
df1=3*x**2-10.D0*x+100.D0
END FUNCTION df1
FUNCTION df2(x)
DOUBLE :: df2,x
df2=-exp(-x)-0.1D0*LOG(1.D0+x)
END FUNCTION df2


END MODULE functions

MODULE sonstiges
PARAMETER genauigkeit=1.D-4
END MODULE sonstiges

PROGRAM Nullstellen

IMPLICIT NONE

USE functions


FUNCTION bisec(f)
USE sonstiges
DOUBLE bisec
DOUBLE a,b,xx
DOUBLE fa,fb,fx
LOGICAL genau


INTERFACE
FUNCTION f(x); DOUBLE f,x; END FUNCTION
END INTERFACE

WRITE(*,*) 'Intervallgrenzen eingeben'
WRITE(*,*) 'a= '
READ(*,*) a
WRITE(*,*) 'b= '
READ(*,*) b

genau=.FALSE.

 101  IF (genau=.FALSE.) THEN
fa=f(a)
fb=f(b)
xx=(a+b)/2.D0
fx=f(xx)

IF (ABS(b-a)<genauigkeit) THEN
genau=.TRUE.
Bisektion=xx
ENDIF

IF (SGN(fa)==SGN(fx)) THEN
a=x
ELSE
b=x
ENDIF

ENDIF
GOTO 101

END FUNCTION Bisektion





FUNCTION Newton(f,df)

USE sonstiges
DOUBLE Newton
DOUBLE x0,x1
DOUBLE fa,fb,fx
LOGICAL genau

INTERFACE
FUNCTION f(x); DOUBLE f,x; END FUNCTION
END INTERFACE

INTERFACE
FUNCTION df(x); DOUBLE df,x; END FUNCTION
END INTERFACE


WRITE(*,*) 'Startwert eingeben'
WRITE(*,*) 'x0= '
READ(*,*) x0


genau=.FALSE.

 101    IF (genau=.FALSE.) THEN

x1=x0-(f(x0)/df(x0))


IF (ABS(x0-x1)<genauigkeit) THEN
genau=.TRUE.
Newton=x1
ENDIF

x0=x1

ENDIF
GOTO 101

END FUNCTION Newton








END
