------------------------------------------------------------
-- 01 | PROJECT INFORMATION
------------------------------------------------------------

-- Machine : Robot Inpakker
-- Project : 25.058
-- Cobot   : FR5
-- Version : 1.00
-- Author  : Tycho

------------------------------------------------------------
-- 02 | VARIABLES & SETTINGS
------------------------------------------------------------

Speed = 85
Lowspeed = 20
Fastspeed = 90
Height_Offset1 = -160 -- Hoogte offset Kleine Flessen laag 1
Height_Offset2 = -319 -- Hoogte offset Kleine Flessen laag 2
Loop1 = 1
Loop2 = 0
Loop3 = 0
Loop4 = 0

-- State 0 = wachten op doos
-- State 1 = Doos aanwezig
--
-- Program 0 = grote flessen
-- Program 1 = kleine flessen
--
-- Pattern = positie in doos
-- Laag = huidige laag
-- Loop1 = aantal geplaatste flessen
-- Loop4   = rij-index voor de Z-offset
-- OffsetZ2 = hoogtecorrectie per rij


------------------------------------------------------------
-- 03 | FUNCTIONS
------------------------------------------------------------

-------------------------------
--  MOVEMENTS GROTE FLESSEN
-------------------------------

function ToPickup() 
    PTP(2 Voor flip pos,100,-1,0)
    PTP(2 voor pak pos2,100,-1,0)
    --if ActieveDoos == 1 then
        PTP(2 Pak pos2,100,-1,2,PickUp_Offset,0,0,0,0,0)
    --else
       -- PTP(2 Pak pos2,100,-1,2,(PickUp_Offset - 15),0,0,0,0,0)
   -- end
    SetDO(4,1,0,0)
    WaitMs(400)
end
function ToDoos1()
    WaitMs(200)
    Lin(2 Boven gepakt,100,-1,0,0,0,100,200)
    ModbusSlaveWriteAO(AO2_Band,1,{0});
    PTP(2 Voor flip pos,100,-1,0)
    PTP(2 voor draai doos 1,100,-1,0)
    PTP(2 draai doos 1,100,-1,0)    
    PTP(2 boven drop 1-midden,100,-1,0)
end

-------------------------------
--  MOVEMENTS KLEINE FLESSEN
-------------------------------

function PickupBottles()
PTP(1_midden pos_3,Speed,20,0)
PTP(1_Voor pak pos_1,Speed,-1,2,0,PickUp_Offset,0,0,0,0)        
PTP(1_Pak pos_2,Speed,-1,2,0,PickUp_Offset,0,0,0,0)
SetDO(4,1,0,0)
WaitMs(1000)
PTP(1_midden pos_3,Speed,20,0)
ModbusSlaveWriteAO(AO2_Band,1,{0});
PTP(1_voor draai pos_4,Speed,20,0)
PTP(1_draai pos_5,Speed,20,0)
SetDO(7,1,0,0)
WaitMs(1000)
SetDO(4,0,0,0)
SetDO(5,1,0,0)
WaitMs(1500)
PTP(1_voor draai pos_4,Speed,20,0)
SetDO(5,0,0,0)
if Tooldraai == 1 then
    PTP(1_tool draai_6,Speed,50,0)
    PTP(1_Voor onder pak pos_7,Speed,20,0)
    SetAnticollision(0,{100,100,100,100,100,100},1)
    PTP(1_Onder pak pos_8,Fastspeed,20,2,0,0,0,0,0,0) 
    SetDO(7,0,0,0)
    SetDO(4,1,0,0)
    SetDO(8,1,0,0)
    WaitMs(1000)
    PTP(1_los_pos_9,20,100,0) 
    SetAnticollision(0,{6,6,6,6,6,6},1);
else 
    PTP(1_tool draai2_6,Speed,20,0)
    PTP(1_Voor onder pak pos2_7,Speed,20,0)
    SetAnticollision(0,{100,100,100,100,100,100},1)
    PTP(1_Onder pak pos2_8,Speed,20,2,0,0,0,0,0,0)
    SetDO(7,0,0,0)
    SetDO(8,1,0,0)
    SetDO(4,1,0,0)
    WaitMs(1500)
    PTP(1_Voor onder pak pos2_7,20,20,0)
    SetAnticollision(0,{6,6,6,6,6,6},1);
    SetDO(8,0,0,0)
    PTP(1_tool draai2_6,Speed,20,0)
    PTP(1_tool draai_6,Speed,50,0)
end
PTP(1_voor flip pos_10,Lowspeed,20,0)
SetDO(8,0,0,0)
PTP(1_flip pos_11,Fastspeed,20,0)
end

-------------------------------
--  FUNCTIONS GROTE FLESSEN
-------------------------------

function OffsetUpdate1()
    ReadModbus()
    Pattern = (Loop1 + 1) % 2    -- Bepaal het patroon: 0, 1, 0, 1, ...
    Loop4 = math.floor((Loop1 - 1) / 2) -- Verhoog de rij-index na iedere twee flessen
    OffsetZ2 = (-73) * Loop4
    ModbusSlaveWriteAO(AO19_OffsetZ2,1,{OffsetZ2});
end

-------------------------------
--  FUNCTIONS KLEINE FLESSEN
-------------------------------

function OffsetUpdate2()
ReadModbus()

PositieInLaag = ((Loop1 - 1) % 9) + 1

    if PositieInLaag < 3 then
        Pattern = 1
        Loop2 = PositieInLaag - 1
    elseif PositieInLaag == 3 then
        Pattern = 2
        Tooldraai = 1
    else
        Pattern = 3
        Tooldraai = 1
        Loop3 = PositieInLaag - 4
    end

OffsetY = (-69.5) * Loop2
OffsetY2 = 68.5 * Loop3
ModbusSlaveWriteAO(AO8_Tooldraai,1,{Tooldraai});
ModbusSlaveWriteAO(AO16_OffsetY,1,{OffsetY});
ModbusSlaveWriteAO(AO17_OffsetY2,1,{OffsetY2});
ModbusSlaveWriteAO(AO6_Pattern,1,{Pattern});
end

------------------------------------------------------------
-- 04 | IO / MODBUS FUNCTIES
------------------------------------------------------------

function ReadModbus()
    Program = ModbusSlaveReadAI(AI0_Program,1);
    Laag = ModbusSlaveReadAO(AO7_Laag,1)
    OffsetY = ModbusSlaveReadAO(AO16_OffsetY,1)
    OffsetY2 = ModbusSlaveReadAO(AO17_OffsetY2,1)
    WaitMs(50)
    OffsetZ2 = ModbusSlaveReadAO(AO19_OffsetZ2,1)
    Pattern = ModbusSlaveReadAO(AO6_Pattern,1)
    Tooldraai = ModbusSlaveReadAO(AO8_Tooldraai,1)
    WaitMs(50)
    Loop1 = ModbusSlaveReadAO(AO5_Loop,1)
    State = ModbusSlaveReadAO(AO4_State,1) 
    ActieveDoos = ModbusSlaveReadAO(AO9_ActieveDoos,1)
    LaatsteDoos = ModbusSlaveReadAO(AO10_LaatsteDoos,1)
    PickUp_Offset = ModbusSlaveReadAI(AI16,1);
end
function WriteModbus()
    ModbusSlaveWriteAO(AO7_Laag,1,{Laag});
    ModbusSlaveWriteAO(AO17_OffsetY2,1,{OffsetY2});
    ModbusSlaveWriteAO(AO6_Pattern,1,{Pattern});
    ModbusSlaveWriteAO(AO8_Tooldraai,1,{Tooldraai});
    ModbusSlaveWriteAO(AO5_Loop,1,{Loop1});
    ModbusSlaveWriteAO(AO7_Laag,1,{Laag});
    ModbusSlaveWriteAO(AO16_OffsetY,1,{OffsetY});
    ModbusSlaveWriteAO(AO19_OffsetZ2,1,{OffsetZ2});
end

------------------------------------------------------------
-- 06 | MAIN PROGRAM
------------------------------------------------------------

while (1) do
-- Maak loop altijd 1  
    ReadModbus()
    if Loop1 == 0 then
        Loop1 = 1
        ModbusSlaveWriteAO(AO5_Loop,1,{Loop1});
    end
------------------------------------------------
--           GROTE FLESSEN PROGRAMMA
------------------------------------------------

    if State == 1 and Program == 0 then
        ReadModbus()
        if Loop1 == 15 then -- Doos vol reset all
                OffsetZ2 = 0
                ModbusSlaveWriteAO(AO19_OffsetZ2,1,{0});
                ModbusSlaveWriteAO(AO10_LaatsteDoos,1,{ActieveDoos});
                ModbusSlaveWriteAO(AO9_ActieveDoos,1,{0});
                ModbusSlaveWriteAO(AO4_State,1,{0});
                ModbusSlaveWriteAO(AO5_Loop,1,{1});
                ModbusSlaveWriteAO(AO6_Pattern,1,{0});
        end
------------------------------------------------
--                  DOOS 1
------------------------------------------------
            OffsetUpdate1()
            if ActieveDoos == 1 and ModbusSlaveReadAO(AO2_Band,1) == 1 then   -- robot wacht op band vol signaal.
                if Pattern == 0 then
                    ToPickup()
                    ToDoos1()
                    Lin(2 in_doos1-midden,100,-1,0,2,0,0,OffsetZ2,0,0,0,0,100,200)
                    Lin(2 in_doos1-1-boven,100,-1,0,2,0,0,OffsetZ2,0,0,0,0,100,200)
                    Lin(2 in_doos1-1,100,-1,0,2,0,0,OffsetZ2,0,0,0,0,100,200)
                    SetDO(4,0,0,0)
                    SetDO(5,1,0,0)
                    WaitMs(500)
                    Lin(2 in_doos1-1-boven,100,-1,0,2,0,0,OffsetZ2,0,0,0,0,100,200)
                    Lin(2 boven drop 1-1,100,-1,0,0,0,100,200)
                    SetDO(5,0,0,0)
                    PTP(2 draai doos 1,100,-1,0)
                    PTP(2 Voor flip pos,100,-1,0)
                    ModbusSlaveWriteAO(AO5_Loop,1,{Loop1 + 1})
                elseif Pattern == 1 then
                    ToPickup()
                    ToDoos1()
                    Lin(in_Doos,100,-1,0,2,0,0,Offs1etZ2,0,0,0,0,100,200)
                    Lin(2 in_doos1-2-boven,100,-1,0,2,0,0,OffsetZ2,0,0,0,0,100,200)
                    Lin(2 in_doos1-2,100,-1,0,2,0,0,OffsetZ2,0,0,0,0,100,200)
                    SetDO(4,0,0,0)
                    SetDO(5,1,0,0)
                    WaitMs(500)
                    Lin(2 in_doos1-2-boven,100,-1,0,2,0,0,OffsetZ2,0,0,0,0,100,200)
                    Lin(2 boven drop 1-2,100,-1,0,0,0,100,200)
                    SetDO(5,0,0,0)
                    Lin(2 boven drop 1-1,100,-1,0,0,0,100,200)
                    PTP(2 draai doos 1,100,-1,0)
                    PTP(2 Voor flip pos,100,-1,0)
                    ModbusSlaveWriteAO(AO5_Loop,1,{Loop1 + 1})
                end
            end
------------------------------------------------
--                  DOOS 2
------------------------------------------------
            if ActieveDoos == 2 and ModbusSlaveReadAO(AO2_Band,1) == 1 then  
                if Pattern == 1 then
                    ToPickup()
                    Lin(2 Boven gepakt,100,-1,0,0,0,100,200)
                    ModbusSlaveWriteAO(AO2_Band,1,{0});
                    PTP(2 Voor flip pos,100,-1,0)
                    PTP(2 flip pos,100,-1,0)
                    PTP(2 boven drop 2-midden,100,-1,0)
                    Lin(2 in_doos2-midden,100,-1,0,2,0,0,OffsetZ2,0,0,0,0,100,200)
                    Lin(2 in_doos2-1-boven,100,-1,0,2,-2,0,OffsetZ2,0,0,0,0,100,200)
                    Lin(2 in_doos2-1,100,-1,0,2,-2,0,OffsetZ2,0,0,0,0,100,200)
                    SetDO(4,0,0,0)
                    SetDO(5,1,0,0)
                    WaitMs(500)
                    Lin(2 in_doos2-1-boven,100,-1,0,2,-2,0,OffsetZ2,0,0,0,0,100,200)
                    Lin(2 boven drop2-1,100,-1,0,0,0,100,200)
                    SetDO(5,0,0,0)
                    PTP(2 flip pos,100,-1,0)
                    PTP(2 Voor flip pos,100,-1,0)
                    ModbusSlaveWriteAO(AO5_Loop,1,{Loop1 + 1})    
                elseif Pattern == 0 then
                    ToPickup()
                    Lin(2 Boven gepakt,100,-1,0,0,0,100,200)
                    ModbusSlaveWriteAO(AO2_Band,1,{0});
                    PTP(2 Voor flip pos,100,-1,0)
                    PTP(2 flip pos,100,-1,0)
                    PTP(2 boven drop 2-midden,100,-1,0)
                    Lin(2 in_doos2-midden,100,-1,0,2,0,0,OffsetZ2,0,0,0,0,100,200)
                    Lin(2 in_doos2-2-boven,100,-1,0,2,4,0,OffsetZ2,0,0,0,0,100,200)
                    Lin(2 in_doos2-2,100,-1,0,2,4,0,(OffsetZ2 + 5),0,0,0,0,100,200)
                    SetDO(4,0,0,0)
                    SetDO(5,1,0,0)
                    WaitMs(500)
                    Lin(2 in_doos2-2-boven,100,-1,0,2,4,0,OffsetZ2,0,0,0,0,100,200)
                    Lin(2 boven drop2-2,100,-1,0,0,0,100,200)
                    SetDO(5,0,0,0)
                    PTP(2 flip pos,100,-1,0)
                    PTP(2 Voor flip pos,100,-1,0)
                    ModbusSlaveWriteAO(AO5_Loop,1,{Loop1 + 1})
                end
            end
        end
------------------------------------------------
--           KLEINE FLESSEN PROGRAMMA
------------------------------------------------
        if State == 1 and Program == 1 then
            -- Laag veranderingen
            ReadModbus()
            OffsetUpdate2()
            Loop1 = ModbusSlaveReadAO(AO5_Loop,1)
            if Loop1 >= 1 and Loop1 < 10 then
                ModbusSlaveWriteAO(AO7_Laag,1,{0})
            elseif Loop1 >= 10 and Loop1 < 19 then
                ModbusSlaveWriteAO(AO7_Laag,1,{1})
            elseif Loop1 >= 19 and Loop1 < 28 then
                ModbusSlaveWriteAO(AO7_Laag,1,{2})
            elseif Loop1 >= 28 then
                ModbusSlaveWriteAO(AO7_Laag,1,{0})
                ModbusSlaveWriteAO(AO10_LaatsteDoos,1,{ActieveDoos});
                ModbusSlaveWriteAO(AO9_ActieveDoos,1,{0});
                ModbusSlaveWriteAO(AO4_State,1,{0});
                ModbusSlaveWriteAO(AO5_Loop,1,{1})
                ModbusSlaveWriteAO(AO6_Pattern,1,{0});
                ReadModbus()
            end
------------------------------------------------
--           FLESSEN PICKUP / OFFSET 
------------------------------------------------
            if ModbusSlaveReadAO(AO2_Band,1) == 1 and ActieveDoos > 0 then
                PickupBottles()
                Inpakken = 1
            end
------------------------------------------------
--                  DOOS 2
------------------------------------------------
            WaitMs(200)
            ReadModbus()
            if ActieveDoos == 2 and Pattern == 3 and Inpakken == 1 then 
            -- Laatste rij verandering
                if Loop1 == 9 then
                    OffsetY2 = OffsetY2 - 22
                    OffsetRot = -10
                elseif Loop1 == 18 then
                    OffsetY2 = OffsetY2 - 22
                    OffsetRot = -10
                elseif Loop1 == 27 then
                    OffsetY2 = OffsetY2 - 24
                    OffsetRot = -10
                 else
                    OffsetRot = -2
                end
                PTP(Boven doos 2-3,Speed,-1,2,0,OffsetY2,0,0,0,0)
                if Laag == 0 then
                    Lin(drop doos 2-3,Speed,-1,0,2,0,OffsetY2,0,0,0,0,OffsetRot,100,200)
                elseif Laag == 1 then
                    Lin(drop doos 2-3,Speed,-1,0,2,0,OffsetY2,Height_Offset1,0,0,0,OffsetRot,100,200)
                elseif Laag == 2 then
                    Lin(drop doos 2-3,Speed,-1,0,2,0,OffsetY2,Height_Offset2,0,0,0,OffsetRot,100,200) 
                end
                SetDO(4,0,0,0)
                SetDO(5,1,0,0)
                WaitMs(500)
                Lin(Boven doos 2-3,Fastspeed,-1,0,2,0,OffsetY2,0,0,0,0,0,100,200)
                SetDO(5,0,0,0)
                PTP(1_flip pos_11,Fastspeed,20,0)
                PTP(1_voor flip pos_10,Speed,20,0)
                PTP(1_midden pos_3,Speed,20,0)
                Inpakken = 0
                ModbusSlaveWriteAO(AO5_Loop,1,{Loop1 + 1})
            elseif ActieveDoos == 2 and Pattern == 2 and Inpakken == 1 then
                PTP(boven doos 2-2,Speed,20,2,0,0,0,0,0,0)
                if Laag == 0 then
                    Lin(drop doos 2-2,Speed,-1,0,2,0,-20,0,0,0,0,0,100,200)
                elseif Laag == 1 then
                    Lin(drop doos 2-2,Speed,-1,0,2,0,-20,Height_Offset1,0,0,0,0,100,200)   
                elseif Laag == 2 then
                    Lin(drop doos 2-2,Speed,-1,0,2,0,-20,Height_Offset2,0,0,0,0,100,200)
                end
                SetDO(4,0,0,0)
                SetDO(5,1,0,0)
                WaitMs(700)
                Lin(boven doos 2-2,Fastspeed,-1,0,2,0,0,0,0,0,0,0,100,200)
                SetDO(5,0,0,0)
                PTP(1_flip pos_11,Fastspeed,20,0)
                PTP(1_voor flip pos_10,Speed,20,0)
                PTP(1_midden pos_3,Speed,20,0)
                Inpakken = 0
                ModbusSlaveWriteAO(AO5_Loop,1,{Loop1 + 1})
            elseif ActieveDoos == 2 and Pattern < 2 and Inpakken == 1 then
                PTP(boven doos 2-1,Speed,20,2,0,OffsetY,0,0,0,0)
                if Laag == 0 then
                    Lin(drop doos 2-1,Speed,-1,0,2,0,OffsetY,0,0,0,0,0,100,200)
                elseif Laag == 1 then
                    Lin(drop doos 2-1,Speed,-1,0,2,0,OffsetY,Height_Offset1,0,0,0,0,100,200)   
                elseif Laag == 2 then
                    Lin(drop doos 2-1,Speed,-1,0,2,0,OffsetY,Height_Offset2,0,0,0,0,100,200)            
                end
                SetDO(4,0,0,0)
                SetDO(5,1,0,0)
                WaitMs(700)
                Lin(boven doos 2-1,Fastspeed,-1,0,2,0,OffsetY,0,0,0,0,0,100,200)
                SetDO(5,0,0,0)
                PTP(1_flip pos_11,Fastspeed,20,0)
                PTP(1_voor flip pos_10,Speed,20,0)
                PTP(1_midden pos_3,Speed,20,0)
                Inpakken = 0
                ModbusSlaveWriteAO(AO5_Loop,1,{Loop1 + 1})
------------------------------------------------
--                  DOOS 1
------------------------------------------------
            elseif ActieveDoos == 1 and Pattern == 3 and Inpakken == 1 then
                -- Laatste rij verandering
                if Loop1 == 9 then
                    OffsetY2 = OffsetY2 - 22
                    OffsetRot = -10
                elseif Loop1 == 18 then
                    OffsetY2 = OffsetY2 - 22
                    OffsetRot = -10
                elseif Loop1 == 27 then
                    OffsetY2 = OffsetY2 - 24
                    OffsetRot = -10
                else
                    OffsetRot = -1
                end
                PTP(boven doos 1-3,Speed,-1,2,0,OffsetY2,0,0,0,0)
                if Laag == 0 then
                    Lin(drop doos 1-3,Speed,-1,0,2,0,OffsetY2,0,0,0,0,OffsetRot,100,200)
                elseif Laag == 1 then
                    Lin(drop doos 1-3,Speed,-1,0,2,0,OffsetY2,Height_Offset1,0,0,0,OffsetRot,100,200)
                elseif Laag == 2 then
                    Lin(drop doos 1-3,Speed,-1,0,2,0,OffsetY2,Height_Offset2,0,0,0,OffsetRot,100,200)
                end           
                SetDO(4,0,0,0)
                SetDO(5,1,0,0)
                WaitMs(700)
                Lin(boven doos 1-3,Fastspeed,-1,0,2,0,OffsetY2,0,0,0,0,0,100,200)
                SetDO(5,0,0,0)
                PTP(1_flip pos_11,Fastspeed,20,0)
                PTP(1_voor flip pos_10,Speed,20,0)
                PTP(1_midden pos_3,Speed,20,0)
                Inpakken = 0
                ModbusSlaveWriteAO(AO5_Loop,1,{Loop1 + 1})
            elseif ActieveDoos == 1 and Pattern == 2 and Inpakken == 1 then
                PTP(boven doos 1-2,Speed,20,2,0,0,0,0,0,0)
                if Laag == 0 then
                    Lin(drop doos 1-2,Speed,-1,0,2,0,0,0,0,0,0,0,100,200)
                elseif Laag == 1 then
                    Lin(drop doos 1-2,Speed,-1,0,2,0,0,Height_Offset1,0,0,0,0,100,200)
                elseif Laag == 2 then
                    Lin(drop doos 1-2,Speed,-1,0,2,0,0,Height_Offset2,0,0,0,0,100,200)
                end
                SetDO(4,0,0,0)
                SetDO(5,1,0,0)
                WaitMs(700)
                Lin(boven doos 1-2,Fastspeed,-1,0,2,0,0,0,0,0,0,0,100,200)
                SetDO(5,0,0,0)
                PTP(1_flip pos_11,Fastspeed,20,0)
                PTP(1_voor flip pos_10,Speed,20,0)
                PTP(1_midden pos_3,Speed,20,0)
                Inpakken = 0
                ModbusSlaveWriteAO(AO5_Loop,1,{Loop1 + 1})
            elseif ActieveDoos == 1 and Pattern < 2 and Inpakken == 1 then
                PTP(tooldraai doos 1,Speed,20,2,0,0,0,0,0,0)
                PTP(boven doos 1-1,Speed,20,2,0,OffsetY,0,0,0,0)
                if Laag == 0 then
                    Lin(drop doos 1-1,Speed,-1,0,2,0,OffsetY,0,0,0,0,0,100,200)
                elseif Laag == 1 then
                    Lin(drop doos 1-1,Speed,-1,0,2,0,OffsetY,Height_Offset1,0,0,0,0,100,200)
                elseif Laag == 2 then
                    Lin(drop doos 1-1,Speed,-1,0,2,0,OffsetY,Height_Offset2,0,0,0,0,100,200)
                end
                SetDO(4,0,0,0)
                SetDO(5,1,0,0)
                WaitMs(700)
                Lin(boven doos 1-1,Fastspeed,-1,0,2,0,OffsetY,0,0,0,0,0,100,200)
                SetDO(5,0,0,0)
                PTP(tooldraai doos 1,Fastspeed,20,2,0,0,0,0,0,0)
                PTP(1_flip pos_11,Fastspeed,20,0)
                PTP(1_voor flip pos_10,Speed,20,0)
                PTP(1_midden pos_3,Speed,20,0)
                Inpakken = 0
                ModbusSlaveWriteAO(AO5_Loop,1,{Loop1 + 1})
            end
        end
    end