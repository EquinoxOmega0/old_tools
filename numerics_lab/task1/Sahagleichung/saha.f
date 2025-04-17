      PROGRAM Sahagleichung
C Variablendeklaration
      IMPLICIT NONE
      INTEGER wh,einzel,numana,tloglin,rhologlin,schirm
      DOUBLE PRECISION t0,t1,dt,rho0,rho1,drho,taktu,rhoaktu,genau,x
      LOGICAL abbr1,abbr2
      CHARACTER(25) dateiname
C BegrÅ·ung *g*
      WRITE(*,*) 'Willkommen beim Lîsen der Saha-Gleichung!'
      WRITE(*,*) ' '
C Beginn der Hauptprogrammschleife
101   CONTINUE
C Dateiname auswÑhlen
      WRITE(*,*) 'Bitte Geben Sie den gewÅnschten Namen der Ausgabedatei
     # ein'
      READ(*,*) dateiname
      WRITE(*,*) ' '
C Berechnungsart auswÑhlen
      WRITE(*,*) 'Bitte wÑhlen Sie ihre Berechnungsart aus:'
      WRITE(*,*) '1: einzele Berechnung bei vorgebener Temperatur und Di
     #chte'
      WRITE(*,*) '2: Berechnung eines Temperaturintervalls bei konstante
     #r Dichte'
      WRITE(*,*) '3: Berechnung eines Dichteintervalls bei konstanter Te
     #mperatur'
      WRITE(*,*) '4: Berechnung eines Temperatur-Druck Raums'
      READ(*,*) einzel
      WRITE(*,*) ' '
C numerische oder analytische Berechnung?
      WRITE(*,*) 'Wie mîchten sie die Berechnung durchfÅhren?'
      WRITE(*,*) '0: numerisch'
      WRITE(*,*) '1: analytisch'
      WRITE(*,*) '2: auf beide Arten'
      READ(*,*) numana
      WRITE(*,*) ' '
C falls numerisch, die Berechnungsgenauigkeit des Ionisationsgrad wÑhlen
      IF (numana.NE.1) THEN
      WRITE(*,*) 'Geben Sie bitte gewÅnschte Genauigkeit des Ionisations
     #grads ein:'
      READ(*,*) genau
      WRITE(*,*) ' '
      ENDIF
C Parameter fÅr Einzelberechung auswhlen
      IF (einzel==1) THEN
      WRITE(*,*) 'Geben Sie die gewÅnschte Temperatur [K] ein:'
      READ(*,*) t0
      WRITE(*,*) 'Geben Sie die gewÅnschte Dichte [1/cm¸] ein:'
      READ(*,*) rho0
      dt=0
      drho=0
      t1=t0
      rho1=rho0
      ELSE
C Parameter fÅr Temperaturscan auswhlen
      IF (einzel==2) THEN
      WRITE(*,*) 'Geben Sie die niedrigste Temperatur [K] ein:'
      READ(*,*) t0
      WRITE(*,*) 'Geben Sie die hîchste Temperatur [K] ein:'
      READ(*,*) t1
      WRITE(*,*) 'Geben Sie "1" fÅr lineare oder "2" fÅr logarithmische
     #Interpolation ein:'
      READ(*,*) tloglin
      IF (tloglin==1) THEN
      WRITE(*,*) 'Geben Sie die Schrittweite der Temperatur [K] ein:'
      READ(*,*) dt
      ELSE
      WRITE(*,*) 'Geben Sie die Basis des Logarithmus ein:'
      READ(*,*) dt
      ENDIF
      WRITE(*,*) 'Geben Sie die gewÅnschte Dichte [1/cm¸] ein:'
      READ(*,*) rho0
      drho=0
      rho1=rho0
      ELSE
C Parameter fÅr Dichtenscan auswhlen
      IF (einzel==3) THEN
      WRITE(*,*) 'Geben Sie die gewÅnschte Temperatur [K] ein:'
      READ(*,*) t0
      WRITE(*,*) 'Geben Sie die niedrigste Dichte [1/cm¸] ein:'
      READ(*,*) rho0
      WRITE(*,*) 'Geben Sie die hîchste Dichte [1/cm¸] ein:'
      READ(*,*) rho1
      WRITE(*,*) 'Geben Sie "1" fÅr lineare oder "2" fÅr logarithmische
     #Interpolation ein:'
      READ(*,*) rhologlin
      IF (rhologlin==1) THEN
      WRITE(*,*) 'Geben Sie die Schrittweite der Dichte [1/cm¸] ein:'
      READ(*,*) drho
      ELSE
      WRITE(*,*) 'Geben Sie die Basis des Logarithmus ein:'
      READ(*,*) drho
      dt=0
      t1=t0
      ENDIF
C Parameter fÅr Temperatur-Dichten Raum auswhlen
      ELSE
      WRITE(*,*) 'Geben Sie die niedrigste Temperatur [K] ein:'
      READ(*,*) t0
      WRITE(*,*) 'Geben Sie die hîchste Temperatur [K] ein:'
      READ(*,*) t1
      WRITE(*,*) 'Geben Sie "1" fÅr lineare oder "2" fÅr logarithmische
     #Interpolation ein:'
      READ(*,*) tloglin
      IF (tloglin==1) THEN
      WRITE(*,*) 'Geben Sie die Schrittweite der Temperatur [K] ein:'
      READ(*,*) dt
      ELSE
      WRITE(*,*) 'Geben Sie die Basis des Logarithmus ein:'
      READ(*,*) dt
      ENDIF
      WRITE(*,*) 'Geben Sie die niedrigste Dichte [1/cm¸] ein:'
      READ(*,*) rho0
      WRITE(*,*) 'Geben Sie die hîchste Dichte [1/cm¸] ein:'
      READ(*,*) rho1
      WRITE(*,*) 'Geben Sie "1" fÅr lineare oder "2" fÅr logarithmische
     #Interpolation ein:'
      READ(*,*) rhologlin
      IF (rhologlin==1) THEN
      WRITE(*,*) 'Geben Sie die Schrittweite der Dichte [1/cm¸] ein:'
      READ(*,*) drho
      ELSE
      WRITE(*,*) 'Geben Sie die Basis des Logarithmus ein:'
      READ(*,*) drho
      ENDIF
      ENDIF
      ENDIF
      ENDIF
C öberprÅfen ob Ausgabe auch am Bildschrim gewÅnscht
      WRITE(*,*) ' '
      WRITE(*,*) 'Wenn Sie Werte auch am Bildschirm ausgeben mîchten, ge
     #ben sie "1" ein.'
      READ(*,*) schirm
      WRITE(*,*) ' '
C Dateiîffnen
      OPEN(20,FILE=dateiname,STATUS='UNKNOWN')

C Header schreiben
301   FORMAT(4X,F9.1,5X,'|',5X,1P,E8.2,5X,'|',3X,0P,F11.6)
      WRITE(*,*) ' Temperatur [K]  |   Dichte[1/cm¸]  |   Ionisationsgra
     #d'
      WRITE(20,*) ' Temperatur [K]  |   Dichte[1/cm¸]  |   Ionisationsgr
     #ad'

C numerisches Lîsen der Sahagleichung geht hier los
      IF (numana.NE.1) THEN
C Doppelte Schleife um alle Mîglichkeiten abzudecken
      taktu=t0
      abbr1=.FALSE.
C Ñu·er Schleife fÅr Temperaturintervall
105   CONTINUE

      rhoaktu=rho0
      abbr2=.FALSE.
C innere Schleife fÅr Dichtenintervall
104   CONTINUE
C eigentliche Berechnung
      CALL Sahanum(taktu,rhoaktu,x,genau)

C Ausgabe
      IF (schirm==1) THEN
      WRITE(*,301) taktu, rhoaktu, x
      ENDIF

      WRITE(20,301) taktu, rhoaktu, x

C Abbruchbedingungen ÅberprÅfen
      IF (drho==0) THEN
      abbr2=.TRUE.
      ENDIF

      IF (rhoaktu.GT.rho1) THEN
      abbr2=.TRUE.
      ENDIF
C nÑchsten Dichtewert berechnen
      IF (rhologlin==1) THEN
      rhoaktu=rhoaktu+drho
      ELSE
      rhoaktu=rhoaktu*drho
      ENDIF
C Ende der inneren Schleife
      IF (abbr2.EQV..FALSE.) THEN
      GOTO 104
      ENDIF
C Abbruchbedingungen ÅberprÅfen
      IF (dt==0) THEN
      abbr1=.TRUE.
      ENDIF

      IF (taktu.GT.t1) THEN
      abbr1=.TRUE.
      ENDIF
C nÑchsten Temperaturwert berechnen
      IF (tloglin==1) THEN
      taktu=taktu+dt
      ELSE
      taktu=taktu*dt
      ENDIF
C Ende der Ñu·eren Schleife
      IF (abbr1.EQV..FALSE.) THEN
      GOTO 105
      ENDIF

      ENDIF

C Nur wenn beide Arten gewÑhlt eine Trennlinie zeichnen
      IF (numana==2) THEN
      WRITE(20,*) ' '
      WRITE(20,*) '-----------------------------------------------------
     #---'
      WRITE(20,*) ' '
      WRITE(20,*) ' Temperatur [K]  |   Dichte[1/cm¸]  |   Ionisationsgr
     #ad'
      WRITE(*,*) ' '
      WRITE(*,*) '------------------------------------------------------
     #--'
      WRITE(*,*) ' '
      WRITE(*,*) ' Temperatur [K]  |   Dichte[1/cm¸]  |   Ionisationsgra
     #d'
      ENDIF

C analytisches Lîsen der Sahagleichung geht hier los
      IF (numana.NE.0) THEN

C Doppelte Schleife um alle Mîglichkeiten abzudecken
      taktu=t0
      abbr1=.FALSE.
C Ñu·er Schleife fÅr Temperaturintervall
103   CONTINUE

      rhoaktu=rho0
      abbr2=.FALSE.
C innere Schleife fÅr Dichtenintervall
102   CONTINUE
C eigentliche Berechnung
      CALL Sahaana(taktu,rhoaktu,x)

C Ausgabe
      IF (schirm==1) THEN
      WRITE(*,301) taktu, rhoaktu, x
      ENDIF
      
      WRITE(20,301) taktu, rhoaktu, x

C Abbruchbedingungen ÅberprÅfen
      IF (drho==0) THEN
      abbr2=.TRUE.
      ENDIF
      
      IF (rhoaktu.GT.rho1) THEN
      abbr2=.TRUE.
      ENDIF
C nÑchsten Dichtewert berechnen
      IF (rhologlin==1) THEN
      rhoaktu=rhoaktu+drho
      ELSE
      rhoaktu=rhoaktu*drho
      ENDIF

C Ende der inneren Schleife
      IF (abbr2.EQV..FALSE.) THEN
      GOTO 102
      ENDIF
C Abbruchbedingungen ÅberprÅfen
      IF (dt==0) THEN
      abbr1=.TRUE.
      ENDIF

      IF (taktu.GT.t1) THEN
      abbr1=.TRUE.
      ENDIF
C nÑchsten Temperaturwert berechnen
      IF (tloglin==1) THEN
      taktu=taktu+dt
      ELSE
      taktu=taktu*dt
      ENDIF
C Ende der Ñu·eren Schleife
      IF (abbr1.EQV..FALSE.) THEN
      GOTO 103
      ENDIF

      ENDIF
C Datei schlie·en
      CLOSE(20)
      
C Mîglichkeit auf weitere Berechnung oder Programm zu beenden
      WRITE(*,*) ' '
      WRITE(*,*) 'Berechnung abgeschlossen!'
      WRITE(*,*) ' '
      WRITE(*,*) 'Geben Sie "1" fÅr eine weitere Berechnung'
      WRITE(*,*) 'ein oder "0" um das Program zu beenden'
      READ(*,*) wh
      IF (wh==1) THEN
      GOTO 101
      ENDIF

      END


C Sahagleichung numerisch lîsen
      SUBROUTINE Sahanum(t,rho,ion,gg)
C Variablendeklaration
      IMPLICIT NONE
      DOUBLE PRECISION t,rho,ion,gg
      DOUBLE PRECISION C1,C2,hilf,alt,f,df
C Berechner Konstanten der Saha-Gleichung
      C1=1/2.D0*rho*2.07D-16*(t**(-3.D0/2.D0))*EXP(1.44D8/(504.D0*t))
      C2=2.D0*rho*2.07D-16*(t**(-3.D0/2.D0))*EXP(1.44D8/(228.D0*t))

C Newtonverfahren
      hilf=1.D0
      alt=hilf
201   CONTINUE

      f=C1*C2*alt**3+C2*alt**2+(1.D0-C2)*alt-2.D0
      df=3.D0*C1*C2*alt**2+2.D0*C2*alt+(1.D0-C2)
      hilf=alt-(f/df)
      IF (ABS(hilf-alt).GT.gg) THEN
      alt=hilf
      GOTO 201
      ENDIF
      
      ion=hilf
      
C Bei nicht physikalischen Wert Fehlercode ausgeben
      IF ((ion.GT.2) .OR. (ion.LT.0)) THEN
      ion=666
      ENDIF
      
      RETURN
      END


C Sahagleichung analytisch lîsen
      SUBROUTINE Sahaana(t,rho,ion)
C Variablendeklaration
      IMPLICIT NONE
      DOUBLE PRECISION t,rho,ion
      DOUBLE PRECISION C1,C2,a,b,c,d,q,r,w,v,cr,cphi
      
C Berechner Konstanten der Saha-Gleichung
      C1=1/2.D0*rho*2.07D-16*(t**(-3.D0/2.D0))*EXP(1.44D8/(504.D0*t))
      C2=2.D0*rho*2.07D-16*(t**(-3.D0/2.D0))*EXP(1.44D8/(228.D0*t))

C Lîsen einer kubischen Gleichung
      a=C1*C2
      b=C2
      c=1.D0-C2
      d=-2.D0

      q=(3.D0*a*c-b**2)/(9.D0*a**2)
      r=(9.D0*a*b*c-27.D0*a**2*d-2.D0*b**3)/(54.D0*a**3)
C mathematischer Trick um komplexe Zahlenwerte zu vermeiden
      w=q**3+r**2
      w=SQRT(-w)
      v=r
      cr=SQRT(v**2+w**2)
      cphi=ACOS(v/cr)
      cr=cr**(1.D0/3.D0)
      cphi=cphi/3.D0
      w=cr*COS(cphi)

      ion=2.D0*w-b/(3.D0*a)

C Bei nicht physikalischen Wert Fehlercode ausgeben
      IF ((ion.GT.2) .OR. (ion.LT.0))  THEN
      ion=666
      ENDIF

      RETURN
      END

      