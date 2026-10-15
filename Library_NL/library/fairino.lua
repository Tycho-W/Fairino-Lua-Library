---@meta
--- FAIRINO FR Lua IntelliSense-library voor VS Code. Op basis van FR Lua Programming Script User Manual V1.0.
--- Deze declaraties zijn alleen voor autocomplete, parameterhints en documentatie.


--- Wacht het opgegeven aantal milliseconden.
---@param t_ms number Tijd in milliseconden.
function WaitMs(t_ms) end

--- Wacht op één digitale ingang van de control box.
---@param id integer DI/CI-nummer.
---@param status integer Verwachte status [0/1].
---@param maxtime integer Maximale wachttijd [ms].
---@param opt integer Gedrag bij timeout 0=programma stopt en geeft time-outmelding, 1=time-outmelding negeren en programma voortzetten, 2=onbeperkt wachten.
function WaitDI(id,status,maxtime,opt) end

--- Wacht op één digitale ingang van de toolflens.
---@param id integer Tool-DI-nummer.
---@param status integer Verwachte status [0/1].
---@param maxtime integer Maximale wachttijd [ms].
---@param opt integer Gedrag bij timeout 0=programma stopt en geeft time-outmelding, 1=time-outmelding negeren en programma voortzetten, 2=onbeperkt wachten.
function WaitToolDI(id,status,maxtime,opt) end

--- Wacht op meerdere digitale ingangen.
---@param mode integer 0=AND, 1=OR.
---@param id integer Bitmasker voor te controleren DI/CI-ingangen.
---@param status integer Bitmasker voor gewenste status: 0=LOW, 1=HIGH.
---@param maxtime integer Maximale wachttijd [ms].
---@param opt integer Gedrag bij timeout 0=programma stopt en geeft time-outmelding, 1=time-outmelding negeren en programma voortzetten, 2=onbeperkt wachten.
function WaitMultiDI(mode,id,status,maxtime,opt) end

--- Wacht tot de analoge ingang aan de ingestelde grens voldoet.
---@param id integer AI-nummer.
---@param sign integer 0=Groter dan, 1=Kleiner dan.
---@param value number Drempelwaarde in procenten. [0-100]
---@param maxtime integer Maximale wachttijd [ms].
---@param opt integer Gedrag bij timeout 0=programma stopt en geeft time-outmelding, 1=time-outmelding negeren en programma voortzetten, 2=onbeperkt wachten.
function WaitAI(id,sign,value,maxtime,opt) end

--- Wacht op een analoge toolingang.
---@param id integer Tool-AI-nummer.
---@param sign integer 0=Groter dan, 1=Kleiner dan.
---@param value number Drempelwaarde in procenten. [0-100]
---@param maxtime integer Maximale wachttijd [ms].
---@param opt integer Gedrag bij timeout 0=programma stopt en geeft time-outmelding, 1=time-outmelding negeren en programma voortzetten, 2=onbeperkt wachten.
function WaitToolAI(id,sign,value,maxtime,opt) end

--- Geeft een pauze-/statusreden door aan de controller.            
--- Voorbeelden :                  
--- Pause(0) Geen functie        
--- Pause(1) Cylinder niet uitgeschoven          
---@param num integer Specifieke pauzecode.
function Pause(num) end

--- Roept een Lua-subroutinebestand aan.
---@param name_path string Pad naar het subroutinebestand.
---@param layer integer Laagnummer.
---@param id integer Subroutine-ID.
function NewDofile(name_path,layer,id) end

--- Beëindigt een NewDofile-subroutineaanroep.
function DofileEnd() end

--- Registreert een variabele voor de controllerinterface.
---@param type string Variabeletype, bijvoorbeeld number of string.
---@param name string Variabelenaam.
function RegisterVar(type,name) end

--- Leest een systeemvariabele.
---@param s_var any Systeemvariabele-ID.
---@return any Waarde van de systeemvariabele.
function GetSysVarvalue(s_var) end

--- Schrijft een systeemvariabele.
---@param s_var any Systeemvariabele-ID.
---@param value any Variabele waarde.
function SetSysVarvalue(s_var,value) end

--- Punt-naar-puntbeweging naar een ingeleerd punt.
---@param point_name string Naam van het punt.
---@param ovl number Snelheidspercentage [0~100%].
---@param blendT number [-1] - voor stoppen (blocking), [0~500] - blendtijd in [ms] (nonblocking).
---@param offset_flag integer 0=geen offset, 1=werkstuk, 2=tool, 3=workpiece.
---@param offset_x number X-offset [mm].
---@param offset_y number Y-offset [mm].
---@param offset_z number Z-offset [mm].
---@param offset_rx number Rotatie-offset Rx [°].
---@param offset_ry number Rotatie-offset Ry [°].
---@param offset_rz number Rotatie-offset Rz [°].
function PTP(point_name,ovl,blendT,offset_flag,offset_x,offset_y,offset_z,offset_rx,offset_ry,offset_rz) end

--- Lineaire beweging naar een ingeleerd punt.
---@param point_name string Naam van het punt.
---@param ovl number Snelheidspercentage [0~100%].
---@param blendR number [-1.0] - voor stoppen (blocking), [0~1000] overgangsradius in [mm] (nonblocking).
---@param search integer [0] - Geen positionering (van lasdraad), [1] positionering (van lasdraad)
---@param offset_flag integer [0] - geen offset, [1] - werkstuk, [2] - tool, [3] - workpiece.
---@param offset_x number X-offset [mm].
---@param offset_y number Y-offset [mm].
---@param offset_z number Z-offset [mm].
---@param offset_rx number Rotatie-offset Rx [°].
---@param offset_ry number Rotatie-offset Ry [°].
---@param offset_rz number Rotatie-offset Rz [°].
---@param speed number Physical speed (mm/s).
---@param acceleration number Acceleratie (mm/s²).
function Lin(point_name,ovl,blendR,search,offset_flag,offset_x,offset_y,offset_z,offset_rx,offset_ry,offset_rz,speed,acceleration) end


--- Gezamenlijke/joint-beweging met expliciete joint- en Cartesian-doelwaarden.
---@param j1 number Jointpositie [°].
---@param j2 number Jointpositie [°].
---@param j3 number Jointpositie [°].
---@param j4 number Jointpositie [°].
---@param j5 number Jointpositie [°].
---@param j6 number Jointpositie [°].
---@param x number Cartesische positie [mm].
---@param y number Cartesische positie [mm].
---@param z number Cartesische positie [mm].
---@param rx number Rotatie [°].
---@param ry number Rotatie [°].
---@param rz number Rotatie [°].
---@param tool integer Toolnummer.
---@param user integer Werkstuknummer.
---@param speed number Snelheidspercentage [0~100%].
---@param acc number Acceleratiepercentage [0~100%].
---@param ovl number Snelheidspercentage [0~100%].
---@param ep1 number Positie van een externe as.
---@param ep2 number Positie van een externe as.
---@param ep3 number Positie van een externe as.
---@param ep4 number Positie van een externe as.
---@param blendT number [-1] - voor stoppen (blocking), [0~500] - blendtijd in [ms] (nonblocking).
---@param offset integer [0] - geen offset, [1] - werkstuk, [2] - tool, [3] - workpiece.
---@param offset_x number Cartesische offset [mm].
---@param offset_y number Cartesische offset [mm].
---@param offset_z number Cartesische offset [mm].
---@param offset_rx number Rotatie-offset [°].
---@param offset_ry number Rotatie-offset [°].
---@param offset_rz number Rotatie-offset [°].
function MoveJ(j1,j2,j3,j4,j5,j6,x,y,z,rx,ry,rz,tool,user,speed,acc,ovl,ep1,ep2,ep3,ep4,blendT,offset,offset_x,offset_y,offset_z,offset_rx,offset_ry,offset_rz) end

--- Lineaire beweging met expliciete joint- en Cartesian-doelwaarden.
---@param j1 number Jointpositie [°].
---@param j2 number Jointpositie [°].
---@param j3 number Jointpositie [°].
---@param j4 number Jointpositie [°].
---@param j5 number Jointpositie [°].
---@param j6 number Jointpositie [°].
---@param x number Cartesische positie [mm].
---@param y number Cartesische positie [mm].
---@param z number Cartesische positie [mm].
---@param rx number Rotatie [°].
---@param ry number Rotatie [°].
---@param rz number Rotatie [°].
---@param tool integer Toolnummer.
---@param user integer Werkstuknummer.
---@param speed number Snelheidspercentage [0~100%].
---@param acc number Acceleratiepercentage [0~100%].
---@param ovl number Snelheidspercentage [0~100%].
---@param ep1 number Positie van een externe as.
---@param ep2 number Positie van een externe as.
---@param ep3 number Positie van een externe as.
---@param ep4 number Positie van een externe as.
---@param blendR number [-1] - voor stoppen, [0~1000] overgangsradius in [mm] (nonblocking).
---@param search integer [0] - Geen positionering (van lasdraad), [1] positionering (van lasdraad)
---@param offset integer [0] - geen offset, [1] - werkstuk, [2] - tool, [3] - workpiece.
---@param offset_x number Cartesische offset [mm].
---@param offset_y number Cartesische offset [mm].
---@param offset_z number Cartesische offset [mm].
---@param offset_rx number Rotatie-offset [°].
---@param offset_ry number Rotatie-offset [°].
---@param offset_rz number Rotatie-offset [°].
function MoveL(j1,j2,j3,j4,j5,j6,x,y,z,rx,ry,rz,tool,user,speed,acc,ovl,ep1,ep2,ep3,ep4,blendR,search,offset,offset_x,offset_y,offset_z,offset_rx,offset_ry,offset_rz) end

--- Boogbeweging via een middenpunt en een eindpunt.
---@param point_p_name string Naam van het middelpunt van de boog.
---@param poffset integer [0] - geen offset, [1] - werkstuk, [2] - tool, [3] - workpiece.
---@param offset_px number Cartesische offset [mm].
---@param offset_py number Cartesische offset [mm].
---@param offset_pz number Cartesische offset [mm].
---@param offset_prx number Rotatie offset [°].
---@param offset_pry number Rotatie offset [°].
---@param offset_prz number Rotatie offset [°].
---@param point_t_name string Naam van het eindpunt van de boog.
---@param toffset integer [0] - geen offset, [1] - werkstuk, [2] - tool, [3] - workpiece.
---@param offset_tx number Cartesische offset [mm].
---@param offset_ty number Cartesische offset [mm].
---@param offset_tz number Cartesische offset [mm].
---@param offset_trx number Rotatie offset [°].
---@param offset_try number Rotatie offset [°].
---@param offset_trz number Rotatie offset [°].
---@param ovl number Snelheidspercentage [0~100%].
---@param blend number [-1.0] - voor stoppen (blocking), [0~1000] overgangsradius in [mm] (nonblocking).
function ARC(point_p_name,poffset,offset_px,offset_py,offset_pz,offset_prx,offset_pry,offset_prz,point_t_name,toffset,offset_tx,offset_ty,offset_tz,offset_trx,offset_try,offset_trz,ovl,blend) end

--- Cirkelbeweging via een begin-/middenpunt en een eindpunt.
---@param pj1 number Jointpositie [°].
---@param pj2 number Jointpositie [°].
---@param pj3 number Jointpositie [°].
---@param pj4 number Jointpositie [°].
---@param pj5 number Jointpositie [°].
---@param pj6 number Jointpositie [°].
---@param px number Cartesische positie [mm].
---@param py number Cartesische positie [mm].
---@param pz number Cartesische positie [mm].
---@param prx number Rotatie [°].
---@param pry number Rotatie [°].
---@param prz number Rotatie [°].
---@param ptool integer Toolnummer.
---@param pusher integer Werkstuknummer.
---@param pspeed number Snelheidspercentage [0~100%].
---@param pacc number Acceleratiepercentage [0~100%].
---@param pep1 number Positie van een externe as.
---@param pep2 number Positie van een externe as.
---@param pep3 number Positie van een externe as.
---@param pep4 number Positie van een externe as.
---@param poffset integer [0] - geen offset, [1] - werkstuk, [2] - tool, [3] - workpiece.
---@param offset_px number Cartesische offset [mm].
---@param offset_py number Cartesische offset [mm].
---@param offset_pz number Cartesische offset [mm].
---@param offset_prx number Rotatie offset [°].
---@param offset_pry number Rotatie offset [°].
---@param offset_prz number Rotatie offset [°].
---@param tj1 number Jointpositie van het doelpunt [°].
---@param tj2 number Jointpositie van het doelpunt [°].
---@param tj3 number Jointpositie van het doelpunt [°].
---@param tj4 number Jointpositie van het doelpunt [°].
---@param tj5 number Jointpositie van het doelpunt [°].
---@param tj6 number Jointpositie van het doelpunt [°].
---@param tx number Cartesische positie van het doelpunt [mm].
---@param ty number Cartesische positie van het doelpunt [mm].
---@param tz number Cartesische positie van het doelpunt [mm].
---@param trx number Rotatie van het doelpunt [°].
---@param try number Rotatie van het doelpunt [°].
---@param trz number Rotatie van het doelpunt [°].
---@param ttool integer Toolnummer.
---@param tuser integer Werkstuknummer.
---@param tspeed number Snelheidspercentage [0~100%].
---@param tacc number Acceleratiepercentage [0~100%].
---@param tep1 number Positie van een externe as.
---@param tep2 number Positie van een externe as.
---@param tep3 number Positie van een externe as.
---@param tep4 number Positie van een externe as.
---@param toffset integer [0] - geen offset, [1] - werkstuk, [2] - tool, [3] - workpiece.
---@param offset_tx number Cartesische offset [mm].
---@param offset_ty number Cartesische offset [mm].
---@param offset_tz number Cartesische offset [mm].
---@param offset_trx number Rotatie offset [°].
---@param offset_try number Rotatie offset [°].
---@param offset_trz number Rotatie offset [°].
---@param ovl number Snelheidspercentage [0~100%].
---@param blendR number [-1.0] - voor stoppen (blocking), [0~1000] overgangsradius in [mm] (nonblocking).
function MoveC(pj1,pj2,pj3,pj4,pj5,pj6,px,py,pz,prx,pry,prz,ptool,pusher,pspeed,pacc,pep1,pep2,pep3,pep4,poffset,offset_px,offset_py,offset_pz,offset_prx,offset_pry,offset_prz,tj1,tj2,tj3,tj4,tj5,tj6,tx,ty,tz,trx,try,trz,ttool,tuser,tspeed,tacc,tep1,tep2,tep3,tep4,toffset,offset_tx,offset_ty,offset_tz,offset_trx,offset_try,offset_trz,ovl,blendR) end

--- Spiraalbeweging door drie opgegeven punten.
---@param ... any Nog niet toegevoegd. Zie FRLua programming script user manual.
function Spiral(...) end


--- Nieuwe spiraalbeweging vanaf een opgegeven punt.
---@param ... any Nog niet toegevoegd. Zie FRLua programming script user manual.
function NewSpiral(...) end

--- Start horizontale spiraalbeweging.
---@param ... any Nog niet toegevoegd. Zie FRLua programming script user manual.
function HorizonSpiralMotionStart(...) end

--- Beëindigt de horizontale spiraalbeweging.
function HorizonSpiralMotionEnd() end

--- Start een splinebeweging.
function SplineStart() end

--- Beëindigt een splinebeweging.
function SplineEnd() end

--- Voegt een spline-segment van type punt-naar-punt toe.
---@param ... any Nog niet toegevoegd. Zie FRLua programming script user manual.
function SplinePP(...) end

--- Voegt een lineair spline-segment toe.
---@param ... any Nog niet toegevoegd. Zie FRLua programming script user manual.
function SplineLINE(...) end

--- Voegt een SCIRC-spline-segment toe.
---@param ... any Nog niet toegevoegd. Zie FRLua programming script user manual.
function SCIRC(...) end

--- Voegt een spline-cirkel-segment toe.
---@param ... any Nog niet toegevoegd. Zie FRLua programming script user manual.
function SplineCIRC(...) end

--- Voegt een lineair spline-segment toe op basis van een ingeleerd punt.
---@param ... any Nog niet toegevoegd. Zie FRLua programming script user manual.
function SLIN(...) end

--- Start een nieuwe splinegroep.
---@param ... any Nog niet toegevoegd. Zie FRLua programming script user manual.
function NewSplineStart(...) end

--- Voegt een punt toe aan de nieuwe splinegroep.
---@param ... any Nog niet toegevoegd. Zie FRLua programming script user manual.
function NewSplinePoint(...) end

--- Beëindigt de nieuwe splinegroep.
function NewSplineEnd() end

--- Start slingerbeweging voor lasapplicaties.
---@param ... any Nog niet toegevoegd. Zie FRLua programming script user manual.
function WeaveStart(...) end

--- Beëindigt slingerbeweging.
---@param ... any Nog niet toegevoegd. Zie FRLua programming script user manual.
function WeaveEnd(...) end

--- Start simulatie van een slingerbeweging.
---@param ... any Nog niet toegevoegd. Zie FRLua programming script user manual.
function WeaveSimStart(...) end

--- Beëindigt simulatie van een slingerbeweging.
---@param ... any Nog niet toegevoegd. Zie FRLua programming script user manual.
function WeaveSimEnd(...) end

--- Start trajectwaarschuwing voor weave.
---@param ... any Nog niet toegevoegd. Zie FRLua programming script user manual.
function WeaveInspectStart(...) end

--- Beëindigt trajectwaarschuwing voor weave.
---@param ... any Nog niet toegevoegd. Zie FRLua programming script user manual.
function WeaveInspectEnd(...) end

--- Laadt een TPD-trajectbestand.
---@param name string Trajectnaam.
function LoadTPD(name) end

--- Speelt een TPD-traject af.
---@param name string Trajectnaam.
---@param blend integer 0=zonder blend, 1=met blend.
---@param ovl number Snelheidspercentage.
function MoveTPD(name,blend,ovl) end

--- Schakelt algemene punt-offset in.
---@param flag integer Offsetcoördinatenstelsel.
---@param x number X-offset [mm].
---@param y number Y-offset [mm].
---@param z number Z-offset [mm].
---@param rx number Rx-offset [°].
---@param ry number Ry-offset [°].
---@param rz number Rz-offset [°].
function PointsOffsetEnable(flag,x,y,z,rx,ry,rz) end

--- Schakelt algemene punt-offset uit.
function PointsOffsetDisable() end

--- Start Servo aansturing.
function ServoMoveStart() end

--- Beëindigt Servo aansturing.
function ServoMoveEnd() end

--- Stuurt Cartesian servobeweging aan.
---@param mode integer [0] - absoluut base, [1] - incrementeel base, [2] - incrementeel tool.
---@param x number Cartesische positie of positie increment [mm].
---@param y number Cartesische positie of positie increment [mm].
---@param z number Cartesische positie of positie increment [mm].
---@param rx number Cartesische positie of positie increment [mm].
---@param ry number Cartesische positie of positie increment [mm].
---@param rz number Cartesische positie of positie increment [mm].
---@param pos_gainx number Proportionele correctiefactoren voor de positie en oriëntatie. Alleen actief bij incrementele beweging [0~1].
---@param pos_gainy number Proportionele correctiefactoren voor de positie en oriëntatie. Alleen actief bij incrementele beweging [0~1].
---@param pos_gainz number Proportionele correctiefactoren voor de positie en oriëntatie. Alleen actief bij incrementele beweging [0~1].
---@param pos_gainrx number Proportionele correctiefactoren voor de positie en oriëntatie. Alleen actief bij incrementele beweging [0~1].
---@param pos_gainry number Proportionele correctiefactoren voor de positie en oriëntatie. Alleen actief bij incrementele beweging [0~1].
---@param pos_gainrz number Proportionele correctiefactoren voor de positie en oriëntatie. Alleen actief bij incrementele beweging [0~1].
---@param exaxis_pos number Posities van externe assen 1 t/m 4. Standaardwaarde: {0.0, 0.0, 0.0, 0.0}.
---@param acc number Acceleratiepercentage [0~100%].
---@param vel number Snelheidspercentage [0~100%].
---@param cmdT number Aansturingscyclus [s]. Aanbevolen bereik: [0,001 ~ 0,0016 s].
---@param FilterT number Filtertijd [s].
---@param Gain number Proportionele versterkingsfactor voor het volgen van de doelpositie.
function ServoCart(mode,x,y,z,rx,ry,rz,pos_gainx,pos_gainy,pos_gainz,pos_gainrx,pos_gainry,pos_gainrz,exaxis_pos,acc,vel,cmdT,FilterT,Gain) end

--- Voert een servo-beweging uit in de gewrichtsruimte.
---@param j1 number Jointpositie van het doelpunt [°].
---@param j2 number Jointpositie van het doelpunt [°].
---@param j3 number Jointpositie van het doelpunt [°].
---@param j4 number Jointpositie van het doelpunt [°].
---@param j5 number Jointpositie van het doelpunt [°].
---@param j6 number Jointpositie van het doelpunt [°].
---@param ep1 number Positie van een externe as.
---@param ep2 number Positie van een externe as.
---@param ep3 number Positie van een externe as.
---@param ep4 number Positie van een externe as.
---@param acc number Acceleratiepercentage [0~100%].
---@param vel number Snelheidspercentage [0~100%].
---@param interval number Tijdsinterval tussen bewegingsopdrachten [s].
---@param filterTime number Filtertijd [s]. Momenteel nog niet beschikbaar.
---@param posGain number Schaalfactor voor de doelpositie. Momenteel nog niet beschikbaar.
function ServoJ(j1, j2, j3, j4, j5, j6, ep1, ep2, ep3, ep4, acc, vel, interval, filterTime, posGain) end

--- Laadt een vooraf opgenomen traject.
---@param name string Pad naar het trajectbestand.
function LoadTrajectory(name) end

--- Voert het opgegeven traject uit.
---@param name string Pad naar het trajectbestand.
---@param ovl number Snelheidspercentage [0~100%].
function MoveTrajectory(name,ovl) end

--- Voert een joint-/J-traject uit dat vooraf is geladen.
function MoveTrajectoryJ() end

--- Leest de startpose uit een trajectbestand.
---@param name string Pad naar het trajectbestand.
---@return table Pose {x,y,z,rx,ry,rz}.
function GetTrajectoryStartPose(name) end

--- Geeft het aantal trajectpunten terug.
---@return integer Aantal trajectpunten.
function GetTrajectoryPointNum() end

--- Leest het actieve toolcoördinatensysteemnummer.
---@param flag integer 0=blocking, 1=non-blocking volgens handleiding.
---@return integer Toolnummer.
function GetActualTCPNum(flag) end

--- Leest het actieve Werkstuknummer.
---@param flag integer 0=blocking, 1=non-blocking volgens handleiding.
---@return integer Werkstuknummer.
function GetActualWObjNum(flag) end

--- Punt-naar-puntbeweging in Cartesian-ruimte.
---@param desc_pos table Doelpositie {x,y,z,rx,ry,rz}.
---@param tool integer Toolnummer.
---@param user integer Werkstuknummer.
---@param vel number Snelheidspercentage [0~100%].
---@param acc number Acceleratiepercentage [0~100%].
---@param ovl number Snelheidspercentage [0~100%].
---@param blendT number [-1] - voor stoppen (blocking), [0~500] - blendtijd in [ms] (nonblocking).
---@param config integer [-1] – berekening op basis van de huidige gewrichtspositie, [0~7] – berekening op basis van de gewrichtsconfiguratie; standaardwaarde is [-1]
function MoveCart(desc_pos,tool,user,vel,acc,ovl,blendT,config) end

--- Voert een trajectimitatie uit vanaf een ingeleerd punt.
---@param point_name string Naam van het startpunt.
---@param ovl number Snelheidspercentage [0~100%].
function DMP(point_name,ovl) end

--- Voert DMP-trajectimitatie uit met opgegeven poses.
---@param joint_pos table Jointposities.
---@param desc_pos table Cartesian-pose.
---@param tool integer Toolnummer.
---@param user integer Werkstuknummer.
---@param vel number Snelheidspercentage [0~100%].
---@param acc number Acceleratiepercentage [0~100%].
---@param ovl number Snelheidspercentage [0~100%].
---@param exaxis_pos table Posities van externe assen.
function dmpMotion(joint_pos,desc_pos,tool,user,vel,acc,ovl,exaxis_pos) end

--- Start omzetting naar een werkstukcoördinatensysteem.
---@param id integer Werkstuknummer.
function WorkPieceTrsfStart(id) end

--- Beëindigt omzetting naar een werkstukcoördinatensysteem.
function WorkPieceTrsfEnd() end

--- Start omzetting naar een toolcoördinatensysteem.
---@param id integer Toolnummer.
function ToolTrsfStart(id) end

--- Beëindigt omzetting naar een toolcoördinatensysteem.
function ToolTrsfEnd() end

--- Selecteert de toolcoördinatensysteemtabel.
---@param name string Toolnummer.
function SetToolList(name) end

--- Selecteert de werkstukcoördinatensysteemtabel.
---@param name string Werkstuknummer.
function SetWObjList(name) end

--- Berekent een Cartesian-pose uit zes gewrichtsposities.
---@param j1 number Gewrichtspositie 1 [°].
---@param j2 number Gewrichtspositie 2 [°].
---@param j3 number Gewrichtspositie 3 [°].
---@param j4 number Gewrichtspositie 4 [°].
---@param j5 number Gewrichtspositie 5 [°].
---@param j6 number Gewrichtspositie 6 [°].
---@return number x, number y, number z, number rx, number ry, number rz
function GetForwardKin(j1,j2,j3,j4,j5,j6) end

--- Berekent gewrichtsposities uit een Cartesian-pose.
---@param type integer Coördinaten-/oplossingsmodus.
---@param x number X [mm].
---@param y number Y [mm].
---@param z number Z [mm].
---@param rx number Rx [°].
---@param ry number Ry [°].
---@param rz number Rz [°].
---@param config integer Joint configuratie.
---@return number j1, number j2, number j3, number j4, number j5, number j6
function GetInverseKin(type,x,y,z,rx,ry,rz,config) end

--- Inverse kinematica met referentiegewrichtspositie.
---@param type integer 0=absolute pose, 1=relatief base, 2=relatief tool.
---@param desc_pos table Cartesian-pose {x,y,z,rx,ry,rz}.
---@param joint_pos_ref table Referentiegewrichtsposities {j1..j6}.
---@return number j1, number j2, number j3, number j4, number j5, number j6
function GetInverseKinRef(type,desc_pos,joint_pos_ref) end

--- Controleert of inverse kinematica een oplossing heeft.
---@param type integer Posemodus.
---@param desc_pos table Cartesian-pose.
---@param joint_pos_ref table Referentiegewrichtsposities.
---@return boolean True als een oplossing bestaat.
function GetInverseKinHasSolution(type,desc_pos,joint_pos_ref) end

--- Schakelt naar een puntentabel.
---@param point_table_name string Bestandsnaam van de puntentabel, of lege string om uit te schakelen.
function PointTableSwitch(point_table_name) end

--- Stelt een digitale uitgang van de besturingskast in.
---@param id integer DO/CO-nummer.
---@param status integer [0/1] Uit / Aan.
---@param smooth integer [0] - na een vloeiende overgang, [1] - tijdens een vloeiende overgang.
---@param thread integer [0/1] Zonder Thread / Met Thread.
function SetDO(id,status,smooth,thread) end

--- Stelt een digitale uitgang niet-blokkerend in.
---@param id integer DO/CO-nummer.
---@param status integer [0/1] Uit / Aan.
function SPLCSetDO(id,status) end

--- Stelt een digitale tooluitgang blokkerend in.
---@param id integer Tool-DO-nummer.
---@param status integer [0/1] Uit / Aan.
---@param smooth integer [0] - na een vloeiende overgang, [1] - tijdens een vloeiende overgang.
---@param thread integer [0/1] Zonder Thread / Met Thread.
function SetToolDO(id,status,smooth,thread) end

--- Stelt een digitale tooluitgang niet-blokkerend in.
---@param id integer Tool-DO-nummer.
---@param status integer [0/1] Uit / Aan.
function SPLCSetToolDO(id,status) end

--- Leest een digitale ingang.
---@param id integer DI/CI-nummer.
---@param thread integer Threadmodus [0/1].
---@return integer Ingangsstatus [0/1].
function GetDI(id,thread) end

--- Niet-blokkerende controle van digitale ingang.
---@param ... any Nog niet toegevoegd. Zie FRLua programming script user manual.
function SPLCGetDI(...) end

--- Leest een digitale toolingang.
---@param id integer Tool-DI-nummer.
---@param thread integer Threadmodus [0/1].
---@return integer Ingangsstatus [0/1].
function GetToolDI(id,thread) end

--- Niet-blokkerende controle van digitale toolingang.
---@param ... any Nog niet toegevoegd. Zie FRLua programming script user manual.
function SPLCGetToolDI(...) end

--- Stelt een analoge uitgang van de besturingskast in.
---@param id integer AO-nummer.
---@param value number Waarde [%].
---@param thread integer [0/1] Zonder Thread / Met Thread.
function SetAO(id,value,thread) end

--- Stelt een analoge uitgang niet-blokkerend in.
---@param ... any Nog niet toegevoegd. Zie FRLua programming script user manual.
function SPLCSetAO(...) end

--- Stelt een analoge tooluitgang in.
---@param id integer Tool-AO-nummer.
---@param value number Waarde [%].
---@param thread integer [0/1] Zonder Thread / Met Thread.
function SetToolAO(id,value,thread) end

--- Stelt een analoge tooluitgang niet-blokkerend in.
---@param ... any Nog niet toegevoegd. Zie FRLua programming script user manual.
function SPLCSetToolAO(...) end

--- Leest een analoge ingang van de besturingskast.
---@param id integer AI-nummer.
---@param thread integer Threadmodus [0/1].
---@return number Ingangswaarde [0/1].
function GetAI(id,thread) end

--- Niet-blokkerende controle van analoge ingang.
---@param ... any Nog niet toegevoegd. Zie FRLua programming script user manual.
function SPLCGetAI(...) end

--- Leest een analoge toolingang.
---@param id integer Tool-AI-nummer.
---@param thread integer Threadmodus [0/1].
---@return number Ingangswaarde [0/1].
function GetToolAI(id,thread) end

--- Niet-blokkerende controle van analoge toolingang.
---@param ... any Nog niet toegevoegd. Zie FRLua programming script user manual.
function SPLCGetToolAI(...) end

---@param ... any Nog niet toegevoegd. Zie FRLua programming script user manual.
function SPLCDetToolAI(...) end

--- Stelt een gesimuleerde digitale ingang in.
---@param id integer Virtuele DI-nummer.
---@param status integer [0/1]. 
function SetVirtualDI(id,status) end

--- Stelt een gesimuleerde digitale toolingang in.
---@param id integer Virtuele tool-DI-nummer.
---@param status integer [0/1]. 
function SetVirtualToolDI(id,status) end

--- Leest een gesimuleerde digitale ingang.
---@param id integer Virtuele DI-nummer.
---@return integer Ingangsstatus.
function GetVirtualDI(id) end

--- Leest een gesimuleerde digitale toolingang.
---@param id integer Virtuele tool-DI-nummer.
---@return integer Ingangsstatus.
function GetVirtualToolDI(id) end

--- Stelt een gesimuleerde analoge ingang in.
---@param id integer Virtuele AI-nummer.
---@param value number Bijbehorende stroomwaarde [0~20 mA] of spanningswaarde [0~10 V].
function SetVirtualAI(id,value) end

--- Stelt een gesimuleerde analoge toolingang in.
---@param id integer Virtuele tool-AI-nummer.
---@param value number Bijbehorende stroomwaarde [0~20 mA] of spanningswaarde [0~10 V].
function SetVirtualToolAI(id,value) end

--- Leest een gesimuleerde analoge ingang.
---@param id integer Virtuele AI-nummer.
---@return number Ingangswaarde.
function GetVirtualAI(id) end

--- Leest een gesimuleerde analoge toolingang.
---@param id integer Virtuele tool-AI-nummer.
---@return number Ingangswaarde.
function GetVirtualToolAI(id) end

--- Start digitale DO-pulsen gekoppeld aan de beweging.
---@param ... any Nog niet toegevoegd. Zie FRLua programming script user manual.
function MoveDOStart(...) end

--- Beëindigt digitale DO-output tijdens beweging.
function MoveDOStop() end

--- Start tool-DO-pulsen gekoppeld aan de beweging.
---@param ... any Nog niet toegevoegd. Zie FRLua programming script user manual.
function MoveToolDOStart(...) end

--- Beëindigt tool-DO-output tijdens beweging.
function MoveToolDOStop() end

--- Start analoge uitgangsregeling op basis van TCP-snelheid.
---@param ... any Nog niet toegevoegd. Zie FRLua programming script user manual.
function MoveAOStart(...) end

--- Beëindigt analoge uitgangsregeling tijdens beweging.
function MoveAOStop() end

--- Start tool-AO-regeling op basis van TCP-snelheid.
---@param ... any Nog niet toegevoegd. Zie FRLua programming script user manual.
function MoveToolAOStart(...) end

--- Beëindigt tool-AO-regeling tijdens beweging.
function MoveToolAOStop() end

--- Bewegingsgerelateerde digitale uitgangsfunctie, indien aanwezig in de firmware.
---@param ... any Nog niet toegevoegd. Zie FRLua programming script user manual.
function MoveDO(...) end

--- Bewegingsgerelateerde analoge uitgangsfunctie, indien aanwezig in de firmware.
---@param ... any Nog niet toegevoegd. Zie FRLua programming script user manual.
function MoveAO(...) end

--- Configureert UDP-communicatie voor uitgebreide I/O.
---@param ip string IP-adres van de PLC.
---@param port integer Poort nummer.
---@param period integer Communicatiecyclus [ms].
function ExtDevSetUDPComParam(ip,port,period) end

--- Laadt de UDP-communicatiedriver voor uitgebreide I/O.
function ExtDevLoadUDPDriver() end

--- Stelt uitgebreide digitale uitgang in.
---@param ... any Nog niet toegevoegd. Zie FRLua programming script user manual.
function SetAuxDO(...) end

--- Leest uitgebreide digitale ingang.
---@param ... any Nog niet toegevoegd. Zie FRLua programming script user manual.
function GetAuxDI(...) end

--- Stelt uitgebreide analoge uitgang in.
---@param ... any Nog niet toegevoegd. Zie FRLua programming script user manual.
function SetAuxAO(...) end

--- Leest uitgebreide analoge ingang.
---@param ... any Nog niet toegevoegd. Zie FRLua programming script user manual.
function GetAuxAI(...) end

--- Wacht op een uitgebreide digitale ingang.
---@param ... any Nog niet toegevoegd. Zie FRLua programming script user manual.
function WaitAuxDI(...) end

--- Wacht op een uitgebreide analoge ingang.
---@param ... any Nog niet toegevoegd. Zie FRLua programming script user manual.
function WaitAuxAI(...) end

--- Stelt het botsingsniveau in.
---@param mode integer [0] - standaardniveau, [1] - aangepast percentage.
---@param level table [0~100] Botsingsniveau of [100] = uitgeschakeld.
---@param config integer [0/1] - Configuratiebestand bijwerken.
function SetAnticollision(mode,level,config) end

--- Stelt het acceleratiepercentage van de robot in.
---@param acc number Acceleratiepercentage.
function SetOaccScale(acc) end

--- Start versnellings-/blendoptimalisatie; beschikbaarheid hangt af van softwareversie.
--- Versieafhankelijk, handleiding 3.9.x.
---@param ... any Controleer de exacte firmware-signatuur.
function AccSmoothStart(...) end

--- Beëindigt versnellings-/blendoptimalisatie; beschikbaarheid hangt af van softwareversie.
--- Versieafhankelijk, handleiding 3.9.x.
function AccSmoothEnd() end

--- Activeert of reset een gripper.
---@param index integer Grippernummer.
---@param action integer 0=reset, 1=activeren.
function ActGripper(index,action) end

--- Stuurt gripperpositie, snelheid en kracht aan.
---@param index integer Grippernummer.
---@param pos number Positiepercentage 0..100.
---@param vel number Snelheidspercentage 0..100.
---@param force number Krachtpercentage 0..100.
---@param max_time integer Maximale wachttijd in ms.
---@param block integer Blokkeermodus volgens controller.
function MoveGripper(index,pos,vel,force,max_time,block) end

--- Start de spuitfunctie.
function SprayStart() end

--- Stopt de spuitfunctie.
function SprayStop() end

--- Start de reinigingsfunctie van het spuitpistool.
function PowerCleanStart() end

--- Stopt de reinigingsfunctie van het spuitpistool.
function PowerCleanStop() end

--- Stuurt externe as aan via UDP/PLC-modus.
---@param mode integer 0=asynchroon, 1=synchroon.
---@param name string Puntnaam.
---@param vel number Snelheidspercentage.
function EXT_AXIS_PTP(mode,name,vel) end

--- Beweegt externe as in joint-/J-modus.
---@param ... any Exacte parameters verschillen per externe-as-configuratie.
function ExtAxisMoveJ(...) end

--- Beweegt externe as in lineaire modus, indien beschikbaar.
---@param ... any Controleer firmware en externe-asconfiguratie.
function ExtAxisMoveL(...) end

--- Voert homing op een externe as uit.
---@param axisID integer Asnummer 1..4.
---@param mode integer Homingmodus.
---@param searchVel number Zoeksnelheid [mm/s].
---@param latchVel number Nulpositioneersnelheid [mm/s].
function ExtAxisHoming(axisID,mode,searchVel,latchVel) end

--- Schakelt servobesturing van een externe as in of uit.
---@param axisID integer Asnummer 1..4.
---@param status integer Status volgens firmware.
function ExtAxisServoOn(axisID,status) end

--- Selecteert de statusfeedback-ID voor een 485-uitbreidingsas.
---@param servoid integer Servo-ID.
function AuxServoSetStatusID(servoid) end

--- Schakelt de 485-uitbreidingsas in of uit.
---@param servoid integer Servo-ID 1..15.
---@param status integer 0=uit, 1=aan.
function AuxServoEnable(servoid,status) end

--- Stelt de besturingsmodus van een 485-uitbreidingsas in.
---@param servoid integer Servo-ID.
---@param mode integer 0=positie, 1=snelheid.
function AuxServoSetControlmode(servoid,mode) end

--- Voert homing uit voor een 485-uitbreidingsas.
---@param servoid integer Servo-ID.
---@param mode integer Homingmodus.
---@param searchVel number Zoeksnelheid [mm/s].
---@param latchVel number Nulpositioneersnelheid [mm/s].
function AuxServoHoming(servoid,mode,searchVel,latchVel) end

--- Stelt de doelpositie van een 485-uitbreidingsas in.
---@param servoid integer Servo-ID.
---@param pos number Doelpositie.
---@param speed number Snelheid.
function AuxServoSetTargetPos(servoid,pos,speed) end

--- Stelt de doelsnelheid van een 485-uitbreidingsas in.
---@param servoid integer Servo-ID.
---@param speed number Doelsnelheid.
function AuxServoSetTargetSpeed(servoid,speed) end

--- Detecteert een werkstuk op een transportband met I/O.
---@param max_t integer Maximale detectietijd [ms].
function ConveyorIODetect(max_t) end

--- Leest positiegegevens van de transportbandtracking.
---@param index integer Gegevens-/transportbandindex.
function ConveyorGetRackData(index) end

--- Start of stopt transportbandtracking.
---@param status integer 1=start, 0=stop.
function ConveyorTrackStart(status) end

--- Beëindigt transportbandtracking.
function ConveyorTrackEnd() end

--- Ontlaadt de communicatie-driver voor de polijstkop.
function PolishingUnloadComDriver() end

--- Laadt de communicatie-driver voor de polijstkop.
function PolishingLoadComDriver() end

--- Schakelt de polijstkop in of uit.
---@param status integer Status volgens fabrikantdriver.
function PolishingDeviceEnable(status) end

--- Wist foutmeldingen van de polijstkop.
---@param ... any Volgens polijstkopdriver.
function PolishingClearError(...) end

--- Nult de krachtsensor van de polijstkop.
function PolishingTorqueSensorReset() end

--- Stelt het toerental van de polijstkop in.
---@param rot number Toerental in omw/min.
function PolishingSetTargetVelocity(rot) end

--- Stelt de kracht van de polijstkop in.
---@param setN number Kracht in N.
function PolishingSetTargetTorque(setN) end

--- Stelt de uitschuifafstand van de polijstkop in.
---@param distance number Afstand in mm.
function PolishingSetTargetPosition(distance) end

--- Stelt de bedieningsmodus van de polijstkop in.
---@param mode integer Modus volgens polijstkopdriver.
function PolishingSetOperationMode(mode) end

--- Stelt de contactkracht van de polijstkop in.
---@param force number Contactkracht.
function PolishingSetTargetTouchForce(force) end

--- Stelt de overgangstijd naar contactkracht in.
---@param time number Tijd in ms.
function PolishingSetTargetTouchTime(time) end

--- Stelt het werkstukgewicht in voor de polijstkopregeling.
---@param weight number Gewicht volgens driverhandleiding.
function PolishingSetWorkPieceWeight(weight) end

--- Stelt de lasstroom in. De functienaam volgt de schrijfwijze uit voorbeelden in de handleiding.
---@param ioType integer 0=controller-I/O, 1=digitale communicatie.
---@param current number Lasstroomwaarde.
---@param blend integer Blend-/smoothinstelling.
---@param AOIndex integer AO-index.
function WeldingDictCurrent(ioType,current,blend,AOIndex) end

--- Stelt de lasspanning in volgens de voorbeeldcode in de handleiding.
---@param ioType integer 0=controller-I/O, 1=digitale communicatie.
---@param voltage number Spanning in V.
---@param blend integer Blend-/smoothinstelling.
---@param AOIndex integer AO-index.
function WeldSetVoltage(ioType,voltage,blend,AOIndex) end

--- Stelt de lasspanning in.
---@param ioType integer 0=controller-I/O, 1=digitale communicatie.
---@param voltage number Spanning in V.
---@param blend integer Blendinstelling.
---@param AOIndex integer AO-index.
function WeldingSetVoltage(ioType,voltage,blend,AOIndex) end

--- Schrijfwijze uit de prototypebeschrijving van de handleiding voor lasspanning.
---@param ioType integer I/O-type.
---@param voltage number Lasspanning.
---@param blend integer Blendinstelling.
---@param AOIndex integer AO-index.
function WeldingSetvoltage(ioType,voltage,blend,AOIndex) end

--- Start de lasboog.
---@param ioType integer 0=controller-I/O, 1=digitale communicatie.
---@param arcNum integer Lasprocesnummer.
---@param timeout integer Maximale wachttijd.
function ARCStart(ioType,arcNum,timeout) end

--- Beëindigt de lasboog.
---@param ioType integer 0=controller-I/O, 1=digitale communicatie.
---@param arcNum integer Lasprocesnummer.
---@param timeout integer Maximale wachttijd.
function ARCEnd(ioType,arcNum,timeout) end

--- Schakelt luchttoevoer in of uit.
---@param ioType integer 0=controller-I/O, 1=digitale communicatie.
---@param airControl integer 0=uit, 1=aan.
function SetAspirated(ioType,airControl) end

--- Schakelt draadaanvoer achteruit in of uit.
---@param ioType integer I/O-type.
---@param wireFeed integer 0=stop, 1=aan.
function SetReverseWireFeed(ioType,wireFeed) end

--- Schakelt draadaanvoer vooruit in of uit.
---@param ioType integer I/O-type.
---@param wireFeed integer 0=stop, 1=aan.
function SetForwardWireFeed(ioType,wireFeed) end

--- Schrijfwijze zoals in de prototypekop van de handleiding.
---@param ioType integer I/O-type.
---@param wireFeed integer 0=stop, 1=aan.
function SetForwardwireFeed(ioType,wireFeed) end

--- Configureert boogvolg-/naadtracking tijdens lassen.
---@param ... any Veel parameters; gebruik de officiële signatuur van jouw lasapplicatie.
function ArcWeldTraceControl(...) end

--- Start replay/compensatie voor meerlagen- en meerpasslassen.
function ArcWeldTraceReplayStart() end

--- Beëindigt replay/compensatie voor meerlagen- en meerpasslassen.
function ArcWeldTraceReplayEnd() end

--- Berekent de offset voor meerlagen-/meerpasslassen.
---@param ... any Zie officiële MultiLayer/Multiplayer-signatuur.
function MultiplayerOffsetTrsfToBase(...) end

--- Laadt de driver voor een positielasersensor.
---@param choiceid integer Functieselectie/driver-ID.
function LoadPosSensorDriver(choiceid) end

--- Ontlaadt de driver voor een positielasersensor.
---@param choiceid integer Driver-ID.
function UnloadPosSensorDriver(choiceid) end

--- Schakelt lasertracking in.
---@param ... any Controleer parameters van de sensor/firmware.
function LTTrackOn(...) end

--- Schakelt lasertracking uit.
function LTTrackOff() end

--- Schakelt de laser in.
function LTLaserOn() end

--- Schakelt de laser uit.
function LTLaserOff() end

--- Regelt laserdata-opname of trajectreplay.
---@param features integer Functieselectie volgens handleiding.
---@param time number Tijdparameter.
---@param speed number Snelheidsparameter.
function LaserSensorRecord(features,time,speed) end

--- Start een laserzoek-/positioneeractie.
---@param ... any Zie sensorhandleiding voor parameters.
function LTSearchStart(...) end

--- Beëindigt de laserzoekactie.
function LTSearchStop() end

--- Speelt lasertrackingtraject af.
function MoveLTR() end

--- Beweegt naar het beginpunt van de opgenomen lasnaad.
function MoveToLaserRecordStart() end

--- Beweegt naar het eindpunt van de opgenomen lasnaad.
function MoveToLaserRecordEnd() end

--- Wacht op het resultaat van draadpositionering.
---@param name string Resultaat-/referentienaam.
function WireSearchWait(name) end

--- Beëindigt draadpositionering.
---@param refPos any Referentiepositie.
---@param searchVel number Zoeksnelheid [mm/s].
---@param searchDis number Zoekafstand [mm].
---@param autoBackFlag integer Automatisch terugkeren.
---@param autoBackVel number Terugkeersnelheid [mm/s].
---@param autoBackDis number Terugkeerafstand [mm].
---@param offectFlag integer 1=offset, 2=zoek teachpoint-locatie.
function WireSearchEnd(refPos,searchVel,searchDis,autoBackFlag,autoBackVel,autoBackDis,offectFlag) end

--- Berekent offset uit het draadzoekresultaat.
---@param ... any Zie officiële signatuur voor referentie- en resultaatnamen.
function GetWireSearchOffset(...) end

--- Schakelt houdingsaanpassing voor las-/plaatvolging in.
---@param plate_type integer Plaattype volgens handleiding.
---@param direction_type any Richtingsconfiguratie.
---@param time number Aanpassingstijd [ms].
---@param paDistance_1 number Segmentlengte [mm].
---@param inflection_type integer Type inflectiepunt.
---@param paDistance_2 number Segmentlengte [mm].
---@param paDistance_3 number Segmentlengte [mm].
---@param paDistance_4 number Segmentlengte [mm].
---@param paDistance_5 number Segmentlengte [mm].
function PostureAdjustOn(plate_type,direction_type,time,paDistance_1,inflection_type,paDistance_2,paDistance_3,paDistance_4,paDistance_5) end

--- Schakelt houdingsaanpassing uit.
function PostureAdjustOff() end

--- Configureert kracht-/momentgebaseerde botsingsdetectie.
---@param ... any Parameters omvatten zes vrijheidsgraden, selecties en grenswaarden.
function FT_Guard(...) end

--- Schakelt constante krachtregeling in of uit.
---@param ... any Sensor-, asselectie-, kracht-, gain- en grenswaarden; raadpleeg handleiding.
function FT_Control(...) end

--- Voert spiraalvormige krachtgestuurde invoeging uit.
---@param rcs integer 0=tool, 1=base.
---@param dr number Radiusstap per omwenteling [mm].
---@param ft any Kracht-/momentdrempel.
---@param max_t_ms integer Maximale tijd [ms].
---@param max_vel number Maximale snelheid [mm/s].
function FT_SpiralSearch(rcs,dr,ft,max_t_ms,max_vel) end

--- Voert roterende invoeging uit.
---@param rcs integer Referentiecoördinatenstelsel.
---@param angVelRot number Hoeksnelheid [°/s].
---@param ft number Kracht-/momentdrempel.
---@param maxAngle number Maximale hoek [°].
---@param orn integer Richting/askeuze.
---@param max_angAcc number Maximale hoekversnelling.
---@param rotorn integer Draairichting.
function FT_RotInsertion(rcs,angVelRot,ft,maxAngle,orn,max_angAcc,rotorn) end

--- Voert lineaire invoeging uit op basis van kracht.
---@param rcs integer 0=tool, 1=base.
---@param ft number Kracht-/momentdrempel.
---@param lin_v number Lineaire snelheid [mm/s].
---@param lin_a number Lineaire versnelling [mm/s²].
---@param dismax number Maximale invoegafstand [mm].
---@param linorn integer 0=negatieve richting, 1=positieve richting.
function FT_LinInsertion(rcs,ft,lin_v,lin_a,dismax,linorn) end

--- Zoekt een oppervlak met krachtregeling.
---@param rcs integer 0=tool, 1=base.
---@param dir integer 1=positief, 2=negatief.
---@param axis integer 1=X, 2=Y, 3=Z.
---@param lin_v number Zoeksnelheid [mm/s].
---@param lin_a number Zoekversnelling [mm/s²].
---@param dismax number Maximale zoekafstand [mm].
---@param ft number Stopkracht [N].
function FT_FindSurface(rcs,dir,axis,lin_v,lin_a,dismax,ft) end

--- Start berekening van het middenvlak/-centrum voor krachtregeling.
function FT_CalCenterStart() end

--- Beëindigt de berekening van het middenvlak/-centrum.
---@return table Pose Cartesian-pose van het berekende centrum.
function FT_CalCenterEnd() end

--- Voert krachtgestuurde tik-/contactdetectie uit.
---@param ft number Kracht-/momentdrempel.
---@param lin_v number Lineaire snelheid [mm/s].
---@param lin_a number Lineaire versnelling [mm/s²].
---@param dismax number Maximale afstand [mm].
function FT_Click(ft,lin_v,lin_a,dismax) end

--- Start compliance-/soepele krachtregeling.
---@param ... any Parameters volgens firmware.
function FT_ComplianceStart(...) end

--- Beëindigt compliance-/soepele krachtregeling.
function FT_ComplianceStop() end

--- Start kracht-/momentregistratie en botsingsdetectie.
---@param flag integer 0=zonder smoothing, 1=met smoothing.
---@param negativevalues table Negatieve drempels per gewricht.
---@param positivevalues table Positieve drempels per gewricht.
---@param collisionTime table Detectieduur per gewricht.
function TorqueRecordStart(flag,negativevalues,positivevalues,collisionTime) end

--- Beëindigt kracht-/momentregistratie.
function TorqueRecordEnd() end

--- Reset de kracht-/momentregistratie.
function TorqueRecordReset() end

--- Schrijft digitale uitgangsregisters via Modbus TCP-master.
---@param Modbus_name string Naam van de Modbus-master.
---@param Register_name string DO-registratienaam.
---@param Register_num integer Aantal registers.
---@param Register_value table Waarden per register.
function ModbusMasterWriteDO(Modbus_name,Register_name,Register_num,Register_value) end

--- Leest digitale uitgangsregisters via Modbus TCP-master.
---@param Modbus_name string Naam van de Modbus-master.
---@param Register_name string DO-registratienaam.
---@param Register_num integer Aantal registers.
---@return any Een of meer registerwaarden.
function ModbusMasterReadDO(Modbus_name,Register_name,Register_num) end

--- Leest digitale ingangen via Modbus TCP-master.
---@param Modbus_name string Naam van de Modbus-master.
---@param Register_name string DI-registratienaam.
---@param Register_num integer Aantal registers.
---@return any Een of meer registerwaarden.
function ModbusMasterReadDI(Modbus_name,Register_name,Register_num) end

--- Schrijft analoge uitgangsregisters via Modbus TCP-master.
---@param Modbus_name string Naam van de Modbus-master.
---@param Register_name string AO-registratienaam.
---@param Register_num integer Aantal registers.
---@param Register_value table Waarden per register.
function ModbusMasterWriteAO(Modbus_name,Register_name,Register_num,Register_value) end

--- Leest analoge uitgangs-/hold-registers via Modbus TCP-master.
---@param Modbus_name string Naam van de Modbus-master.
---@param Register_name string AO-registratienaam.
---@param Register_num integer Aantal registers.
---@return any Een of meer registerwaarden.
function ModbusMasterReadAO(Modbus_name,Register_name,Register_num) end

--- Wacht op een digitale ingang via Modbus TCP-master.
---@param Modbus_name string Naam van de Modbus-master.
---@param Register_name string DI-registratienaam.
---@param Waiting_state integer Verwachte toestand.
---@param Waiting_time integer Timeout [ms].
function ModbusMasterWaitDI(Modbus_name,Register_name,Waiting_state,Waiting_time) end

--- Wacht op een analoge waarde via Modbus TCP-master.
---@param Modbus_name string Naam van de Modbus-master.
---@param Register_name string AI-registratienaam.
---@param Waiting_state integer Vergelijkingsrichting.
---@param Register_value number Drempelwaarde.
---@param Waiting_time integer Timeout [ms].
function ModbusMasterWaitAI(Modbus_name,Register_name,Waiting_state,Register_value,Waiting_time) end

--- Schrijft digitale uitgangsregisters via Modbus TCP-slave.
---@param Register_name string DO-registratienaam.
---@param Register_num integer Aantal registers.
---@param Register_value table Waarden per register.
function ModbusSlaveWriteDO(Register_name,Register_num,Register_value) end

--- Leest digitale uitgangsregisters via Modbus TCP-slave.
---@param Register_name string DO-registratienaam.
---@param Register_num integer Aantal registers.
---@return any Een of meer registerwaarden.
function ModbusSlaveReadDO(Register_name,Register_num) end

--- Leest digitale ingangen via Modbus TCP-slave.
---@param Register_name string DI-registratienaam.
---@param Register_num integer Aantal registers.
---@return any Een of meer registerwaarden.
function ModbusSlaveReadDI(Register_name,Register_num) end

--- Schrijft analoge uitgangen via de Modbus-slave-interface, met de parameters uit jouw bestaande bestand.
--- Signatuur behouden uit de aangeleverde fairino.lua; controleer deze in de documentatie van jouw firmware.
---@param offset any Register- of offsetparameter zoals door jouw controller verwacht.
---@param mode any Modusparameter volgens jouw FAIRINO-firmware.
---@param values table Waarden die geschreven worden.
function ModbusSlaveWriteAO(offset,mode,values) end

--- Leest analoge uitgangsregisters via Modbus TCP-slave.
---@param Register_name string AO-registratienaam.
---@param Register_num integer Aantal registers.
---@return any Een of meer registerwaarden.
function ModbusSlaveReadAO(Register_name,Register_num) end

--- Leest analoge ingangsregisters via de Modbus-slave-interface, behouden uit de bestaande library.
---@param ... any Controleer exacte signatuur op jouw controller/firmware.
function ModbusSlaveReadAI(...) end

--- Wacht op een digitale ingang via Modbus TCP-slave.
---@param Register_name string DI-registratienaam.
---@param Waiting_state integer Verwachte toestand.
---@param Waiting_time integer Timeout [ms].
function ModbusSlaveWaitDI(Register_name,Waiting_state,Waiting_time) end

--- Wacht op een analoge waarde via Modbus TCP-slave.
---@param Register_name string AI-registratienaam.
---@param Waiting_state integer Vergelijkingsrichting.
---@param Register_value number Drempelwaarde.
---@param Waiting_time integer Timeout [ms].
function ModbusSlaveWaitAI(Register_name,Waiting_state,Register_value,Waiting_time) end

--- Leest registers via Modbus RTU.
---@param fun_code integer Modbus-functiecode.
---@param reg_add integer Registeradres.
---@param reg_num integer Aantal registers.
---@param add integer Slave-/adresinstelling.
---@param isthread integer 0=zonder thread, 1=met thread.
function ModbusRegRead(fun_code,reg_add,reg_num,add,isthread) end

--- Leest de resultaten van een eerdere Modbus RTU-registeropdracht.
---@param reg_num integer Aantal registers.
---@param isthread integer 0=zonder thread, 1=met thread.
---@return table Registerwaarden.
function ModbusRegGetData(reg_num,isthread) end

--- Schrijft registers via Modbus RTU.
---@param fun_code integer Modbus-functiecode.
---@param reg_add integer Registeradres.
---@param reg_num integer Aantal registers.
---@param reg_value table Waarden om te schrijven.
---@param add integer Slave-/adresinstelling.
---@param isthread integer 0=zonder thread, 1=met thread.
function ModbusRegWrite(fun_code,reg_add,reg_num,reg_value,add,isthread) end

--- Roept op afstand een XML-RPC-functie aan.
---@param url string Server-URL.
---@param func string Functienaam op afstand.
---@param type integer 1=double-array, 2=string-array volgens handleiding.
---@param func_Para table Parameters voor de externe functie.
function XmlrpcClientCall(url,func,type,func_Para) end

--- Schrijfwijze uit voorbeelden van de handleiding voor XML-RPC-aanroepen.
---@param ... any Parameters volgens de controller.
function xmlrpcclientcall(...) end

--- Start een extra Lua-thread voor bijvoorbeeld communicatie met externe apparatuur.
---@param func_name function Functie die de thread uitvoert.
---@param func_Para table Argumenten voor de functie.
function NewAuxThread(func_name,func_Para) end

--- Opent een socketverbinding volgens de controllerinterface.
---@param ip string IP-adres van de server.
---@param port integer TCP/UDP-poort.
---@param socket_name string Socket-ID.
function SocketOpen(ip,port,socket_name) end

--- Verstuurt tekst via een eerder geopende socket.
---@param message string Te versturen tekst.
---@param socket_name string Socket-ID.
---@param thread integer Threadmodus.
function SocketSendString(message,socket_name,thread) end

--- Leest ASCII-data als floatwaarden van een socket.
---@param count integer Aantal waarden.
---@param socket_name string Socket-ID.
---@param thread integer Threadmodus.
---@return any Status en/of ontvangen waarden volgens controller.
function SocketReadAsciiFloat(count,socket_name,thread) end
