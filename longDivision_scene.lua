-----------------------------------------------------------------------------------------
-- level2.lua
-- Created by: Valeria & Aliya
-- Date: May 10th, 2018
-- Description: 

-- Naming scene



local composer = require( "composer" )

local widget = require ("widget")

local sceneName = "longDivision_scene.lua" 
local scene = composer.newScene( sceneName )

---------------------------------------------------------------------------------------
--LOCAL VARIABLES
---------------------------------------------------------------------------------------
local bkg
local backButton
local operatio
local position

------------------
--MATH VARIABLES
------------------
--Division Parts
local template1
local template2
local divident
local divisor

local answerBox
local rem1
local rem2

local divisonOrder = 1


-- set the boolean varibales to know if they have already touched an answer
----------------------------------------
--FIRST PART
----------------------------------------
local quotientC1
local quotientW1
local quotientW2

local quotientC1AlreadyTouched = false
local quotientW1AlreadyTouched = false
local quotientW2AlreadyTouched = false

local quotientC1PrevX
local quotientW1PrevX
local quotientW2PrevX

local quotientC1PrevY
local quotientW1PrevY
local quotientW2PrevY

----------------------------------------
--SECOND PART
----------------------------------------
local remC1
local remW1
local remW2

local remC1AlreadyTouched = false
local remW1AlreadyTouched = false
local remW2AlreadyTouched = false

local remC1PrevX
local remW1PrevX
local remW2PrevX

local remC1PrevY
local remW1PrevY
local remW2PrevY

----------------------------------------
--THIRD PART
----------------------------------------
local quotientC2
local quotientW3
local quotientW4

local quotientC2AlreadyTouched = false
local quotientW3AlreadyTouched = false
local quotientW4AlreadyTouched = false

local quotientC2PrevX
local quotientW3PrevX
local quotientW4PrevX

local quotientC2PrevY
local quotientW3PrevY
local quotientW4PrevY

----------------------------------------
--FOURTH PART
----------------------------------------
local remC2
local remW3
local remW4

local remC2AlreadyTouched = false
local remW3AlreadyTouched = false
local remW4AlreadyTouched = false

local remC2PrevX
local remW3PrevX
local remW4PrevX

local remC2PrevY
local remW3PrevY
local remW4PrevY

---------------------------------------------------------------------------------------
--GLOBAL VARIABLES
---------------------------------------------------------------------------------------
correctAnswer = 0
-----------------------------------------
--SOUND
-----------------------------------------
--- Background sound 


--correctSound


--magic sound


--------------------------------------------
--LOCAL FUNCTIONS
-------------------------------------------
-----------------------------------------
--FIRST PART
-----------------------------------------
--this function chechs if 4 question were answered right then move to the win screen
local function checkAnswers()
    if (mathCounter == 3 ) then
        composer.gotoScene( "Win_screen", {effect = "fade", time = 0}) 

        if (levelCounter == 2) then
           StopTimer2()
           audio.stop(20)
         elseif (levelCounter == 1) then
            StopTimer()
            audio.stop(21)
         end
    end
end
--this function chooses randmoly the operation
local function randomOperation1()
  operation = 5--math.random(1,5)
   if (operation == 1) then
     --create the divident
     divident = display.newImageRect("LongDivision/44.png", 0, 0, 0, 0)
     divident.x = 460
     divident.y = 250
     divident.width = 100
     divident.height = 80
     divident.isVisible = true

     --create the divisor
     divisor = display.newImageRect("LongDivision/4.png", 0, 0, 0, 0)
     divisor.x = 350
     divisor.y = 250
     divisor.width = 60
     divisor.height = 80
     divisor.isVisible = true

     --create the answer box
     answerBox = display.newImageRect("LongDivision/box.png", 0, 0, 0, 0)
     answerBox.x = 450
     answerBox.y = 150
     answerBox.width = 80
     answerBox.height = 80
     answerBox.isVisible = true

     --create correct quotient
     quotientC1 = display.newImageRect("LongDivision/1.png", 0, 0, 0, 0)
     quotientC1.x = 300
     quotientC1.y = 680
     quotientC1.width = 60
     quotientC1.height = 80
     quotientC1.isVisible = true 

     --create first wrong quotient
     quotientW1 = display.newImageRect("LongDivision/3.png", 0, 0, 0, 0)
     quotientW1.x = 500
     quotientW1.y = 680
     quotientW1.width = 60
     quotientW1.height = 80
     quotientW1.isVisible = true

     --create second wrong quotient
     quotientW2 = display.newImageRect("LongDivision/9.png", 0, 0, 0, 0)
     quotientW2.x = 710
     quotientW2.y = 680
     quotientW2.width = 60
     quotientW2.height = 80
     quotientW2.isVisible = true

    elseif (operation == 2) then
      --create the divident
     divident = display.newImageRect("LongDivision/42.png", 0, 0, 0, 0)
     divident.x = 460
     divident.y = 250
     divident.width = 100
     divident.height = 80
     divident.isVisible = true

     --create the divisor
     divisor = display.newImageRect("LongDivision/2.png", 0, 0, 0, 0)
     divisor.x = 350
     divisor.y = 250
     divisor.width = 60
     divisor.height = 80
     divisor.isVisible = true

     --create the answer box
     answerBox = display.newImageRect("LongDivision/box.png", 0, 0, 0, 0)
     answerBox.x = 450
     answerBox.y = 150
     answerBox.width = 80
     answerBox.height = 80
     answerBox.isVisible = true 

     --create correct quotient
     quotientC1 = display.newImageRect("LongDivision/2.png", 0, 0, 0, 0)
     quotientC1.x = 300
     quotientC1.y = 680
     quotientC1.width = 60
     quotientC1.height = 80
     quotientC1.isVisible = true

     --create first wrong quotient
     quotientW1 = display.newImageRect("LongDivision/4.png", 0, 0, 0, 0)
     quotientW1.x = 500
     quotientW1.y = 680
     quotientW1.width = 60
     quotientW1.height = 80
     quotientW1.isVisible = true

     --create second wrong quotient
     quotientW2 = display.newImageRect("LongDivision/8.png", 0, 0, 0, 0)
     quotientW2.x = 710
     quotientW2.y = 680
     quotientW2.width = 60
     quotientW2.height = 80
     quotientW2.isVisible = true

    elseif (operation == 3) then
      --create the divident
     divident = display.newImageRect("LongDivision/129.png", 0, 0, 0, 0)
     divident.x = 480
     divident.y = 250
     divident.width = 130
     divident.height = 80
     divident.isVisible = true

     --create the divisor
     divisor = display.newImageRect("LongDivision/3.png", 0, 0, 0, 0)
     divisor.x = 350
     divisor.y = 250
     divisor.width = 60
     divisor.height = 80
     divisor.isVisible = true

     --create the answer box
     answerBox = display.newImageRect("LongDivision/box.png", 0, 0, 0, 0)
     answerBox.x = 450
     answerBox.y = 150
     answerBox.width = 80
     answerBox.height = 80
     answerBox.isVisible = true 

     --create correct quotient
     quotientC1 = display.newImageRect("LongDivision/4.png", 0, 0, 0, 0)
     quotientC1.x = 300
     quotientC1.y = 680
     quotientC1.width = 60
     quotientC1.height = 80
     quotientC1.isVisible = true

     --create first wrong quotient
     quotientW1 = display.newImageRect("LongDivision/5.png", 0, 0, 0, 0)
     quotientW1.x = 500
     quotientW1.y = 680
     quotientW1.width = 60
     quotientW1.height = 80
     quotientW1.isVisible = true

     --create second wrong quotient
     quotientW2 = display.newImageRect("LongDivision/9.png", 0, 0, 0, 0)
     quotientW2.x = 710
     quotientW2.y = 680
     quotientW2.width = 60
     quotientW2.height = 80
     quotientW2.isVisible = true

    elseif (operation == 4) then
      --create the divident
     divident = display.newImageRect("LongDivision/249.png", 0, 0, 0, 0)
     divident.x = 480
     divident.y = 250
     divident.width = 130
     divident.height = 80
     divident.isVisible = true

     --create the divisor
     divisor = display.newImageRect("LongDivision/3.png", 0, 0, 0, 0)
     divisor.x = 350
     divisor.y = 250
     divisor.width = 60
     divisor.height = 80
     divisor.isVisible = true

     --create the answer box
     answerBox = display.newImageRect("LongDivision/box.png", 0, 0, 0, 0)
     answerBox.x = 450
     answerBox.y = 150
     answerBox.width = 80
     answerBox.height = 80
     answerBox.isVisible = true 

     --create correct quotient
     quotientC1 = display.newImageRect("LongDivision/8.png", 0, 0, 0, 0)
     quotientC1.x = 300
     quotientC1.y = 680
     quotientC1.width = 60
     quotientC1.height = 80
     quotientC1.isVisible = true

     --create first wrong quotient
     quotientW1 = display.newImageRect("LongDivision/12.png", 0, 0, 0, 0)
     quotientW1.x = 500
     quotientW1.y = 680
     quotientW1.width = 80
     quotientW1.height = 80
     quotientW1.isVisible = true

     --create second wrong quotient
     quotientW2 = display.newImageRect("LongDivision/9.png", 0, 0, 0, 0)
     quotientW2.x = 710
     quotientW2.y = 680
     quotientW2.width = 60
     quotientW2.height = 80
     quotientW2.isVisible = true

    elseif (operation == 5) then
      --create the divident
     divident = display.newImageRect("LongDivision/224.png", 0, 0, 0, 0)
     divident.x = 480
     divident.y = 250
     divident.width = 130
     divident.height = 80
     divident.isVisible = true

     --create the divisor
     divisor = display.newImageRect("LongDivision/4.png", 0, 0, 0, 0)
     divisor.x = 350
     divisor.y = 250
     divisor.width = 60
     divisor.height = 80
     divisor.isVisible = true

     --create the answer box
     answerBox = display.newImageRect("LongDivision/box.png", 0, 0, 0, 0)
     answerBox.x = 450
     answerBox.y = 150
     answerBox.width = 80
     answerBox.height = 80
     answerBox.isVisible = true 

     --create correct quotient
     quotientC1 = display.newImageRect("LongDivision/5.png", 0, 0, 0, 0)
     quotientC1.x = 300
     quotientC1.y = 680
     quotientC1.width = 60
     quotientC1.height = 80
     quotientC1.isVisible = true

     --create first wrong quotient
     quotientW1 = display.newImageRect("LongDivision/3.png", 0, 0, 0, 0)
     quotientW1.x = 500
     quotientW1.y = 680
     quotientW1.width = 60
     quotientW1.height = 80
     quotientW1.isVisible = true

     --create second wrong quotient
     quotientW2 = display.newImageRect("LongDivision/8.png", 0, 0, 0, 0)
     quotientW2.x = 710
     quotientW2.y = 680
     quotientW2.width = 60
     quotientW2.height = 80
     quotientW2.isVisible = true
   end
  changePossition()
end

-----------------------------------------
--SECOND PART
-----------------------------------------
local function randomOperation2()
   if (operation == 1) then

     --create the answer box
     answerBox = display.newImageRect("LongDivision/box.png", 0, 0, 0, 0)
     answerBox.x = 450
     answerBox.y = 350
     answerBox.width = 80
     answerBox.height = 80
     answerBox.isVisible = true

     --create correct quotient
     remC1 = display.newImageRect("LongDivision/4.png", 0, 0, 0, 0)
     remC1.x = 300
     remC1.y = 680
     remC1.width = 60
     remC1.height = 80
     remC1.isVisible = true 

     --create first wrong quotient
     remW1 = display.newImageRect("LongDivision/8.png", 0, 0, 0, 0)
     remW1.x = 500
     remW1.y = 680
     remW1.width = 60
     remW1.height = 80
     remW1.isVisible = true

     --create second wrong quotient
     remW2 = display.newImageRect("LongDivision/3.png", 0, 0, 0, 0)
     remW2.x = 710
     remW2.y = 680
     remW2.width = 60
     remW2.height = 80
     remW2.isVisible = true

    elseif (operation == 2) then
     --create the answer box
     answerBox = display.newImageRect("LongDivision/box.png", 0, 0, 0, 0)
     answerBox.x = 450
     answerBox.y = 350
     answerBox.width = 80
     answerBox.height = 80
     answerBox.isVisible = true 

     --create correct quotient
     remC1 = display.newImageRect("LongDivision/4.png", 0, 0, 0, 0)
     remC1.x = 300
     remC1.y = 680
     remC1.width = 60
     remC1.height = 80
     remC1.isVisible = true

     --create first wrong quotient
     remW1 = display.newImageRect("LongDivision/9.png", 0, 0, 0, 0)
     remW1.x = 500
     remW1.y = 680
     remW1.width = 60
     remW1.height = 80
     remW1.isVisible = true

     --create second wrong quotient
     remW2 = display.newImageRect("LongDivision/6.png", 0, 0, 0, 0)
     remW2.x = 710
     remW2.y = 680
     remW2.width = 60
     remW2.height = 80
     remW2.isVisible = true

    elseif (operation == 3) then
     --create the answer box
     answerBox = display.newImageRect("LongDivision/box.png", 0, 0, 0, 0)
     answerBox.x = 450
     answerBox.y = 350
     answerBox.width = 100
     answerBox.height = 80
     answerBox.isVisible = true 

     --create correct quotient
     remC1 = display.newImageRect("LongDivision/12.png", 0, 0, 0, 0)
     remC1.x = 300
     remC1.y = 680
     remC1.width = 80
     remC1.height = 80
     remC1.isVisible = true

     --create first wrong quotient
     remW1 = display.newImageRect("LongDivision/15.png", 0, 0, 0, 0)
     remW1.x = 500
     remW1.y = 680
     remW1.width = 80
     remW1.height = 80
     remW1.isVisible = true

     --create second wrong quotient
     remW2 = display.newImageRect("LongDivision/18.png", 0, 0, 0, 0)
     remW2.x = 710
     remW2.y = 680
     remW2.width = 80
     remW2.height = 80
     remW2.isVisible = true

    elseif (operation == 4) then
     --create the answer box
     answerBox = display.newImageRect("LongDivision/box.png", 0, 0, 0, 0)
     answerBox.x = 450
     answerBox.y = 350
     answerBox.width = 100
     answerBox.height = 80
     answerBox.isVisible = true 

     --create correct quotient
     remC1 = display.newImageRect("LongDivision/24.png", 0, 0, 0, 0)
     remC1.x = 300
     remC1.y = 680
     remC1.width = 80
     remC1.height = 80
     remC1.isVisible = true

     --create first wrong quotient
     remW1 = display.newImageRect("LongDivision/20.png", 0, 0, 0, 0)
     remW1.x = 500
     remW1.y = 680
     remW1.width = 80
     remW1.height = 80
     remW1.isVisible = true

     --create second wrong quotient
     remW2 = display.newImageRect("LongDivision/38.png", 0, 0, 0, 0)
     remW2.x = 710
     remW2.y = 680
     remW2.width = 80
     remW2.height = 80
     remW2.isVisible = true

    elseif (operation == 5) then
     --create the answer box
     answerBox = display.newImageRect("LongDivision/box.png", 0, 0, 0, 0)
     answerBox.x = 450
     answerBox.y = 350
     answerBox.width = 100
     answerBox.height = 80
     answerBox.isVisible = true 

     --create correct quotient
     remC1 = display.newImageRect("LongDivision/20.png", 0, 0, 0, 0)
     remC1.x = 300
     remC1.y = 680
     remC1.width = 80
     remC1.height = 80
     remC1.isVisible = true

     --create first wrong quotient
     remW1 = display.newImageRect("LongDivision/15.png", 0, 0, 0, 0)
     remW1.x = 500
     remW1.y = 680
     remW1.width = 80
     remW1.height = 80
     remW1.isVisible = true

     --create second wrong quotient
     remW2 = display.newImageRect("LongDivision/12.png", 0, 0, 0, 0)
     remW2.x = 710
     remW2.y = 680
     remW2.width = 80
     remW2.height = 80
     remW2.isVisible = true
   end
   changePossition()
end

-----------------------------------------
--THIRD PART
-----------------------------------------
--this function chooses randmoly the operation
local function randomOperation3()
   if (operation == 1) then
     rem1 = display.newImageRect("LongDivision/4.png", 0, 0, 0, 0)
     rem1.x = 510
     rem1.y = 450
     rem1.width = 60
     rem1.height = 80
     rem1.isVisible = true 
     --create the answer box
     answerBox = display.newImageRect("LongDivision/box.png", 0, 0, 0, 0)
     answerBox.x = 530
     answerBox.y = 150
     answerBox.width = 80
     answerBox.height = 80
     answerBox.isVisible = true 

     --create correct quotient
     quotientC2 = display.newImageRect("LongDivision/1.png", 0, 0, 0, 0)
     quotientC2.x = 300
     quotientC2.y = 680
     quotientC2.width = 60
     quotientC2.height = 80
     quotientC2.isVisible = true

     --create first wrong quotient
     quotientW3 = display.newImageRect("LongDivision/3.png", 0, 0, 0, 0)
     quotientW3.x = 500
     quotientW3.y = 680
     quotientW3.width = 60
     quotientW3.height = 80
     quotientW3.isVisible = true

     --create second wrong quotient
     quotientW4 = display.newImageRect("LongDivision/8.png", 0, 0, 0, 0)
     quotientW4.x = 710
     quotientW4.y = 680
     quotientW4.width = 60
     quotientW4.height = 80
     quotientW4.isVisible = true


    elseif (operation == 2) then
     rem1 = display.newImageRect("LongDivision/2.png", 0, 0, 0, 0)
     rem1.x = 510
     rem1.y = 450
     rem1.width = 60
     rem1.height = 80
     rem1.isVisible = true 

     --create the answer box
     answerBox = display.newImageRect("LongDivision/box.png", 0, 0, 0, 0)
     answerBox.x = 530
     answerBox.y = 150
     answerBox.width = 80
     answerBox.height = 80
     answerBox.isVisible = true 

     --create correct quotient
     quotientC2 = display.newImageRect("LongDivision/1.png", 0, 0, 0, 0)
     quotientC2.x = 300
     quotientC2.y = 680
     quotientC2.width = 60
     quotientC2.height = 80
     quotientC2.isVisible = true

     --create first wrong quotient
     quotientW3 = display.newImageRect("LongDivision/0.png", 0, 0, 0, 0)
     quotientW3.x = 500
     quotientW3.y = 680
     quotientW3.width = 60
     quotientW3.height = 80
     quotientW3.isVisible = true

     --create second wrong quotient
     quotientW4 = display.newImageRect("LongDivision/4.png", 0, 0, 0, 0)
     quotientW4.x = 710
     quotientW4.y = 680
     quotientW4.width = 60
     quotientW4.height = 80
     quotientW4.isVisible = true

    elseif (operation == 3) then
     rem1 = display.newImageRect("LongDivision/9.png", 0, 0, 0, 0)
     rem1.x = 510
     rem1.y = 450
     rem1.width = 60
     rem1.height = 80
     rem1.isVisible = true 

     --create the answer box
     answerBox = display.newImageRect("LongDivision/box.png", 0, 0, 0, 0)
     answerBox.x = 530
     answerBox.y = 150
     answerBox.width = 80
     answerBox.height = 80
     answerBox.isVisible = true 

     --create correct quotient
     quotientC2 = display.newImageRect("LongDivision/3.png", 0, 0, 0, 0)
     quotientC2.x = 300
     quotientC2.y = 680
     quotientC2.width = 60
     quotientC2.height = 80
     quotientC2.isVisible = true

     --create first wrong quotient
     quotientW3 = display.newImageRect("LongDivision/6.png", 0, 0, 0, 0)
     quotientW3.x = 500
     quotientW3.y = 680
     quotientW3.width = 60
     quotientW3.height = 80
     quotientW3.isVisible = true

     --create second wrong quotient
     quotientW4 = display.newImageRect("LongDivision/8.png", 0, 0, 0, 0)
     quotientW4.x = 710
     quotientW4.y = 680
     quotientW4.width = 60
     quotientW4.height = 80
     quotientW4.isVisible = true

    elseif (operation == 4) then
     rem1 = display.newImageRect("LongDivision/9.png", 0, 0, 0, 0)
     rem1.x = 510
     rem1.y = 450
     rem1.width = 60
     rem1.height = 80
     rem1.isVisible = true 

     --create the answer box
     answerBox = display.newImageRect("LongDivision/box.png", 0, 0, 0, 0)
     answerBox.x = 530
     answerBox.y = 150
     answerBox.width = 80
     answerBox.height = 80
     answerBox.isVisible = true 

     --create correct quotient
     quotientC2 = display.newImageRect("LongDivision/3.png", 0, 0, 0, 0)
     quotientC2.x = 300
     quotientC2.y = 680
     quotientC2.width = 60
     quotientC2.height = 80
     quotientC2.isVisible = true

     --create first wrong quotient
     quotientW3 = display.newImageRect("LongDivision/0.png", 0, 0, 0, 0)
     quotientW3.x = 500
     quotientW3.y = 680
     quotientW3.width = 60
     quotientW3.height = 80
     quotientW3.isVisible = true

     --create second wrong quotient
     quotientW4 = display.newImageRect("LongDivision/5.png", 0, 0, 0, 0)
     quotientW4.x = 710
     quotientW4.y = 680
     quotientW4.width = 60
     quotientW4.height = 80
     quotientW4.isVisible = true

    elseif (operation == 5) then
     rem1 = display.newImageRect("LongDivision/24.png", 0, 0, 0, 0)
     rem1.x = 510
     rem1.y = 450
     rem1.width = 80
     rem1.height = 80
     rem1.isVisible = true 

     --create the answer box
     answerBox = display.newImageRect("LongDivision/box.png", 0, 0, 0, 0)
     answerBox.x = 530
     answerBox.y = 150
     answerBox.width = 80
     answerBox.height = 80
     answerBox.isVisible = true 

     --create correct quotient
     quotientC2 = display.newImageRect("LongDivision/6.png", 0, 0, 0, 0)
     quotientC2.x = 300
     quotientC2.y = 680
     quotientC2.width = 60
     quotientC2.height = 80
     quotientC2.isVisible = true

     --create first wrong quotient
     quotientW3 = display.newImageRect("LongDivision/4.png", 0, 0, 0, 0)
     quotientW3.x = 500
     quotientW3.y = 680
     quotientW3.width = 60
     quotientW3.height = 80
     quotientW3.isVisible = true

     --create second wrong quotient
     quotientW4 = display.newImageRect("LongDivision/8.png", 0, 0, 0, 0)
     quotientW4.x = 710
     quotientW4.y = 680
     quotientW4.width = 60
     quotientW4.height = 80
     quotientW4.isVisible = true
   end
  changePossition()
end

-----------------------------------------
--FOURTH PART
-----------------------------------------
local function randomOperation4()
   if (operation == 1) then
     --create the answer box
     answerBox = display.newImageRect("LongDivision/box.png", 0, 0, 0, 0)
     answerBox.x = 550
     answerBox.y = 550
     answerBox.width = 80
     answerBox.height = 80
     answerBox.isVisible = true

     --create correct quotient
     remC2 = display.newImageRect("LongDivision/4.png", 0, 0, 0, 0)
     remC2.x = 300
     remC2.y = 680
     remC2.width = 60
     remC2.height = 80
     remC2.isVisible = true 

     --create first wrong quotient
     remW3 = display.newImageRect("LongDivision/5.png", 0, 0, 0, 0)
     remW3.x = 500
     remW3.y = 680
     remW3.width = 60
     remW3.height = 80
     remW3.isVisible = true

     --create second wrong quotient
     remW4 = display.newImageRect("LongDivision/0.png", 0, 0, 0, 0)
     remW4.x = 710
     remW4.y = 680
     remW4.width = 60
     remW4.height = 80
     remW4.isVisible = true

    elseif (operation == 2) then
     --create the answer box
     answerBox = display.newImageRect("LongDivision/box.png", 0, 0, 0, 0)
     answerBox.x = 550
     answerBox.y = 550
     answerBox.width = 80
     answerBox.height = 80
     answerBox.isVisible = true

     --create correct quotient
     remC2 = display.newImageRect("LongDivision/2.png", 0, 0, 0, 0)
     remC2.x = 300
     remC2.y = 680
     remC2.width = 60
     remC2.height = 80
     remC2.isVisible = true 

     --create first wrong quotient
     remW3 = display.newImageRect("LongDivision/0.png", 0, 0, 0, 0)
     remW3.x = 500
     remW3.y = 680
     remW3.width = 60
     remW3.height = 80
     remW3.isVisible = true

     --create second wrong quotient
     remW4 = display.newImageRect("LongDivision/12.png", 0, 0, 0, 0)
     remW4.x = 710
     remW4.y = 680
     remW4.width = 80
     remW4.height = 80
     remW4.isVisible = true
    elseif (operation == 3) then
      --create the answer box
     answerBox = display.newImageRect("LongDivision/box.png", 0, 0, 0, 0)
     answerBox.x = 550
     answerBox.y = 550
     answerBox.width = 80
     answerBox.height = 80
     answerBox.isVisible = true

     --create correct quotient
     remC2 = display.newImageRect("LongDivision/9.png", 0, 0, 0, 0)
     remC2.x = 300
     remC2.y = 680
     remC2.width = 60
     remC2.height = 80
     remC2.isVisible = true 

     --create first wrong quotient
     remW3 = display.newImageRect("LongDivision/15.png", 0, 0, 0, 0)
     remW3.x = 500
     remW3.y = 680
     remW3.width = 80
     remW3.height = 80
     remW3.isVisible = true

     --create second wrong quotient
     remW4 = display.newImageRect("LongDivision/6.png", 0, 0, 0, 0)
     remW4.x = 710
     remW4.y = 680
     remW4.width = 60
     remW4.height = 80
     remW4.isVisible = true
    elseif (operation == 4) then
      --create the answer box
     answerBox = display.newImageRect("LongDivision/box.png", 0, 0, 0, 0)
     answerBox.x = 550
     answerBox.y = 550
     answerBox.width = 80
     answerBox.height = 80
     answerBox.isVisible = true

     --create correct quotient
     remC2 = display.newImageRect("LongDivision/9.png", 0, 0, 0, 0)
     remC2.x = 300
     remC2.y = 680
     remC2.width = 60
     remC2.height = 80
     remC2.isVisible = true 

     --create first wrong quotient
     remW3 = display.newImageRect("LongDivision/5.png", 0, 0, 0, 0)
     remW3.x = 500
     remW3.y = 680
     remW3.width = 60
     remW3.height = 80
     remW3.isVisible = true

     --create second wrong quotient
     remW4 = display.newImageRect("LongDivision/12.png", 0, 0, 0, 0)
     remW4.x = 710
     remW4.y = 680
     remW4.width = 80
     remW4.height = 80
     remW4.isVisible = true
    elseif (operation == 5) then
   --create the answer box
     answerBox = display.newImageRect("LongDivision/box.png", 0, 0, 0, 0)
     answerBox.x = 550
     answerBox.y = 550
     answerBox.width = 80
     answerBox.height = 80
     answerBox.isVisible = true

     --create correct quotient
     remC2 = display.newImageRect("LongDivision/24.png", 0, 0, 0, 0)
     remC2.x = 300
     remC2.y = 680
     remC2.width = 80
     remC2.height = 80
     remC2.isVisible = true 

     --create first wrong quotient
     remW3 = display.newImageRect("LongDivision/15.png", 0, 0, 0, 0)
     remW3.x = 500
     remW3.y = 680
     remW3.width = 80
     remW3.height = 80
     remW3.isVisible = true

     --create second wrong quotient
     remW4 = display.newImageRect("LongDivision/12.png", 0, 0, 0, 0)
     remW4.x = 710
     remW4.y = 680
     remW4.width = 80
     remW4.height = 80
     remW4.isVisible = true
   end
   changePossition()
end


---------------------------------------------------------------
--HIDE OBJECTS
--------------------------------------------------------------
--this function hides the quotients and the box after the answer was given
local function hideObject1()
  quotientW1.isVisible = false
  quotientW2.isVisible = false
  answerBox.isVisible = false
end

--this function hides the quotients and the box after the answer was given
local function hideObject2()
  remW1.isVisible = false
  remW2.isVisible = false
  answerBox.isVisible = false
  template1.isVisible = false
  template2.isVisible = true
end

--this function hides the quotients and the box after the answer was given
local function hideObject3()
  quotientW3.isVisible = false
  quotientW4.isVisible = false
  answerBox.isVisible = false
end

--this function hides the quotients and the box after the answer was given
local function hideObject4()
  remW3.isVisible = false
  remW4.isVisible = false
  answerBox.isVisible = false

  rem2 = display.newImageRect("LongDivision/0.png", 0, 0, 0, 0)
  rem2.x = 560
  rem2.y = 650
  rem2.width = 60
  rem2.height = 80
  rem2.isVisible = true
end

--this function hides the quotients and the box after the answer was given
local function hideScene()
  quotientC1.isVisible = false
  quotientC2.isVisible = false
  divident.isVisible = false
  divisor.isVisible = false
  remC1.isVisible = false
  remC2.isVisible = false
  rem2.isVisible = false
  rem1.isVisible = false
  template2.isVisible = false
end

--------------------------------------------------------
--MOVE NUMBERS (these functions allow us to move numbers)
-------------------------------------------------------
-------------------------------
--FIRST PART
-------------------------------
--move first correct quoteint
local function moveCorrectQ1(touch)
    --only work if none of the other pieces have been touched
        if (quotientW1AlreadyTouched == false and quotientW2AlreadyTouched == false) then 

            if touch.phase == "began" then
                --let other pieces know it has been clicked
                quotientC1AlreadyTouched = true
        
            elseif touch.phase == "moved" then
                --dragging function
                quotientC1.x = touch.x
                quotientC1.y = touch.y
            elseif touch.phase == "ended" then
               quotientC1AlreadyTouched = false

                -- if the piece is in the right spot go to center  and remove the event listener
                if (((answerBox.x - answerBox.width/2) < quotientC1.x ) and
                    ((answerBox.x + answerBox.width/2) > quotientC1.x ) and 
                    ((answerBox.y - answerBox.height/2) < quotientC1.y ) and 
                    ((answerBox.y + answerBox.height/2) > quotientC1.y ) ) then

                    quotientC1.x = answerBox.x
                    quotientC1.y = answerBox.y
                    
                    quotientC1:removeEventListener("touch", moveCorrectQ1)
                   
                   --increase the puzzleCounter by 1 and check if it's necessary to move to the next scene
                    divisonOrder = 2
                    hideObject1()
                    randomOperation2() 
                    addEventListener2()                  
                --else make piece go back to where it was
                else
                    quotientC1.x = quotientC1PrevX
                    quotientC1.y = quotientC1PrevY
                end
            end
        end                
end 

--move first wrong quoteint
local function moveWrongQ1(touch)
    --only work if none of the other pieces have been touched
        if (quotientC1AlreadyTouched == false and quotientW2AlreadyTouched == false) then 
             
            if touch.phase == "began" then
                --let other pieces know it has been clicked
                quotientW1AlreadyTouched = true
        
            elseif touch.phase == "moved" then
                --dragging function
                quotientW1.x = touch.x
                quotientW1.y = touch.y
            elseif touch.phase == "ended" then
               quotientW1AlreadyTouched = false
                quotientW1.x = quotientW1PrevX
                quotientW1.y = quotientW1PrevY
            end
        end                
end 

--move second wrong quoteint
local function moveWrongQ2(touch)
    --only work if none of the other pieces have been touched
        if (quotientC1AlreadyTouched == false and quotientW1AlreadyTouched == false) then 
             
            if touch.phase == "began" then
                --let other pieces know it has been clicked
                quotientW2AlreadyTouched = true
        
            elseif touch.phase == "moved" then
                --dragging function
                quotientW2.x = touch.x
                quotientW2.y = touch.y
            elseif touch.phase == "ended" then
               quotientW2AlreadyTouched = false
                quotientW2.x = quotientW2PrevX
                quotientW2.y = quotientW2PrevY
            end
        end                
end 

-------------------------------
--SECOND PART
-------------------------------
--move first correct quoteint
local function moveCorrectR1(touch)
    --only work if none of the other pieces have been touched
        if (remW1AlreadyTouched == false and remW2AlreadyTouched == false) then 

            if touch.phase == "began" then
                --let other pieces know it has been clicked
                remC1AlreadyTouched = true
            elseif touch.phase == "moved" then
                --dragging function
                remC1.x = touch.x
                remC1.y = touch.y
            elseif touch.phase == "ended" then
               remC1AlreadyTouched = false

                -- if the piece is in the right spot go to center  and remove the event listener
                if (((answerBox.x - answerBox.width/2) < remC1.x ) and
                    ((answerBox.x + answerBox.width/2) > remC1.x ) and 
                    ((answerBox.y - answerBox.height/2) < remC1.y ) and 
                    ((answerBox.y + answerBox.height/2) > remC1.y ) ) then

                    remC1.x = answerBox.x
                    remC1.y = answerBox.y
                    
                    remC1:removeEventListener("touch", moveCorrectR1)
                   
                   --increase the puzzleCounter by 1 and check if it's necessary to move to the next scene
                    divisonOrder = 3
                    hideObject2()
                    randomOperation3()
                    addEventListener3()                   
                --else make piece go back to where it was
                else
                    remC1.x = remC1PrevX
                    remC1.y = remC1PrevY
                end
            end
        end                
end 

--move first wrong quoteint
local function moveWrongR1(touch)
    --only work if none of the other pieces have been touched
        if (remC1AlreadyTouched == false and remW2AlreadyTouched == false) then 
             
            if touch.phase == "began" then
                --let other pieces know it has been clicked
                remW1AlreadyTouched = true
        
            elseif touch.phase == "moved" then
                --dragging function
                remW1.x = touch.x
                remW1.y = touch.y
            elseif touch.phase == "ended" then
               remW1AlreadyTouched = false
               remW1.x = remW1PrevX
               remW1.y = remW1PrevY
            end
        end                
end 

--move first wrong quoteint
local function moveWrongR2(touch)
    --only work if none of the other pieces have been touched
        if (remC1AlreadyTouched == false and remW1AlreadyTouched == false) then 
             
            if touch.phase == "began" then
                --let other pieces know it has been clicked
                remW2AlreadyTouched = true
        
            elseif touch.phase == "moved" then
                --dragging function
                remW2.x = touch.x
                remW2.y = touch.y
            elseif touch.phase == "ended" then
               remW2AlreadyTouched = false
               remW2.x = remW2PrevX
               remW2.y = remW2PrevY
            end
        end                
end 

-------------------------------
--THIRD PART
-------------------------------
--move first correct quoteint
local function moveCorrectQ2(touch)
    --only work if none of the other pieces have been touched
        if (quotientW3AlreadyTouched == false and quotientW4AlreadyTouched == false) then 

            if touch.phase == "began" then
                --let other pieces know it has been clicked
                quotientC2AlreadyTouched = true
        
            elseif touch.phase == "moved" then
                --dragging function
                quotientC2.x = touch.x
                quotientC2.y = touch.y
            elseif touch.phase == "ended" then
               quotientC2AlreadyTouched = false

                -- if the piece is in the right spot go to center  and remove the event listener
                if (((answerBox.x - answerBox.width/2) < quotientC2.x ) and
                    ((answerBox.x + answerBox.width/2) > quotientC2.x ) and 
                    ((answerBox.y - answerBox.height/2) < quotientC2.y ) and 
                    ((answerBox.y + answerBox.height/2) > quotientC2.y ) ) then

                    quotientC2.x = answerBox.x
                    quotientC2.y = answerBox.y
                    
                    quotientC2:removeEventListener("touch", moveCorrectQ2)
                   
                   --increase the puzzleCounter by 1 and check if it's necessary to move to the next scene
                    divisonOrder = 4
                    hideObject3()
                    randomOperation4() 
                    addEventListener4()                  
                --else make piece go back to where it was
                else
                    quotientC2.x = quotientC2PrevX
                    quotientC2.y = quotientC2PrevY
                end
            end
        end                
end 

--move first wrong quoteint
local function moveWrongQ3(touch)
    --only work if none of the other pieces have been touched
        if (quotientC2AlreadyTouched == false and quotientW4AlreadyTouched == false) then 
             
            if touch.phase == "began" then
                --let other pieces know it has been clicked
                quotientW3AlreadyTouched = true
        
            elseif touch.phase == "moved" then
                --dragging function
                quotientW3.x = touch.x
                quotientW3.y = touch.y
            elseif touch.phase == "ended" then
               quotientW3AlreadyTouched = false
                quotientW3.x = quotientW3PrevX
                quotientW3.y = quotientW3PrevY
            end
        end                
end 

--move second wrong quoteint
local function moveWrongQ4(touch)
    --only work if none of the other pieces have been touched
        if (quotientC2AlreadyTouched == false and quotientW3AlreadyTouched == false) then 
             
            if touch.phase == "began" then
                --let other pieces know it has been clicked
                quotientW4AlreadyTouched = true
        
            elseif touch.phase == "moved" then
                --dragging function
                quotientW4.x = touch.x
                quotientW4.y = touch.y
            elseif touch.phase == "ended" then
               quotientW4AlreadyTouched = false
                quotientW4.x = quotientW4PrevX
                quotientW4.y = quotientW4PrevY
            end
        end                
end 

-------------------------------
--FOURTH PART
-------------------------------
--move first correct quoteint
local function moveCorrectR2(touch)
    --only work if none of the other pieces have been touched
        if (remW3AlreadyTouched == false and remW4AlreadyTouched == false) then 

            if touch.phase == "began" then
                --let other pieces know it has been clicked
                remC2AlreadyTouched = true
            elseif touch.phase == "moved" then
                --dragging function
                remC2.x = touch.x
                remC2.y = touch.y
            elseif touch.phase == "ended" then
               remC2AlreadyTouched = false

                -- if the piece is in the right spot go to center  and remove the event listener
                if (((answerBox.x - answerBox.width/2) < remC2.x ) and
                    ((answerBox.x + answerBox.width/2) > remC2.x ) and 
                    ((answerBox.y - answerBox.height/2) < remC2.y ) and 
                    ((answerBox.y + answerBox.height/2) > remC2.y ) ) then

                    remC2.x = answerBox.x
                    remC2.y = answerBox.y
                    
                    remC2:removeEventListener("touch", moveCorrectR2)
                   
                   --increase the puzzleCounter by 1 and check if it's necessary to move to the next scene
                    divisonOrder = 4
                    hideObject4()
                    mathCounter = mathCounter + 1
                    checkAnswers()
                    composer.hideOverlay("fade", 400)
                --else make piece go back to where it was
                else
                    remC2.x = remC2PrevX
                    remC2.y = remC2PrevY
                end
            end
        end                
end 

--move first wrong quoteint
local function moveWrongR3(touch)
    --only work if none of the other pieces have been touched
        if (remC2AlreadyTouched == false and remW4AlreadyTouched == false) then 
             
            if touch.phase == "began" then
                --let other pieces know it has been clicked
                remW3AlreadyTouched = true
        
            elseif touch.phase == "moved" then
                --dragging function
                remW3.x = touch.x
                remW3.y = touch.y
            elseif touch.phase == "ended" then
               remW3AlreadyTouched = false
               remW3.x = remW3PrevX
               remW3.y = remW3PrevY
            end
        end                
end 

--move first wrong quoteint
local function moveWrongR4(touch)
    --only work if none of the other pieces have been touched
        if (remC2AlreadyTouched == false and remW3AlreadyTouched == false) then 
             
            if touch.phase == "began" then
                --let other pieces know it has been clicked
                remW4AlreadyTouched = true
        
            elseif touch.phase == "moved" then
                --dragging function
                remW4.x = touch.x
                remW4.y = touch.y
            elseif touch.phase == "ended" then
               remW4AlreadyTouched = false
               remW4.x = remW2PrevX
               remW4.y = remW2PrevY
            end
        end                
end 


-------------------------------------
--ADD EVENT LISTENERS TO THE OBJECTS
--------------------------------------
local function addEventListener1()
    quotientC1:addEventListener("touch", moveCorrectQ1)
    quotientW1:addEventListener("touch", moveWrongQ1)
    quotientW2:addEventListener("touch", moveWrongQ2)
end

-------------------------------------
--REMOVE EVENT LISTENERS 
--------------------------------------
local function removeEventListener()
    quotientC1:removeEventListener("touch", moveCorrectQ1)
    quotientW1:removeEventListener("touch", moveWrongQ1)
    quotientW2:removeEventListener("touch", moveWrongQ2)
    remC1:removeEventListener("touch", moveCorrectR1)
    remW1:removeEventListener("touch", moveWrongR1)
    remW2:removeEventListener("touch", moveWrongR2)
    quotientC2:removeEventListener("touch", moveCorrectQ2)
    quotientW3:removeEventListener("touch", moveWrongQ3)
    quotientW4:removeEventListener("touch", moveWrongQ4)
    remC2:removeEventListener("touch", moveCorrectR2)
    remW3:removeEventListener("touch", moveWrongR3)
    remW4:removeEventListener("touch", moveWrongR4)
end
 
-------------------------------------------------------
--GLOBAL FUNCTIONS
-------------------------------------------------------

function changePossition()
 if (divisonOrder == 1) then
    --choose a number between 1 and 9
   changePosit = math.random(1,3)
   --based on the chosen number set the position of the pieces
   if (changePosit == 1) then
     quotientC1.x = 300 
     quotientW1.x = 500
     quotientW2.x = 710
   elseif(changePosit == 2) then
     quotientC1.x = 500 
     quotientW1.x = 710
     quotientW2.x = 300
   elseif(changePosit == 3) then
     quotientC1.x = 710 
     quotientW1.x = 300
     quotientW2.x = 500
   end
   --Save previous positions
   quotientC1PrevX = quotientC1.x
   quotientW1PrevX = quotientW1.x
   quotientW2PrevX = quotientW2.x

   quotientC1PrevY = quotientC1.y
   quotientW1PrevY = quotientW1.y
   quotientW2PrevY = quotientW2.y

  elseif (divisonOrder == 2) then
    --choose a number between 1 and 9
   changePosit = math.random(1,3)
   --based on the chosen number set the position of the pieces
   if (changePosit == 1) then
     remC1.x = 300 
     remW1.x = 500
     remW2.x = 710
   elseif(changePosit == 2) then
     remC1.x = 500 
     remW1.x = 710
     remW2.x = 300
   elseif(changePosit == 3) then
     remC1.x = 710 
     remW1.x = 300
     remW2.x = 500
   end
   --Save previous positions
   remC1PrevX = remC1.x
   remW1PrevX = remW1.x
   remW2PrevX = remW2.x

   remC1PrevY = remC1.y
   remW1PrevY = remW1.y
   remW2PrevY = remW2.y

  elseif (divisonOrder == 3) then
    --choose a number between 1 and 9
   changePosit = math.random(1,3)
   --based on the chosen number set the position of the pieces
   if (changePosit == 1) then
     quotientC2.x = 300 
     quotientW3.x = 500
     quotientW4.x = 710
   elseif(changePosit == 2) then
     quotientC2.x = 500 
     quotientW3.x = 710
     quotientW4.x = 300
   elseif(changePosit == 3) then
     quotientC2.x = 710 
     quotientW3.x = 300
     quotientW4.x = 500
   end
   --Save previous positions
   quotientC2PrevX = quotientC2.x
   quotientW3PrevX = quotientW3.x
   quotientW4PrevX = quotientW4.x

   quotientC2PrevY = quotientC2.y
   quotientW3PrevY = quotientW3.y
   quotientW4PrevY = quotientW4.y

  elseif (divisonOrder == 4) then
    --choose a number between 1 and 9
   changePosit = math.random(1,3)
   --based on the chosen number set the position of the pieces
   if (changePosit == 1) then
     remC2.x = 300 
     remW3.x = 500
     remW4.x = 710
   elseif(changePosit == 2) then
     remC2.x = 500 
     remW3.x = 710
     remW4.x = 300
   elseif(changePosit == 3) then
     remC2.x = 710 
     remW3.x = 300
     remW4.x = 500
   end
   --Save previous positions
   remC2PrevX = remC2.x
   remW3PrevX = remW3.x
   remW4PrevX = remW4.x

   remC2PrevY = remC2.y
   remW3PrevY = remW3.y
   remW4PrevY = remW4.y
 end
end

  function addEventListener2()
    remC1:addEventListener("touch", moveCorrectR1)
    remW1:addEventListener("touch", moveWrongR1)
    remW2:addEventListener("touch", moveWrongR2)
  end

 function addEventListener3()
    quotientC2:addEventListener("touch", moveCorrectQ2)
    quotientW3:addEventListener("touch", moveWrongQ3)
    quotientW4:addEventListener("touch", moveWrongQ4)
 end
  function addEventListener4()
    remC2:addEventListener("touch", moveCorrectR2)
    remW3:addEventListener("touch", moveWrongR3)
    remW4:addEventListener("touch", moveWrongR4)
  end
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------
 
-- create()
function scene:create( event )
 
    local sceneGroup = self.view
       ---------------------------------------------------------------------------
      --CREATE STATIC IMAGES
       ---------------------------------------------------------------------------

      --create the backgroud
      bkg = display.newImageRect("Level3/scrollValeriaV.png", 0, 0, 0, 0)
      bkg.width = 750
      bkg.height = 730
      bkg.x = 510
      bkg.y = 380
      sceneGroup:insert(bkg)

      ----------------------------------------
      --MATH OBJECTS
      ----------------------------------------
      --create the first template
      template1 = display.newImageRect("LongDivision/LongDivisionTemplate1.png", 0, 0, 0, 0)
      template1.x = 500
      template1.y = 480
      template1.width = 500
      template1.height = 800
      template1.isVisible = true
      sceneGroup:insert(template1)

      --create the second template
      template2 = display.newImageRect("LongDivision/LongDivisionTemplate2.png", 0, 0, 0, 0)
      template2.x = 500
      template2.y = 480
      template2.width = 500
      template2.height = 800
      template2.isVisible = false
      sceneGroup:insert(template2)

 -------------------------------------------------------------------------------------
 --sounds
 -------------------------------------------------------------------------------------
 
end
  
-- show()
function scene:show( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)
        
    elseif ( phase == "did" ) then
        -- Code here runs when the scene is entirely on screen
        
        randomOperation1()
        addEventListener1()
        divisonOrder = 1
    end
end
 
-- hide()
function scene:hide( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is on screen (but is about to go off screen)
        if (levelCounter == 2) then
          key4.isVisible = false
        elseif(levelCounter == 1)then
          key6.isVisible = false
        end
 
    elseif ( phase == "did" ) then
        -- Code here runs immediately after the scene goes entirely off screen
        hideScene()
        removeEventListener()
    end
end
 
-- destroy()
function scene:destroy( event )
 
    local sceneGroup = self.view
    -- Code here runs prior to the removal of scene's view
 
end 
-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- ----------------------------------------------------------------------------------- 
return scene