!  *******************  Genauigkeitsparameter  ************************
MODULE param
!beinhaltet den Genauigkeitsparameter
DOUBLE PRECISION, PARAMETER :: eps=1.D-4
END MODULE

MODULE functions    !beinhaltet Testfunktionen und deren Ableitungen
CONTAINS
  FUNCTION f1(x) 
      DOUBLE PRECISION :: f1,x
      f1=x**3-5.D0*x**2+100.D0*x-400.D0
  END FUNCTION f1
  FUNCTION f2(x)
      DOUBLE PRECISION :: f2,x
      f2=EXP(-x)-0.1D0/(1.D0+x)
  END FUNCTION f2
  FUNCTION df1(x)
      DOUBLE PRECISION :: df1,x
      df1=3*x**2-10.D0*x+100.D0
  END FUNCTION df1
  FUNCTION df2(x)
      DOUBLE PRECISION :: df2,x
      df2=-EXP(-x)-0.1D0*LOG(1.D0+x)
  END FUNCTION df2
    !umgewandelte Funktionen fuer das Fixpunktverfahren
FUNCTION gf1(x)
	DOUBLE PRECISION:: gf1,x
    gf1=4.D0+0.05D0*x**2-0.01D0*x**3
END FUNCTION
FUNCTION gf2(x)
	DOUBLE PRECISION gf2,x
    gf2=0.1D0*EXP(x)-1.D0
  END FUNCTION
END MODULE


! ***********************  METHODEN ZUR NULLSTELLENSUCHE  **********************

MODULE methods !beinhaltet die verschiedenen Methoden
CONTAINS



! *************************   BISEKTION   **************************************
! *    a,b ... Intervallgrenzen                                                *
! *    x ... Nullstelle                                                        *
! *    f ... Testfunktion                                                      *
! *    steps ... Anzahl der Schritte bis zur vorgegebenen Genauigkeit          *
! *    ausgabe ... Dateiname des Ausgabefiles                                  *
! ******************************************************************************

SUBROUTINE bisec(a,b,x,f,steps,ausgabe) 
    !macht Inhalte der Module param und functions in der subroutine verfuegbar:
  USE param
  USE functions
  
    !Dummy-Funktionen und -Argumente: 
  INTERFACE
       FUNCTION f(t)
          DOUBLE PRECISION :: f,t
       END FUNCTION
  END INTERFACE
      
  DOUBLE PRECISION :: a, b, x
  INTEGER :: steps, sgnfa, sgnfx   !Anzahl Schritte, Vorzeichen f(a), Vorzeichen f(x)
  CHARACTER(16) :: ausgabe          !definiert ein im Hauptprogramm spezifiziertes Ausgabefile
  
  OPEN (100,FILE=ausgabe, STATUS='UNKNOWN')
  steps=0
  
  WRITE(100,'(A21,F6.3,A5,F6.3)' ) "Intervallgrenzen: a= ", a, ", b= ", b
  WRITE(100,'(A30)') "---------------------------------------------------------------------------------------------------"
  WRITE(100, '(A5,A20,A25)') "steps", "x", "f(x)"    !Bezeichnung der Spalten

    x=(a+b)/2.D0                   !Initialisierung von x wegen Berechnung der logischen Abfrage unten
  
    !Schleife zur iterativen Berechnung der Nullstelle: 
  DO WHILE (ABS(f(x)).GT.eps)      !solange bis der Funktionswert an der Stelle 
                                   !der berechneten Nullstelle kleiner als die vorgebenene Genauigkeit ist
     
	 x=(a+b)/2.D0                  !BISEKTIONSALGORITHMUS
     
     WRITE(100, '(I5,F20.16,E25.16E2)') steps, x, f(x)   !Ausgabe in Datei
     WRITE(*, *) steps, x, f(x)                          !Ausgabe auf Bildschirm

   
     !ueberpruefen, auf welcher Seite die Nullstelle liegt, mangels SGN-Funktion etwas umstaendlich:
    IF (f(a).LT.0.D0) THEN        !falls Funktionswert von a kleiner als 0
      sgnfa=-1                    !Vorzeichenvariable von a wird -1 gesetzt
      ELSE
      sgnfa=1                     !ansonsten +1
    END IF
    
    IF (f(x).LT.0.D0) THEN        !dasselbe fuer x
      sgnfx=-1
      ELSE
      sgnfx=1
    END IF
        
    IF (sgnfa==sgnfx) THEN       !Vergleich der beiden Vorzeichenvariablen
        a=x                      !wenn gleich => linke Intervallgrenze wird durch x ersetzt
      ELSE
        b=x                      !wenn ungleich => rechte Intervallgrenze durch x ersetzen
    END IF
       
    steps=steps+1
  
  END DO
  
  CLOSE(100)
END SUBROUTINE bisec




! ***************************  NEWTONVERFAHREN  *********************************
! *      xstart ... Anfangswert                                                 *
! *      steps ... Anzahl der zur Berechnung erforderlichen Schritte            *
! *      f ... Testfunktion                                                     *
! *      df ... Ableitung der Testfunktion                                      *
! *      ausgabe ... Dateiname des Ausgabefiles                                 *
! *******************************************************************************

SUBROUTINE newton(xstart,steps,f,df,ausgabe)  
    !macht Genauigkeitsparameter und Testfunktionen in der subroutine verfuegbar:
  USE param
  USE functions
  
  DOUBLE PRECISION :: newton_zero,xstart,alt
  INTEGER :: steps
  CHARACTER(16) :: ausgabe
  
    ! Dummy-Funktionen und -Argumente:
  INTERFACE
     FUNCTION f(t)
         DOUBLE PRECISION :: f,t
     ENDFUNCTION
     FUNCTION df(y)
         DOUBLE PRECISION :: df, y
     ENDFUNCTION
  END INTERFACE
         
  steps=0        
  
  OPEN (100,FILE=ausgabe, STATUS='UNKNOWN')
  WRITE(100,'(A12,F6.3)') "Startwert= ", xstart
  WRITE(100,'(A30)') "----------------------------------------------------------------------------------------------------"
  WRITE(100, '(A5,A20,A25)') "steps", "x", "f(x)"    !Bezeichnung der Spalten
  
    !initialisiert Variable alt fuer logische Abfrage beim ersten Schleifendurchlauf:
  alt=xstart+1
  
  DO WHILE (ABS(xstart-alt).GT.eps)          ! solange der Betrag zwischen zwei aufeinanderfolgend 
                                             !berechneten Nullstellen groeﬂer als die Genauigkeit ist
    alt=xstart  !bei jedem Durchgang wird der Variable "alt" der Wert der zuvor berechneten Nullstelle zugewiesen
    
    newton_zero=xstart-f(xstart)/df(xstart)  !NEWTON-ALGORITHMUS
  
    WRITE(*,*) steps, xstart, f(xstart)                           !Ausgabe auf Bildschirm
    WRITE(100, '(I5,F20.16,E25.16E2)') steps, xstart, f(xstart)   !Ausgabe in Datei 
    
      ! bei jedem Durchgang wird der Startwert mit dem soeben errechneten Wert ueberschrieben
    xstart=newton_zero
    steps=steps+1
  ENDDO
  
  CLOSE(100)
END SUBROUTINE newton

! ******************************  REGULA FALSI  ****************************************
! *     a,b ... Intervallgrenzen um die Nullstelle                                     *
! *     x ... Nullstelle                                                               *
! *     f ... Testfunktion                                                             *
! *     steps ... Anzahl der benoetigten Iterationen                                   *
! *     ausgabe ... Dateiname des Ausgabefiles                                         *
! **************************************************************************************
 

SUBROUTINE regf(a,b,x,f,steps,ausgabe) 
    !macht Parameter und Testfunktionen verfuegbar:
  USE param
  USE functions
  
    !Dummy-Funktionen und -Argumente: 
  INTERFACE
      FUNCTION f(t)
          DOUBLE PRECISION :: f,t
      END FUNCTION
  END INTERFACE
      
  DOUBLE PRECISION :: a, b, x
  INTEGER :: steps, sgnfa, sgnfx     !Anzahl der Schritte, Vorzeichen f(a), Vorzeichen f(x)
  
  CHARACTER(16) :: ausgabe            !definiert ein im Hauptprogramm spezifiziertes Ausgabefile
  
  OPEN (100,FILE=ausgabe, STATUS='UNKNOWN')
  steps=0
  
  WRITE(100,'(A21,F6.3,A5,F6.3)' ) "Intervallgrenzen: a= ", a, ", b= ", b
  WRITE(100,'(A30)') "----------------------------------------------------------------------------------------------------"
  WRITE(100, '(A5,A20,A25)') "steps", "x", "f(x)"    !Bezeichnung der Spalten
  
  x=a-f(a)*(a-b)/(f(a)-f(b)) !muss initialisiert werden wegen logischer Abfrage unten
  
    ! Schleife zur iterativen Berechnung der Nullstelle 
  DO WHILE (ABS(f(x)).GT.eps)       !solange bis der Funktionswert an der Stelle 
                                    !der berechneten Nullstelle kleiner als die vorgebenene Genauigkeit ist
     x=a-f(a)*(a-b)/(f(a)-f(b))     !REGULA FALSI ALGORITHMUS
      
     WRITE(100, '(I5,F20.16,E25.16E2)') steps, x, f(x)  !Ausgabe in Datei       
     WRITE(*, *) steps, x, f(x)                         !Ausgabe auf Bildschirm
   
      !erzeugen einer Vorzeichen-Variable (mangels intrinsischer SGN-Funktion):
    IF (f(a).LT.0.D0) THEN         !falls Funktionswert von a kleiner als 0
      	sgnfa=-1                   !=> Vorzeichenvariable von a wird -1 gesetzt
      ELSE
      	sgnfa=1                    !ansonsten +1
    END IF
    
    IF (f(x).LT.0.D0) THEN         !dasselbe fuer x
      	sgnfx=-1
      ELSE
      	sgnfx=1
    END IF
    
      !ueberpruefen, auf welcher Seite der Nullstelle x liegt:  
    IF (sgnfa==sgnfx) THEN         !Vergleich der beiden Vorzeichenvariablen
        a=x                        !wenn gleich => linke Intervallgrenze wird durch x ersetzt
      ELSE
        b=x                        !wenn ungleich => rechte Intervallgrenze durch x ersetzen
    END IF
       
    steps=steps+1
  
  END DO
  
  CLOSE(100)
END SUBROUTINE regf


! *************************   FIXPUNKTVERFAHREN  **************************************
! *     xstart ... Anfangswert                                                        *
! *     f ... Testfunktion (in umgewandelter Form)                                    *
! *     steps ... Anzahl der zur Berechnung benoetigten Schritte                      *
! *     ausgabe ... Name der Ausgabedatei                                             *
! *************************************************************************************

SUBROUTINE fix(xstart,f,steps,ausgabe) 

    !macht Genauigkeitsparameter und Testfunktionen in der Subroutine verfuegbar:
  USE param
  USE functions
  USE hilfs
    
    ! Dummy-Funktionen und -Argumente:
  INTERFACE
    	FUNCTION f(x); DOUBLE PRECISION f,x; END FUNCTION
    END INTERFACE
    
  DOUBLE PRECISION :: xstart,x
  INTEGER :: steps
  Character(16) :: ausgabe
  steps=0

  OPEN (100,FILE=ausgabe, STATUS='UNKNOWN')
  WRITE(100,'(A12,F6.3)') "Startwert= ", xstart
  WRITE(100,'(A30)') "---------------------------------------------------------------------------------------------------"
  WRITE(100, '(A5,A20,A25)') "steps", "x", "f(x)"    !Bezeichnung der Spalten

  DO WHILE (ABS(f(xstart)-xstart).GT.eps)    !solange die absolute Differenz zwischen zwei 
                                             !Berechnungen groeﬂer als der Genauigkeitsparameter ist
        x=f(xstart)                          !FIXPUNKTALGORITHMUS
      WRITE(100, '(I5,F20.16,E25.16E2)') steps, xstart, x    !Ausgabe in Datei
      WRITE(*, *) steps, xstart, x                           !Ausgabe auf Bildschirm
  
        !Startwert wird mit soeben errechnetem Wert ueberschrieben:
      xstart=x
      
      steps=steps+1
  END DO
  
  CLOSE(100)
  
END SUBROUTINE fix
END MODULE

! ************************** HAUPTPROGRAMM ************************************

  
PROGRAM findroot
    !macht Testfunktionen und Methoden im Hauptprogramm verfuegbar:
  USE functions
  USE methods
  
  IMPLICIT NONE
  DOUBLE PRECISION :: a,b,start,xb    !Anfangswerte fuer Berechnungen, Nullstellenausgabe
  INTEGER :: nb, nn, nf               !Anzahl der Schritte      
  CHARACTER(1) :: auswahl, rpt, fkt_s !Abfragevariablen
  CHARACTER(3) :: a_s, b_s, x_s       !Anfangswertstrings fuer Dateiname
  CHARACTER(16) :: file                !Dateiname des Ausgabefiles, aus Methode und gewaehlter Funktion
      
  111 WRITE(*,*) "Bitte waehlen Sie die Funktion:"
  WRITE(*,*) "1 ... f(x) = x^3 - 5x^2 + 100x - 400"
  WRITE(*,*) "2 ... f(x) = exp(-x) - 0.1/(1+x)"
  READ(*,'(A1)') fkt_s
  
    !Abfrage ob Funktion korrekt eingegeben wurde:
  IF (fkt_s/="1".AND.fkt_s/="2") THEN
      WRITE(*,*) "Sie haben keine gueltige Funktion eingegeben. Bitte versuchen Sie es erneut."
      GOTO 111
  END IF
  
    !Auswahl des Verfahrens
  WRITE(*,*) "Bitte waehlen Sie das gewuenschte Verfahren aus:"
  WRITE(*,*) " b ... Bisektionsverfahren"
  WRITE(*,*) " n ... Newtonverfahren"
  WRITE(*,*) " f ... Fixpunktverfahren"
  WRITE(*,*) " r ... Regula Falsi"
  READ(*,*) auswahl
  

  !*************************************************************************
  !*                AUSWAHL: FUNKTION 1                                 *
  !*************************************************************************
  
  SELECT CASE(fkt_s)
    CASE("1")
    
               !************************************************************
               !*               AUSWAHL DES VERFAHRENS                     *
               !************************************************************
  
               SELECT CASE (auswahl) 
                   
               ! ********************** BISEKTION **************************
               CASE("b")
                   WRITE(*,*) "gewaehlt: Bisektionsverfahren, Funktion ", fkt_s
                   
                     !manuelle Eingabe der Intervallgrenzen fuer Bisektionsverfahren:
                   WRITE(*,*) "Bitte Intervallgrenzen eingeben:"
                   WRITE(*,*) "a = ?"
                   READ(*,*) a
                     !auslesen des Anfangswerts in einen String
                   WRITE(a_s,'(F3.1)') a
                   WRITE(*,*) "b = ?"
                   READ(*,*) b
                     !auslesen des Anfangswerts in einen String
                   WRITE(b_s,'(F3.1)') b
  					 !erzeugt den Dateinamen aus gewaehlter Methode, Funktion und Anfangswert(en)
				   file="f"//fkt_s//"_"//auswahl//"_"//a_s//"_"//b_s//".dat"
                 
                     !Aufruf Bisektionsverfahren mit f1: 
                   CALL bisec(a,b,xb,f1,nb,file)
                   WRITE(*,*) nb, xb
               
               !********************** NEWTON *******************************
               CASE("n")
                   WRITE(*,*) "gewaehlt: Newtonverfahren, Funktion ", fkt_s
                   
                     !manuelle Eingabe von Startwert fuer Newtonverfahren:
                   WRITE(*,*)"Bitte Startwert eingeben"
                   READ(*,*) start
                     !auslesen des Anfangswerts in einen String
                   WRITE(x_s,'(F3.1)') start
  					 !erzeugt den Dateinamen aus gewaehlter Methode, Funktion und Anfangswert(en)
				   file="f"//fkt_s//"_"//auswahl//"_"//x_s//"____"//".dat"
                   
                     !Aufruf Newton-Verfahren mit f1:
                   CALL newton(start,nn,f1,df1,file)
                   WRITE(*,*) nn, start
                   
               !******************* FIXPUNKT *********************************
               CASE("f")
                   WRITE(*,*) "gewaehlt: Fixpunktverfahren, Funktion ", fkt_s
             
                     !manuelle Eingabe von Startwert fuer Fixpunktverfahren: 
                   WRITE(*,*)"Bitte Startwert eingeben"
                   READ(*,*) start
                     !auslesen des Anfangswerts in einen String
                   WRITE(x_s,'(F3.1)') start
  					 !erzeugt den Dateinamen aus gewaehlter Methode, Funktion und Anfangswert(en)
				   file="f"//fkt_s//"_"//auswahl//"_"//x_s//"____"//".dat"
                   
                     !Aufruf Fixpunktverfahren mit f1:
                   CALL fix(start,gf1,nf,file)
                   WRITE(*,*) nf, start
                   
              !****************** REGULA FALSI *******************************
              CASE("r")
                   WRITE(*,*) "gewaehlt: Regula Falsi, Funktion ", fkt_s
                   
                     !manuelle Eingabe der Intervallgrenzen fuer Regula Falsi:
                   WRITE(*,*) "Bitte Intervallgrenzen eingeben:"
                   WRITE(*,*) "a = ?"
                   READ(*,*) a
                     !auslesen des Anfangswerts in einen String
                   WRITE(a_s,'(F3.1)') a
                   WRITE(*,*) "b = ?"
                   READ(*,*) b
                     !auslesen des Anfangswerts in einen String
                   WRITE(b_s,'(F3.1)') b
  					 !erzeugt den Dateinamen aus gewaehlter Methode, Funktion und Anfangswert(en)
				   file="f"//fkt_s//"_"//auswahl//"_"//a_s//"_"//b_s//".dat"
                 
                     !Aufruf Regula Falsi mit f1: 
                   CALL bisec(a,b,xb,f1,nb,file)
                   WRITE(*,*) nb, xb
             
              CASE DEFAULT
                 WRITE(*,*) "Sie haben keine gueltige Methode ausgewaehlt. Bitte versuchen Sie es erneut."
                 GOTO 111
                 
              END SELECT      
  
    !*************************************************************************
    !*                AUSWAHL: FUNKTION 2                                 *
    !*************************************************************************
    CASE("2")
  

               !************************************************************
               !*               AUSWAHL DES VERFAHRENS                     *
               !************************************************************
  
               SELECT CASE (auswahl) 
                   
               ! ********************** BISEKTION **************************
               CASE("b")
                   WRITE(*,*) "gewaehlt: Bisektionsverfahren, Funktion ", fkt_s
                   
                     !manuelle Eingabe der Intervallgrenzen fuer Bisektionsverfahren:
                   WRITE(*,*) "Bitte Intervallgrenzen eingeben:"
                   WRITE(*,*) "a = ?"
                   READ(*,*) a
                     !auslesen des Anfangswerts in einen String
                   WRITE(a_s,'(F3.1)') a
                   WRITE(*,*) "b = ?"
                   READ(*,*) b
                     !auslesen des Anfangswerts in einen String
                   WRITE(b_s,'(F3.1)') b
  					 !erzeugt den Dateinamen aus gewaehlter Methode, Funktion und Anfangswert(en)
				   file="f"//fkt_s//"_"//auswahl//"_"//a_s//"_"//b_s//".dat"
                 
                     !Aufruf Bisektionsverfahren mit f2: 
                   CALL bisec(a,b,xb,f2,nb,file)
                   WRITE(*,*) nb, xb
               
               !********************** NEWTON *******************************
               CASE("n")
                   WRITE(*,*) "gewaehlt: Newtonverfahren, Funktion ", fkt_s
                   
                     !manuelle Eingabe von Startwert fuer Newtonverfahren:
                   WRITE(*,*)"Bitte Startwert eingeben"
                   READ(*,*) start
                     !auslesen des Anfangswerts in einen String
                   WRITE(x_s,'(F3.1)') start
  					 !erzeugt den Dateinamen aus gewaehlter Methode, Funktion und Anfangswert(en)
				   file="f"//fkt_s//"_"//auswahl//"_"//x_s//"____"//".dat"
                   
                     !Aufruf Newton-Verfahren mit f2:
                   CALL newton(start,nn,f2,df2,file)
                   WRITE(*,*) nn, start
                   
               !******************* FIXPUNKT *********************************
               CASE("f")
                   WRITE(*,*) "gewaehlt: Fixpunktverfahren, Funktion ", fkt_s
             
                     !manuelle Eingabe von Startwert fuer Fixpunktverfahren: 
                   WRITE(*,*)"Bitte Startwert eingeben"
                   READ(*,*) start
                     !auslesen des Anfangswerts in einen String
                   WRITE(x_s,'(F3.1)') start
  					 !erzeugt den Dateinamen aus gewaehlter Methode, Funktion und Anfangswert(en)
				   file="f"//fkt_s//"_"//auswahl//"_"//x_s//"____"//".dat"
                   
                     !Aufruf Fixpunktverfahren mit f2:
                   CALL fix(start,gf2,nf,file)
                   WRITE(*,*) nf, start
                   
              !****************** REGULA FALSI *******************************
              CASE("r")
                   WRITE(*,*) "gewaehlt: Regula Falsi, Funktion ", fkt_s
                   
                     !manuelle Eingabe der Intervallgrenzen fuer Regula Falsi:
                   WRITE(*,*) "Bitte Intervallgrenzen eingeben:"
                   WRITE(*,*) "a = ?"
                   READ(*,*) a
                     !auslesen des Anfangswerts in einen String
                   WRITE(a_s,'(F3.1)') a
                   WRITE(*,*) "b = ?"
                   READ(*,*) b
                     !auslesen des Anfangswerts in einen String
                   WRITE(b_s,'(F3.1)') b
  					 !erzeugt den Dateinamen aus gewaehlter Methode, Funktion und Anfangswert(en)
				   file="f"//fkt_s//"_"//auswahl//"_"//a_s//"_"//b_s//".dat"
                 
                     !Aufruf Regula Falsi mit f2: 
                   CALL bisec(a,b,xb,f2,nb,file)
                   WRITE(*,*) nb, xb
             
              CASE DEFAULT
                 WRITE(*,*) "Sie haben keine gueltige Methode ausgewaehlt. Bitte versuchen Sie es erneut."
                 GOTO 111
                 
              END SELECT    
  END SELECT
  
    
    !Abfrage zur Wiederholung des Programms  
  WRITE(*,*) "Wollen Sie das Programm noch einmal starten? (Y/N)"
  READ(*,*) rpt
  IF (rpt=="Y".OR.rpt=="y") THEN
    GOTO 111
  END IF
      
END PROGRAM