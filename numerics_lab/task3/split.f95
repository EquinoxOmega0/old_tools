!Programm zur Zusammenführung von Daten aus zwei verschiedenen Runs
PROGRAM split
IMPLICIT NONE
!nring=Anzahl der Ringe, npr=Anzahl der Teilchen pro Ring, partnr=Gesamtanzahl der Teilchen, i,j,k,l=Indizes, x=Abbruchkriterium, count,count2=Zähler
INTEGER :: nring, npr, partnr, i, j, k, l, x, count, count2
!Koordinatenarrays
DOUBLE PRECISION, ALLOCATABLE :: pos1(:,:), pos2(:,:)
!Zeit bei Ausgabe
DOUBLE PRECISION :: tnow

!Öffnen des input-files um nring, npr auszulesen
OPEN(110, FILE='input.dat', STATUS='OLD')
	 READ(110,*) 
     READ(110,*) !M1
     READ(110,*) 
 	 READ(110,*) !M2
 	 READ(110,*) 
  	 READ(110,*) !Rstart
	 READ(110,*) 
	 READ(110,*) !Rmin
	 READ(110,*) 
	 READ(110,*) !ngal
	 READ(110,*) 
	 READ(110,*) nring
	 READ(110,*) 
	 READ(110,*) !distring
	 READ(110,*) 
	 READ(110,*) npr
CLOSE(110)

partnr=nring*npr

!Arraygröße definieren
ALLOCATE(pos1(partnr,3))
ALLOCATE(pos2(partnr,3))

!Ausgabedatei des runs mit prograder Rotation, Daten werden ans Ende angefügt
OPEN(111, FILE='outbopro.asc', STATUS='APPEND')
!Ausgabedatei des runs mit retrograder Rotation, Daten werden ans Ende angefügt
OPEN(211, FILE='outbore.asc', STATUS='APPEND')
!beliebige Zahl, dient als Abbruchkriterium, um EoF-Errors zu verhindern
WRITE(111,*) "10000000"
WRITE(211,*) "10000000"
CLOSE(111)
CLOSE(211)

!erneutes Öffnen des Files, diesmal mit sequentiellem Zugriff
OPEN(111, FILE='outbopro.asc', STATUS='OLD')
!erstellen zweier neuer (Hilfs-)Dateien, die die Positionsdaten der Teilchen für Galaxie1 bzw 2 enthalten sollen
OPEN(122, FILe='outgal1pro.asc', STATUS='UNKNOWN')
OPEN(133, FILE='outgal2pro.asc', STATUS='UNKNOWN')
!erstellen einer Zeittabelle, die die Bildnummer für die gnuplot-Routine mit der wahren Zeit in My verknüpft
OPEN(100, FILE='time.asc', STATUS='UNKNOWN')

count=0
count2=0

!Schleife zum auslesen und schreiben der Daten aus dem ersten Durchlauf
DO
count2=count2+1   
!Auslesen aus dem ausgabefile des prograden Durchlaufs
READ(111,*) x
	!Abbruch, falls an erster Stelle eines Blocks NICHT die Teilchenzahl steht 
    !(deshalb vorheriges Einfügen einer beliebigen Zahl)
	IF (x.NE.(partnr*2)) EXIT
READ(111,*)
READ(111,*) tnow
!erstellen der Zeittabelle, muss nur einmal gemacht werden, da die Zeitpunkte bei beiden runs gleich sind
WRITE(100,*) count2, tnow
	!Schleifen zum Auslesen der Positionsarrays und Schreiben in getrennte Files, nach zugehöriger Galaxie
	DO i=1,partnr
	READ(111,*) (pos1(i,j),j=1,3)
    WRITE(122,*) (pos1(i,j),j=1,3)
    count=count+1
    END DO
    DO k=1,partnr
	READ(111,*) (pos2(k,l),l=1,3)
    WRITE(133,*) (pos2(k,l),l=1,3)
    END DO
END DO
!Schließen und Öffnen der Hilfsfiles, um beim nächsten Zugriff am Anfang des Files zu stehen
CLOSE(122)
CLOSE(133)
OPEN(122, FILE='outgal1pro.asc', STATUS='UNKNOWN')
OPEN(133, FILE='outgal2pro.asc', STATUS='UNKNOWN')


!gleiche Prozedur wie oben für den ersten Durchlauf, diesmal für die Berechnung mit retrograder Rotation
OPEN(211, FILE='outbore.asc', STATUS='OLD')
OPEN(222, FILe='outgal1re.asc', STATUS='UNKNOWN')
OPEN(233, FILE='outgal2re.asc', STATUS='UNKNOWN')


DO 
READ(211,*) x
	IF (x.NE.(partnr*2)) EXIT
READ(211,*)
READ(211,*) 
	DO i=1,partnr
	READ(211,*) (pos1(i,j),j=1,3)
    WRITE(222,*) (pos1(i,j),j=1,3)
    END DO
    DO k=1,partnr
	READ(211,*) (pos2(k,l),l=1,3)
    WRITE(233,*) (pos2(k,l),l=1,3)
    END DO
END DO
CLOSE(222)
CLOSE(233)
OPEN(222, FILe='outgal1re.asc', STATUS='UNKNOWN')
OPEN(233, FILE='outgal2re.asc', STATUS='UNKNOWN')

!erstellen eines endgültige Ausgabefiles, im Format für Gnuplot-Auswertung
OPEN(444, FILE='test.bin.asc', STATUS='UNKNOWN')

!Schleife zum Auslesen aus Hilfsdateien, und Schreiben in neues Ausgabefile
DO k=1,(count/partnr)
  !Platzhalter um Format für Gnuplot-Ausgabe zu bewahren
  WRITE(444,*) "."
  WRITE(444,*) "."
  WRITE(444,*) "."
  	!Lesen aus den files für 1.Galaxie, 1.run und 2.Galaxie, 2.run
    !schreiben in Ausgabedatei
	DO i=1,partnr
  READ(122,*) (pos1(i,j),j=1,3)
  WRITE(444,*) (pos1(i,j),j=1,3)
  READ(233,*) (pos1(i,j),j=1,3)
  WRITE(444,*) (pos1(i,j),j=1,3)
  END DO
END DO


CLOSE(111)
CLOSE(122)
CLOSE(133)
CLOSE(211)
CLOSE(222)
CLOSE(233)
CLOSE(444)

END PROGRAM split