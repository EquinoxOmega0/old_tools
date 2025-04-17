      PROGRAM tabelle
      DOUBLE PRECISION f(0:100),x(0:100)
      INTEGER i
      
      DO 100 i=0,100
      x(i)=1.D0*i/10.D0
      f(i)=EXP(-x(i))-0.D1/(1.D0+x(i))
100   CONTINUE

      OPEN(20,FILE='output2.dat',STATUS='unknown')
      WRITE(20,*) '   x       f(x)    |       x       f(x)  '
      WRITE(20,*) '_________________________________________'
      
      DO 110 i=0,49
      WRITE(20,200) x(i*2), f(i*2), x((i*2)+1), f((i*2)+1)
200   FORMAT(1X,F5.1,2X,E10.4,2X,'|',4X,F5.1,2X,E10.4)
110   CONTINUE

      WRITE(20,201) x(100), f(100)
201   FORMAT(1X,F5.1,2X,E10.4,2X,'|')

      CLOSE(20)
      
      END