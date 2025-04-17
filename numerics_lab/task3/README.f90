
    Nutzung der Numerical Recipes Routinen unter FORTRAN90:
  ----------------------------------------------------------

  Folgende Files befinden sich im f90-Verzeichnis:

  nrtype.f90: die Routing enthaelt die in den Numerical Recipe Programmen
        benutzten Zahlendefinitionen sowie einige Konstanten.
        (Blick in die Routine lohnt sich!!!)

        Anmerkung: der Zahlentyp "_SP" ist hier ABWEICHEND VOM NR-Standard
            definiert (und zwar dahingehend, dass alles mit "double precision"
            gerechnet wird, auch wenn der Zahlentyp "_SP" ist.

  nr.f90:  enthaelt die Interfaces fuer die NR-Routinen  

  nrutil.f90: enthaelt diverse Hilfsprogramme sowie eine (modifizierte) Fehlerbehandlungsroutine

  recipes.f90:   enthaelt einen Zufallszahlengenerator, die Unterroutine zur
        Loesung von Differentialgleichungen (odeint + Runge-Kutta-Integrator), sowie
        ein Programm zur Nullstellensuche (rtsafe).

  test.f90:  ein Beispielprogramm, das die Nullstellensuche und den Runge-Kutta-Integrator
        verwendet (relative Fehler sollten sehr klein sein).

  Makefile: Beispiel-Makefile


     Compilierungshinweise: 
     ======================

      Um ein lauffaehiges Programm zu erhalten, kommt es wegen diverser Definitionen und Module 
auf die Reihenfolge beim Compilieren an (s. VL zu Fortran 90)! Praktisch gibt es verschiedene Wege:

  1) Komplettes Neu-Compilieren aller Routinen:

       ifort nrtype.f90 nr.f90 nrutil.f90 recipes.f90 test.f90

  2) Vorabkompilieren selten veraenderter Routinen (dabei werden auch benoetigte Module
       erzeugt) und anschliessendes Compilieren der veraenderten Routinen
       (schneller als 1), aber man muss gegebenenfalls ans Neu-Compilieren
       der im ersten Schritt verwendeten Routinen denken:

     2.1) ifort -c nrtype.f90 nr.f90 nrutil.f90 recipes.f90

     2.2) ifort nrtype.o nr.o nrutil.o recipes.o test.f90


  3) mit Makefile:

       make

    (die Compilierungseinstellungen sind dem Makefile zu entnehmen)
