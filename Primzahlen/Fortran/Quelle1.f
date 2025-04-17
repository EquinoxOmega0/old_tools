      integer a,i,e,max
      
      print*,'h”chste Zahl eingeben'
      read*,max
      
      open(unit=11,file='ergebnis.txt',status='unknown')
      do 100 i=2,max
      a=0
      do 200 e=2,i-1
      if (MOD(i,e)==0) then
      a=a+1
      end if
200   continue
      if (a==0) then
      write(11,*) i
      print*, i
      end if
100   continue
      close(11)
      stop
      end
