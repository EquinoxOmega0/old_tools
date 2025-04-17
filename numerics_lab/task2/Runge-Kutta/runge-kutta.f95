! ################################################################
! ################################################################	
! ##														    ##
! ##                Runge-Kutta-Verfahren   				    ##
! ##															##
! ################################################################
! ################################################################
! Das Programm berechnet die numerische Lösung eines speziellen Systems
! von DGLs. Dazu wird das Runge-Kutta-Verfahren verwendet. Weiters wird
! das Ergebis auch mit der Analytischen Lösung verglichen.

!# Modul funtions: hier werden die rechten Seiten der DGLs berechnet
MODULE functions    
CONTAINS

! Funktion dRho: entspricht drho/dr und hängt von Radius r und Masse m ab
 FUNCTION dRho(r,m)
  IMPLICIT NONE
  DOUBLE PRECISION :: r,m
  DOUBLE PRECISION :: drho
!Abfrage ob Radius Null ist um Singularität zu vermeiden
   IF (r==0.D0) THEN
    drho=0.D0
   ELSE
    drho=-m/(r**2)
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



! Hauptprogramm rungekutta
PROGRAM rungekutta

! verwende das Modul functions
 USE functions

! Variablendeklaration
 IMPLICIT NONE
 DOUBLE PRECISION, DIMENSION(2,4) :: k  !array k sind Koeffizienten für Runge-Kutta Verfahren
 DOUBLE PRECISION :: deltar,anaroh,ananum ! Variable deltar ist die Schrittweite
! Variable anaroh wird für die analytische Berechnung der Dichte verwendet
! Variable ananum wird für den Unterschied zwischen numerischer und analytischen Ergebnis
 DOUBLE PRECISION :: dichte,masse,radius !die Variable dichte ist der Dichtenparameter des Differentialgleichungssystem
! die Variable masse ist der Massenparameter des DGLS
! Variable radius ist der Parameter Radius von dem die beiden DGL abhängen und nach dem integriert wird

!Anfangswerte für DGL
  masse=0.D0
  dichte=1.D0
  radius=0.D0


!Begrüssung und Eingabeauffoderung
  WRITE(*,*) 'Willkommen beim Lösen von DGLs mit dem RUNGE-Kutta-Verfahren!'
  WRITE(*,*)
  WRITE(*,*) 'Bitte geben Sie die gewünschte Schrittweite ein:'
!Einlesen der Schrittweite deltar
  READ(*,*) deltar

!Dateien erstellen und Header schreiben
  OPEN (200,FILE='nummain.dat', STATUS='UNKNOWN')
  OPEN (201,FILE='anamain.dat', STATUS='UNKNOWN')
  OPEN (202,FILE='nunanavgl.dat', STATUS='UNKNOWN')
 WRITE(*,*)
 WRITE(*,*) '     Radius     |       Dichte       |       Masse'
 WRITE(*,*) '___________________________________________________________'
 WRITE(*,*)
   WRITE(200,*) '     Radius     |       Dichte       |       Masse'
   WRITE(200,*) '___________________________________________________________'
   WRITE(200,*)
   WRITE(201,*) '     Radius     |       Dichte       '
   WRITE(201,*) '______________________________________'
   WRITE(201,*)

!Formatierungen für die Ausgabe
 301 FORMAT(2X,1P,E10.4,5X,'|',5X,0P,F10.7,5X,'|',3X,1P,E10.4)
 302 FORMAT(2X,1P,E10.4,5X,'|',5X,0P,F10.7,5X)
 303 FORMAT(2X,1P,E15.8)

!Schleife schrittweise Lösen des DGLS
 101 CONTINUE

!Berechnung der Koeffizienten des Runge-Kutta Verfahrens
  k(1,1)=deltar*dRho(radius,masse)
  k(2,1)=deltar*dm(radius,dichte)

  k(1,2)=deltar*dRho(radius+deltar/2.D0,masse+k(2,1)/2.D0)
  k(2,2)=deltar*dm(radius+deltar/2.D0,dichte+k(1,1)/2.D0)

  k(1,3)=deltar*dRho(radius+deltar/2.D0,masse+k(2,2)/2.D0)
  k(2,3)=deltar*dm(radius+deltar/2.D0,dichte+k(1,2)/2.D0)

  k(1,4)=deltar*dRho(radius+deltar,masse+k(2,3))
  k(2,4)=deltar*dm(radius+deltar,dichte+k(1,3))

! Berechnung der Dichte und Masse bei aktuellen Radius durch aufsummerieren der Koeffizienten
   dichte=dichte+k(1,1)/6.D0+k(1,2)/3.D0+k(1,3)/3.D0+k(1,4)/6.D0
   masse=masse+k(2,1)/6.D0+k(2,2)/3.D0+k(2,3)/3.D0+k(2,4)/6.D0

!Erhöhung des Radius um die Schrittweite 
  radius=radius+deltar

!Überprüfe Abbruchbedingung
  IF (dichte.GT.0.D0) THEN
  
!Ausgabe der Werte am Bildschirm und in Datei
   WRITE(*,301) radius,dichte,masse
   WRITE(200,301) radius,dichte,masse

! Berechnung des Analytischen Wertes für die Dichte
    IF (radius==0.D0) THEN
     anaroh=1.D0
    ELSE
     anaroh=SIN(radius)/radius
    ENDIF
! Ausgabe des Analytischen Wertes der Dichte bei derzeitigen Radius
   WRITE(201,302) radius,anaroh

! Berechnung und Ausgabe der Abweichung von numerischen und analytischen Wert (relativer Fehler)
   ananum=(anaroh-dichte)/anaroh
   WRITE(202,303) ananum



!Gehe wieder zum Anfang der Schleife
 GOTO 101
  ENDIF

!Dateien schließen
 CLOSE(200)
 CLOSE(201)
 CLOSE(202)

!Programm beendet
END