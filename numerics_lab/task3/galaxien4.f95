!Modul Para(meter) für "globale" Variablen
MODULE Para  
  IMPLICIT NONE
  !zeitout=Zeit für Ausgabe in Mill Jahren; zeit0=Startzeitpunkt/Endzeitpunkt(Rechnung ist symmetrisch); 
  !Rmin=Minimalabstand zwischen beiden Galaxien; M1=Masse der ersten Galaxie; M2=Masse der zweiten Galaxie;
  !k=Produkt der beiden Galaxienmassen; Mred=reduzierte Masse des 2. Körperproblems; 
  !l=Drehimpuls Wurzel(2*Rmin*(M1+M2)*Mred^2) ; zeit=aktuelle Zeit der Berechnung;
  !R1x,R1y,R2y,R2y= Koordinaten der beiden Galaxienzentren; genau=Genauigkeit der Nullstellen und DGL-Berechung;
  !distring=Abstand zwischen 2 Teilchenringen; soft=Softening Parameter; skald=Skalalänge der Galaxie; 
  !Wtot=Summe über alle statische Gewichte der Testteilchen
  DOUBLE PRECISION :: zeitout,zeit0,Rmin,M1,M2,k,Mred,l,zeit,R1x,R1y,R2x,R2y,genau,distring,soft,skald,Wtot
  !nring=Anzahl der Teilchenringe um Galaxie; npr=Anzahl der Teilchen pro Ring;
  !ngal=Anzahl der Galaxien mit Teilchen (1=nur eine, 2=beide); nnn=globale Übergabe des Schleifenindex für Teilchen; 
  !massfl= ist 1 wenn Massenfluss berechnet werden soll; massver= ist 1 wenn Massenverlust berechnet werden soll
  INTEGER :: nring,npr,ngal,nnn,massfl,massver
  !dynamisches Array zum Speichern der Minimalabstände der Teilchen zur anderen Galaxie
  DOUBLE PRECISION, ALLOCATABLE :: mindist(:)
  !dynamisches Array für nicht mehr an Galaxie gebundene Teilchen
  LOGICAL, ALLOCATABLE :: frei(:)
END MODULE 


!Modul für Funktionen für die optionalen Aufgabestellungen
MODULE Optionale
CONTAINS

!Funktion berechent den Massenfluss: eigentlich den Mindestabstand zur anderen Galaxie
SUBROUTINE massenfluss(dist1,dist2)
 USE Para
 IMPLICIT NONE
! dist1=Abstand von Teilchen zur ersten Galaxie; dist2=Abstand von Teilchen zur zweiten Galaxie
 DOUBLE PRECISION , INTENT(IN) :: dist1,dist2
! distanz=ist der für das jeweilige Teilchen benötigte Abstand zur jeweils anderen Galaxie
 DOUBLE PRECISION :: distanz
! Überprüft ob beiden Galaxien Testteilchen haben
  IF (ngal.EQ.2) THEN !wenn ja
    ! Überprüft anhand von Index zu welcher Galaxie das Testteilchen gehört
   IF (nnn.LE.(npr*nring)) THEN
    distanz=dist2
   ELSE
    distanz=dist1
   ENDIF

  ELSE !wenn nein
  ! dann muss der benötigte Abstand, der Abstand zur zweiten Galaxie sein
   distanz=dist2
  ENDIF
  ! Überprüft ob der jetzige Abstand kleiner ist als der bisher gespeicherte kleinste Abstand
  IF (distanz.LT.mindist(nnn)) THEN
    !Setze den aktuellen Abstand zum neuen kleinsten Abstand
   mindist(nnn)=distanz
  ENDIF

END SUBROUTINE


! Funktion berechnet die Summe von allen statistischen Gewichten der Testteilchen
SUBROUTINE mvwtot
 USE Para
 IMPLICIT NONE
! W=statistisches Gewicht; rcen=galaktozentrischer Abstand des Testteilchen
 DOUBLE PRECISION :: W,rcen
! ringnum="Nummer" des Ringes auf dem das Teilchen startet; i=Schleifenindex
 INTEGER :: ringnum,i

  Wtot=0
  ! Schleife über alle Testteilchen, Hinweis: falls der Massenverlust gefragt ist, ist ngal=1!
  DO i=1,(nring*npr)
   ! Berechnet "Nummer" des Ringes des Teilchen
   ringnum=((i-1)/npr)+1
   ! galaktozentrischen Abstand ermitteln
   rcen=distring*DBLE(ringnum)
   ! berechmet das statische Gewicht eines Teilchen
   W=EXP(-rcen/skald)*rcen*distring/DBLE(npr)
   ! summiert gleich für alle Teilchen auf
   Wtot=Wtot+W
  ENDDO

END SUBROUTINE


! Funktion ermittelt wann ein Testteilchen ungebunden wird - verloren geht
SUBROUTINE massenverlust(winkel,teilchen)
 USE Para
 USE nrtype
 IMPLICIT NONE
 !winkel=Ist der Winkel theta aus der Bewegungsgleichung der Galaxien
 DOUBLE PRECISION, INTENT(IN) :: winkel
 !Array mit Ort und Geschwindigkeit des gerade betrachteten Testteilchen
 REAL(SP), DIMENSION(6) :: teilchen
 !vgalx,vgaly= Geschwindigkeit der Galaxie 1; W=statistisches Gewicht; 
 !rcen=galaktozentrischer Abstand am Anfang der Berechnung; abstand=momentaner galaktozentrischer Abstand
 !geschw2=Geschwindigkeitsquadrat des Teilchens im Ruhesystem der Galaxie; 
 DOUBLE PRECISION :: vgalx,vgaly,W,rcen,abstand,geschw2
 !ringnum="Nummer" des Ringes auf dem das Teilchen startet;
 INTEGER :: ringnum
 ! Überprüft ob Teilchen noch gebunden ist
  IF (frei(nnn).EQV..FALSE.) THEN !falls ja

 ! Berechnet galaktozentrischen Abstand am Anfang der Berechnung
   ringnum=((nnn-1)/npr)+1
   rcen=distring*DBLE(ringnum)
 ! statisches Gewicht wird berechnet
   W=EXP(-rcen/skald)*rcen*distring/DBLE(npr)
 ! relatives statisches Gewicht
   W=W/Wtot
 ! Berechnung der Geschwindigkeit der Galaxie
   vgalx=DSIN(winkel)*Rmin*Mred*(k**2)/(l**3)
   vgaly=-((DCOS(winkel/2.D0))**2)*Rmin*2*Mred*(k**2)/(l**3)
  !Berechne Geschwindigkeitsquadrat des Testteilchen im Ruhesystem der Galaxie
   geschw2=((teilchen(4)-vgalx)**2)+((teilchen(5)-vgaly)**2)+(teilchen(6)**2)
  !Ermittle Abstand des Testteilchen vom Zentrum der Galaxie
   abstand=((teilchen(1)-R1x)**2)+((teilchen(2)-R1y)**2)+(teilchen(3)**2)
   abstand=DSQRT(abstand)
    !Überprüfe ob Teilchengeschwindigkeit größer als Fluchtgeschwindigkeit ist
    IF ((2.D0*M1/abstand).LT.geschw2) THEN
     !Bezeichne dieses Teilchen als frei 
     frei(nnn)=.TRUE.
     !Augabe von Teilchenindex, Zeitpunkt und relativen statistischen Gewicht des Teilchen 
     WRITE(208,*) nnn,zeitout,W
     
    ENDIF

   ENDIF
  
END SUBROUTINE


     
END MODULE




!Modul für Funktionen zur Bestimmung der Galaxienpostion und der Wechselwirkung
MODULE GalPos   
CONTAINS 

!Funktion für odeint-> Enthält, das zu lösende System von Differentialgleichungen
SUBROUTINE derivs(x,y,dydx)
 USE nrtype
 USE Para
 USE nrlib
 USE Optionale
 IMPLICIT NONE
 !Variable nach der abgeleitet wird
 REAL(SP), INTENT(IN) :: x
 !Array von Variablen die abgleitet werden
 REAL(SP), DIMENSION(:), INTENT(IN) :: y
 !Ableitungen von y-Array nach x
 REAL(SP), DIMENSION(:), INTENT(OUT) :: dydx
 !dist1=Abstand zur ersten Galaxie; dist2=Abstand zur zweiten Galaxie; 
 !theta=Parameter in der Bewegungsgleichung für die Galaxien
 DOUBLE PRECISION dist1,dist2,theta
 !definiere die Zeit als x
  zeit=x
 !Berechne theta bei akuteller Zeit
  theta = rtsafe(func5,-PI_D,PI_D,genau)
  ! Berechne die Positionen der Galaxien  
   CALL Posi(theta,R1x,R1y,R2x,R2y)
   ! setze die ersten Teil des DGL-Systems
  dydx(1) = y(4)  
  dydx(2) = y(5) 
  dydx(3) = y(6)
  ! Berechne die Abstände des Testteilchen zu den Galaxien + Softeningparameter
  dist1=DSQRT(((y(1)-R1x)**2)+((y(2)-R1y)**2)+((y(3))**2)+(soft**2))
  dist2=DSQRT(((y(1)-R2x)**2)+((y(2)-R2y)**2)+((y(3))**2)+(soft**2))
  ! Checken ob Massenfluss gefragt ist
   IF (massfl.EQ.1) THEN
  ! Wenn ja, führe die entsprechende Prozedur aus
    CALL massenfluss(dist1,dist2) 
   ENDIF
  ! Berechne Beschleunigungen gemäß Newton'schen Gravitationsgesetz
  dydx(4) = -((M1*(y(1)-R1x))/(dist1**3)+(M2*(y(1)-R2x))/(dist2**3))
  dydx(5) = -((M1*(y(2)-R1y))/(dist1**3)+(M2*(y(2)-R2y))/(dist2**3)) 
  dydx(6) = -((M1*(y(3)))/(dist1**3)+(M2*(y(3)))/(dist2**3))

END SUBROUTINE derivs




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
   IF (qcos.EQ.-1.D0) THEN
    qcos=-1.D0+1.D-8
   ENDIF
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






! Hauptprogramm
PROGRAM galaxien
 USE nr
 USE nrtype
 USE nrutil
 USE Para
 USE GalPos
 USE nrlib
 USE ode_path
 USE ausgabe
 USE Optionale
 IMPLICIT NONE
 !hzeit=Zeit am Ende der einzelen Bahnintegration; ahzeit=Zeit am Anfang der einzelen Bahnintegration;
 !printst=Ausgabeschrittweite; rottheta1,rotphi1,rottheta2,rotphi2= Winkel um die die Scheiben gedreht werden
 DOUBLE PRECISION :: hzeit,ahzeit,printst,rottheta1,rotphi1,rottheta2,rotphi2
 !Rstart=Abstand zwischen den Galaxien am Anfang der Berechnung; theta= Winkel vom Nullpunkt zur Galaxie; 
 !t1=Computerzeit am Anfang der Berechnung; t2=Computerzeit am Ende der Berechnung; 
 !h1,hmin=Parameter für Odeint; hnext=optimierte Schrittweite von Odeint für ein Teilchen
 DOUBLE PRECISION :: Rstart,theta,t1,t2,h1,hmin,hnext
 !testbody=Array in dem Koordinaten und Geschwindigkeiten der Testteilchen gespeichert sind;
 !orte=Array in dem die Koordinaten im Format für die spezielle Ausgabeprozedure gespeichert werden
 DOUBLE PRECISION, ALLOCATABLE :: testbody(:,:),orte(:,:)
 ! Array speichert optimale Schrittweite für Testteilchen
 DOUBLE PRECISION, ALLOCATABLE :: hopti(:)
 ! Array für die jeweils aktuellen Startwerte und Ergebnisse der Bahnintegration eines Testteilchen
 REAL(SP), DIMENSION(6) :: ystart
 !i,ii,iii=Schleifenvariablen; hilf=Hilfsvariable; inputfile=ist 1 wenn von Inputfile gelesen wird
 !rotsinn=gibt Rotationssinn der Scheiben an; 1=normal, alles andere retrograd
 INTEGER i,ii,iii,hilf,inputfile,rotsinn
 ! Drehmatrizen für beide Galaxien
 DOUBLE PRECISION , DIMENSION(3,3):: rotmatrix1,rotmatrix2
 ! Array aus Orts und Geschwindsvektor von dem jeweils 3 Komponenten rotiert werden
 DOUBLE PRECISION , DIMENSION(6) :: hrotvek
 !damit beide Funktionen richtig verwendet werden können, müssen sie external deklariert sein
 EXTERNAL derivs
 EXTERNAL func5 
! Begrüßung
  WRITE(*,*) 'Galaxienwechselwirkung'
  WRITE(*,*)
  !Auswahl ob Input-File oder Direkteingabe
  WRITE(*,*) 'Wollen Sie die Parameter von einer Eingabedatei einlesen (1) oder direkt eingeben (2)?'
  READ(*,*) inputfile

!Checke ob Input-File ausgewählt
   IF (inputfile.EQ.1) THEN !wenn Inputfile

!Öffne input.dat und Lese Parameter ein
    OPEN (299,FILE='input.dat', STATUS='OLD')

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
     READ(299,*) rotsinn
	 READ(299,*) 
	 READ(299,*) genau
	 READ(299,*) 
	 READ(299,*) soft
	 READ(299,*) 
	 READ(299,*) printst
	 READ(299,*) 
	 READ(299,*) rottheta1
	 READ(299,*)
	 READ(299,*) rotphi1
	 READ(299,*)
	 READ(299,*) rottheta2
	 READ(299,*)
	 READ(299,*) rotphi2
	 READ(299,*)
	 READ(299,*) massfl
	 READ(299,*)
	 READ(299,*) massver
	 READ(299,*)
	 READ(299,*) skald

	CLOSE(299)
    ! Bestätige Einlesevorgang
	WRITE(*,*)
	WRITE(*,*) 'Werte aus Datei eingelesen'
	WRITE(*,*)

   ELSE ! wenn Direkteingabe
     
!Fordere zur Eingabe auf und lese die Parameter ein
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
	WRITE(*,*) 'Geben sie (1) für normale Rotationssinn ein:'
	READ(*,*) rotsinn    
	WRITE(*,*) 'Geben Sie die gewünschte Genauigkeit an:'
	READ(*,*) genau
	WRITE(*,*) 'Geben Sie den Softening-Parameter(in kpc) ein:'
	READ(*,*) soft
	WRITE(*,*) 'Ausgabeschrittweite(in Mill Jahren):'
	READ(*,*) printst
	WRITE(*,*) 'Galaxie1 drehen um Winkel Theta[°]:'
	READ(*,*) rottheta1
	WRITE(*,*) 'Galaxie1 drehen um Winkel Phi[°]:'
	READ(*,*) rotphi1
	WRITE(*,*) 'Galaxie2 drehen um Winkel Theta[°]:'
	READ(*,*) rottheta2
	WRITE(*,*) 'Galaxie2 drehen um Winkel Phi[°]:'
	READ(*,*) rotphi2
	WRITE(*,*) 'Wollen Sie den Mindestabstand zur anderen Galaxie für den Massenfluss berechnen (1=Ja):'
	READ(*,*) massfl
	WRITE(*,*) 'Wollen Sie den Massenverlust berechnen (1=Ja):'
	READ(*,*) massver
    
	skald=0.D0
    !Skalenlänge wird nur für Massenverlust benötigt, daher nur falls Massenverlust auf ja einlesen
	 IF (massver.EQ.1) THEN
	  WRITE(*,*) 'Geben Sie den Skalenradius der Galaxie an:'
	  READ(*,*) skald
	 ENDIF


   ENDIF

! Falls der Massenverlust berechnet werden soll, dann soll nur eine Galaxie Testpartikel haben
   IF (massver.EQ.1) THEN
	ngal=1
   ENDIF

!Hole die Computerzeit jetzt
   CALL CPU_TIME(t1)
   
!Öffne und erstelle alle benötigten Dateien
  OPEN (200,FILE='4galpos1.dat', STATUS='UNKNOWN')
  OPEN (201,FILE='4galpos2.dat', STATUS='UNKNOWN')
  OPEN (210,FILE='4galinput.dat', STATUS='UNKNOWN')
  OPEN (207,FILE='mindist.dat', STATUS='UNKNOWN')
  OPEN (208,FILE='verlust.dat', STATUS='UNKNOWN')
  OPEN (206,FILE='kbaw.dat', STATUS='UNKNOWN')
   
!hilf ist hier die Anzahl der Testpartikel
  hilf=nring*npr*ngal
   
!Fixiere die Größe der dynamischen Arrays
  ALLOCATE(testbody(6,hilf))
  ALLOCATE(hopti(hilf))
  ALLOCATE(mindist(hilf))
  ALLOCATE(orte(hilf,3))
  ALLOCATE(frei(hilf))

   DO i=1,hilf 
!Berechnet einen Wert für den Mindestabstand, der größer ist als alle möglichen wirklichen Mindestabstände
	mindist(i)=RStart+2.D0*distring*nring
! Setzte alle Teilchen auf gebunden
	frei(i)=.FALSE.
   ENDDO

!Schreibt Parameter für die Berechnung in eine Datei (nur zur Dokumentation)
  WRITE(210,*) 'M1= ',M1
  WRITE(210,*) 'M2= ',M2
  WRITE(210,*) 'RStart= ',RStart
  WRITE(210,*) 'Rmin= ',Rmin
  WRITE(210,*) 'Galaxien mit Testpartikel= ',ngal
  WRITE(210,*) 'Anzahl der Ringe= ',nring
  WRITE(210,*) 'Ringabstand= ',distring
  WRITE(210,*) 'Partikel pro Ring= ',npr
  WRITE(210,*) 'Rotationssinn= ',rotsinn
  WRITE(210,*) 'Genauigkeit= ',genau
  WRITE(210,*) 'Ausgabeschrittweite= ',printst
  WRITE(210,*) 'theta1= ',rottheta1
  WRITE(210,*) 'phi1= ',rotphi1
  WRITE(210,*) 'theta2= ',rottheta2
  WRITE(210,*) 'phi2= ',rotphi2
  WRITE(210,*) 'Massenfluss= ',massfl
  WRITE(210,*) 'Massenverlust= ',massver
  WRITE(210,*) 'Sklarenradius= ',skald

! Wandelt Schrittweite von Mill Jahren in Systemeinheiten um
  printst=printst/1.49D0

! Setzt Startwerte
  h1   = 0.01D0
  hmin = 0.D0

! Wandelt Winkel von Grad in Radiant um
  rottheta1=rottheta1*PI_D/180.D0
  rotphi1=rotphi1*PI_D/180.D0
  rottheta2=rottheta2*PI_D/180.D0
  rotphi2=rotphi2*PI_D/180.D0

! Berechent die Elemente der Drehmatrizen für die Scheiben
  rotmatrix1(1,1)=DCOS(rottheta1)*DCOS(rotphi1)
  rotmatrix1(1,2)=-DSIN(rotphi1)
  rotmatrix1(1,3)=DSIN(rottheta1)*DCOS(rotphi1)

  rotmatrix1(2,1)=DCOS(rottheta1)*DSIN(rotphi1)
  rotmatrix1(2,2)=DCOS(rotphi1)
  rotmatrix1(2,3)=DSIN(rottheta1)*DSIN(rotphi1)

  rotmatrix1(3,1)=-DSIN(rottheta1)
  rotmatrix1(3,2)=0
  rotmatrix1(3,3)=DCOS(rottheta1)

  rotmatrix2(1,1)=DCOS(rottheta2)*DCOS(rotphi2)
  rotmatrix2(1,2)=-DSIN(rotphi2)
  rotmatrix2(1,3)=DSIN(rottheta2)*DCOS(rotphi2)

  rotmatrix2(2,1)=DCOS(rottheta2)*DSIN(rotphi2)
  rotmatrix2(2,2)=DCOS(rotphi2)
  rotmatrix2(2,3)=DSIN(rottheta2)*DSIN(rotphi2)

  rotmatrix2(3,1)=-DSIN(rottheta2)
  rotmatrix2(3,2)=0
  rotmatrix2(3,3)=DCOS(rottheta2)
  
	! Setze Startwert für hopti
   DO i=1,hilf
	hopti(i)=h1
   ENDDO
  
! Berechne die Systemzeit für den Rechenbeginn
  theta=DACOS(2.D0*Rmin/Rstart-1.D0)
  Mred=M1*M2/(M1+M2)
  k=M1*M2
  l=DSQRT(2.D0*Rmin*(M1+M2))*Mred
  zeit0=(l**3)/(2.D0*Mred*k**2)*(DTAN(theta/2.D0)+((DTAN(theta/2.D0))**3)/3.D0)
  hzeit=-zeit0

! Ermittle die Startkoordianten der Galaxien
  R1x=-M2/(M1+M2)*Rstart*DCOS(theta)
  R1y=M2/(M1+M2)*Rstart*DSIN(theta)
  R2x=M1/(M1+M2)*Rstart*DCOS(theta) 
  R2y=-M1/(M1+M2)*Rstart*DSIN(theta)  


! Schaue ob mind. Eine Galaxie mit Testteilchen bestückt werden soll    
   IF (ngal.GT.0) THEN !falls ja

	DO i=1,npr
	 DO ii=1,nring
! Setze alle Testteilchen für die erste Galaxie auf Kreisbahnen(mit entsprechender Geschwindigkeit     
	  testbody(1,i+(ii-1)*npr)=distring*DBLE(ii)*DCOS(2.D0*PI_D/DBLE(npr)*DBLE(i))
	  testbody(2,i+(ii-1)*npr)=distring*DBLE(ii)*DSIN(2.D0*PI_D/DBLE(npr)*DBLE(i))
	  testbody(3,i+(ii-1)*npr)=0
	  testbody(4,i+(ii-1)*npr)=-DSQRT(M1/(distring*DBLE(ii)))*DSIN(2.D0*PI_D/DBLE(npr)*DBLE(i))
	  testbody(5,i+(ii-1)*npr)=DSQRT(M1/(distring*DBLE(ii)))*DCOS(2.D0*PI_D/DBLE(npr)*DBLE(i))
	  testbody(6,i+(ii-1)*npr)=0
     
	 ENDDO  
	ENDDO 

  hilf=nring*npr

!Drehe die Scheibe erste Galaxie mit der dazugehörigen Drehmatrix

   DO iii=1,(hilf)
	DO i=1,3
    !Drehe Positionen
	 hrotvek(i)=0
     
	  DO ii=1,3
      
	   hrotvek(i)=hrotvek(i)+rotmatrix1(i,ii)*testbody(ii,iii)
       
	  ENDDO
	ENDDO

	DO i=1,3
    !Drehe Geschwindigkeiten
     hrotvek(i+3)=0
     
	  DO ii=1,3
      
	   hrotvek(i+3)=hrotvek(i+3)+rotmatrix1(i,ii)*testbody(ii+3,iii)
       
      ENDDO
    ENDDO
 
    DO i=1,6
      
     testbody(i,iii)=hrotvek(i)
     
    ENDDO
    
	! mit rotsinn<>1 ändere Drehsinn
    IF (rotsinn.NE.1) THEN
	 DO i=4,6
	  testbody(i,iii)=-testbody(i,iii)
     ENDDO
    ENDIF
    
   ENDDO

    	


   DO i=1,hilf
    !Verschiebe die Scheibe zum Ort der ersten Galaxie 
    testbody(1,i)=testbody(1,i)+R1x
    testbody(2,i)=testbody(2,i)+R1y
    testbody(3,i)=testbody(3,i)
    !Addiere die Geschwindigkeit der Galaxie zu den Teilchengeschwindigkeiten
    !Teilchen bewegen sich nun im Ruhesystem der Galaxie auf Kreisbahnen
    testbody(4,i)=testbody(4,i)-M2/(M1+M2)*DSIN(theta)*Rmin*Mred*(k**2)/(l**3)
    testbody(5,i)=testbody(5,i)-M2/(M1+M2)*((DCOS(theta/2.D0))**2)*Rmin*2*Mred*(k**2)/(l**3)
    testbody(6,i)=testbody(6,i)

   ENDDO

   ENDIF

! Überprüfe ob auch die zweite Galaxie eine Testteilchenscheibe hat
   IF (ngal.EQ.2) THEN !Wenn ja

    DO i=1,npr
     DO ii=1,nring
  !Setze alle Testteilchen für die zweite Galaxie auf Kreisbahnen(mit entsprechender Geschwindigkeit      
	  testbody(1,i+(ii-1)*npr+npr*nring)=distring*DBLE(ii)*DCOS(2.D0*PI_D/DBLE(npr)*DBLE(i))
	  testbody(2,i+(ii-1)*npr+npr*nring)=distring*DBLE(ii)*DSIN(2.D0*PI_D/DBLE(npr)*DBLE(i))
	  testbody(3,i+(ii-1)*npr+npr*nring)=0
	  testbody(4,i+(ii-1)*npr+npr*nring)=-DSQRT(M2/(distring*DBLE(ii)))*DSIN(2.D0*PI_D/DBLE(npr)*DBLE(i))
	  testbody(5,i+(ii-1)*npr+npr*nring)=DSQRT(M2/(distring*DBLE(ii)))*DCOS(2.D0*PI_D/DBLE(npr)*DBLE(i))
	  testbody(6,i+(ii-1)*npr+npr*nring)=0
      
	 ENDDO  
 	ENDDO 

!Drehe die Scheibe zweiten Galaxie mit der dazugehörigen Drehmatrix

	DO iii=((nring*npr)+1),((nring*npr*2))
	
	 DO i=1,3
    !Drehe Positionen  
      hrotvek(i)=0
      
	   DO ii=1,3
       
        hrotvek(i)=hrotvek(i)+rotmatrix2(i,ii)*testbody(ii,iii)
        
 	   ENDDO
     ENDDO

     DO i=1,3
    !Drehe Geschwindigkeiten     
  	  hrotvek(i+3)=0
      
       DO ii=1,3
         
		hrotvek(i+3)=hrotvek(i+3)+rotmatrix2(i,ii)*testbody(ii+3,iii)
        
 	   ENDDO
     ENDDO
 
     DO i=1,6
      testbody(i,iii)=hrotvek(i)
     ENDDO

	! mit rotsinn<>1 ändere Drehsinn
    IF (rotsinn.NE.1) THEN
	 DO i=4,6
	  testbody(i,iii)=-testbody(i,iii)
     ENDDO
    ENDIF
  
    ENDDO

    DO i=1,(nring*npr)
    !Verschiebe die Scheibe zum Ort der zweiten Galaxie   
	 testbody(1,i+npr*nring)=testbody(1,i+npr*nring)+R2x
	 testbody(2,i+npr*nring)=testbody(2,i+npr*nring)+R2y
	 testbody(3,i+npr*nring)=testbody(3,i+npr*nring)
    !Addiere die Geschwindigkeit der Galaxie zu den Teilchengeschwindigkeiten
    !Teilchen bewegen sich nun im Ruhesystem der Galaxie auf Kreisbahnen
	 testbody(4,i+npr*nring)=testbody(4,i+npr*nring)+M1/(M1+M2)*DSIN(theta)*Rmin*Mred*(k**2)/(l**3)
	 testbody(5,i+npr*nring)=testbody(5,i+npr*nring)+M1/(M1+M2)*((DCOS(theta/2.D0))**2)*Rmin*2*Mred*(k**2)/(l**3)
	 testbody(6,i+npr*nring)=testbody(6,i+npr*nring)
     
    ENDDO

   ENDIF

   ! Schaue ob Massenverlust berechnet werden soll  
   IF (massver.EQ.1) THEN  !falls ja
   ! die Summe von allen statistischen Gewichten der Testteilchen 
	CALL mvwtot
    
   ENDIF

 ! Setzte Orte-Array auf Anfangsorte der Testteilchen
   DO i=1,(ngal*npr*nring) 
	DO ii=1,3

	 orte(i,ii)=testbody(ii,i)

	ENDDO
   ENDDO

!Starte besondere Ausgabeprozedure und gib Anfangsorte aus
   CALL outbod(0,1,(nring*npr),(nring*npr*(ngal-1)),(nring*npr*ngal),(hzeit*1.49D0),orte)


! Hauptschleife der Programms, läuft bis die Galaxien ihre Parabel symetrisch durchflogen haben
   101 CONTINUE
   !Zeit für Anfang von Integration
	ahzeit=hzeit
   !Zeit für Ende von Integration
	hzeit=hzeit+printst
   !Zeit für Ausgabe in Mill Jahren
	zeitout=hzeit*1.49D0

   !Rechne für alle Testteilchen
	 DO i=1,(nring*npr*ngal)
   ! Setze die Schrittweite für Odeint auf die optimierte Schrittweite der vorherigen Berechnung
	  h1=hopti(i)
    ! gib den Schleifenindex auch an globale Variable nnn weiter für andere Prozeduren
     nnn=i
    !Setzt die Startwerte für Odeint auf Werte des Testteilchen  
	  ystart(1)=testbody(1,i)
	  ystart(2)=testbody(2,i)
	  ystart(3)=testbody(3,i)
	  ystart(4)=testbody(4,i)
	  ystart(5)=testbody(5,i)
	  ystart(6)=testbody(6,i)
     ! Führe die Bahnintegration für ein Testteilchen aus
	   CALL odeint(ystart,ahzeit,hzeit,genau,h1,hmin,derivs,rkqs,hnext)
     !Gib das Ergebnis von Odeint wieder auf die Testteilchen zurück 
	  testbody(1,i)=ystart(1)
	  testbody(2,i)=ystart(2)
	  testbody(3,i)=ystart(3)
	  testbody(4,i)=ystart(4)
	  testbody(5,i)=ystart(5)
	  testbody(6,i)=ystart(6)
      !definiere die neue optimierte Schrittweite
	  hopti(i)=hnext

	!Checke ob Massenverlust berechnet werden soll
	   IF (massver.EQ.1) THEN  ! wenn ja
		! Setze die aktuelle Zeit auf die globale Variable zeit
		zeit=hzeit
        ! Berechne den aktullen Winkelparameter für Galaxienpostitonen
		theta = rtsafe(func5,-PI_D,PI_D,genau)
        ! Berechne die Galaxienpositionen
		 CALL Posi(theta,R1x,R1y,R2x,R2y)
        ! Berechne den Massenverlust
		 CALL massenverlust(theta,ystart)

	   ENDIF

     !Gib die Postitonen der Testteilchen auf Ausgabe-array orte weiter
	  orte(i,1)=testbody(1,i)
	  orte(i,2)=testbody(2,i)
	  orte(i,3)=testbody(3,i)
      
	 ENDDO  

	!gib Postitionen der Testteilchen mit besonderer Ausgabeprozedur aus
	 CALL outbod(1,1,(nring*npr),(nring*npr*(ngal-1)),(nring*npr*ngal),zeitout,orte)

	!Schreibe die aktuelle Rechenzeit auf den Bildschirm
	WRITE (*,*) zeitout
    !Gib die Postition der Galaxien aus
	WRITE (200,*) zeitout,R1x,R1y
	WRITE (201,*) zeitout,R2x,R2y
    
   ! Überprüfe ob Abbruchbedingung noch nicht erreicht
  IF (hzeit.LT.zeit0) THEN ! wenn nein
     ! gehe wieder zum Schleifenanfang
   GOTO 101
      
  ENDIF

! Schreibe die Mindestabstände heraus
   DO i=1,(ngal*npr*nring)

	WRITE(207,*) mindist(i)
    
   ENDDO
   
! Beende die besondere Ausgabeprozedur
   CALL outbod(2,1,(nring*npr),(nring*npr*(ngal-1)),(nring*npr*ngal),zeitout,orte)
   
! Hole Computerzeit jetzt
   CALL CPU_TIME(t2)
 !Berechne für Berechnung benötigte Computerzeit
  t2=t2-t1
  ! gebe benötigte Computerzeit aus
  WRITE(*,*) 'CPU-Zeit: ',t2
  WRITE(210,*) 'CPU-Zeit: ',t2
! Schließe alle Dateien
  CLOSE(200)
  CLOSE(201)
  CLOSE(206)
  CLOSE(207) 
  CLOSE(208)  
  CLOSE(210) 
  
! Hauptprogramm Ende
END PROGRAM galaxien