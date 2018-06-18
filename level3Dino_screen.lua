-----------------------------------------------------------------------------------------
-- level3.lua
-- Created by: Valeria & Aliya
-- Date: May 10th, 2018
-- Description: 

-- Naming scene
local composer = require( "composer" )

local widget = require ("widget")

local sceneName = "level3Zeus_screen.lua" 
local scene = composer.newScene( sceneName )

---------------------------------------------------------------------------------------
--LOCAL VARIABLES
---------------------------------------------------------------------------------------
local bkg

local cupboard1
local cupboard2
local cupboard3
local cupboard4
local cupboard5
local drawer
local fridge
local oven
local microwave
local pauseButton

local bkgSound
local bkgChannel

--TIMER VARIABLES
local clockText

local dino
local instructions
local instrText

--background sound
local bkgSound
local bkgChannel
local bkgStop



local passedLevel


---------------------------------------------------------------------------------------
--GLOBAL VARIABLES
---------------------------------------------------------------------------------------
levelCounter = 0
mathCounter = 0

--TIMER VARIABLES
--local countDownTimer
totalSeconds2 = 60
secondsLeft2 = 60
minutesLeft2 = 1

soundPressed = true

-----------------------------------------
--SOUND
-----------------------------------------
--- Background sound 
  bkgSound = audio.loadStream("Sounds/XYLOJUNG(2).wav")

--------------------------------------------
--LOCAL FUNCTIONS
-------------------------------------------
--this functions displays the instructions
local function displayInstructions()
  transition.to(instrText, {alpha = 1, time = 1000})
end

--this function creates the animation (moves the wizard, scroll and displays the instructions after a period of time)
local function moveDino()
    transition.to(dino, {x = 900, y = 450, time = 1000})
    transition.to(instructions, {x = 400, y = 400,time = 1000})
    timer.performWithDelay(1000, displayInstructions)
    timerStarted2 = true
end

--this function hides the instructions and displays the explossion image
local function moveDino2()
    transition.to(dino, {x = 970, y = 600, height = 400, width = 300})
    transition.to(instructions, {alpha = 0})
    transition.to(instrText, {alpha = 0})
    timerStarted2 = false
    pauseButton.alpha = 1
end

--this functions checks the time
local function checkTime()
   if (timerStarted2 == false) then
      StartTimer2()
      UpdateTime2()
   end
end

--this function transition to the first cupboard screen
local function Cupboard1Transition( )  
    levelCounter = 2   
    composer.gotoScene( "cupboard1_screen", {effect = "fade", time = 0}) 
    if (soundPressed == false) then
      audio.stop(20)
    else
      playSound7()
    end
end 

--this function transition to the second cupboard screen
local function Cupboard2Transition( )  
    if (soundPressed == false) then
      audio.stop(20)
    else
      playSound7()
    end
    levelCounter = 2     
    composer.gotoScene( "cupboard2_screen", {effect = "fade", time = 0}) 
end 

--this function transition to the third cupboard screen
local function Cupboard3Transition( )  
    if (soundPressed == false) then
      audio.stop(20)
    else
      playSound7()
    end
    levelCounter = 2     
    composer.gotoScene( "cupboard3_screen", {effect = "fade", time = 0}) 
end 

--this function transition to the fourth cupboard screen
local function Cupboard4Transition( )  

    if (soundPressed == false) then
      audio.stop(20)
    else
      playSound7()
    end
    levelCounter = 2     
    composer.gotoScene( "cupboard4_screen", {effect = "fade", time = 0}) 
end 

--this function transition to the fifth cupboard screen
local function Cupboard5Transition( ) 
   if (soundPressed == false) then
      audio.stop(20)
    else
      playSound7()
    end 
    levelCounter = 2     
    composer.gotoScene( "cupboard5_screen", {effect = "fade", time = 0}) 
end 

--this function transition to the drawers screen
local function DrawersTransition( )  
    if (soundPressed == false) then
      audio.stop(20)
    else
      playSound7()
    end
    levelCounter = 2     
    composer.gotoScene( "drawers_screen", {effect = "fade", time = 0}) 
end 

--this function transition to the fridge screen
local function FridgeTransition( ) 
   if (soundPressed == false) then
      audio.stop(20)
    else
      playSound7()
    end 
    levelCounter = 2     
    composer.gotoScene( "fridge_screen", {effect = "fade", time = 0}) 
end 

--this function transition to the microwave screen
local function MicrowaveTransition( )
    if (soundPressed == false) then
      audio.stop(20)
    else
      playSound7()
    end
   levelCounter = 2      
   composer.gotoScene( "microwave_screen", {effect = "fade", time = 0})    
end 

--this function transition to the oven screen
local function OvenTransition( )
    if (soundPressed == false) then
      audio.stop(20)
    else
      playSound7()
    end
   levelCounter = 2      
   composer.gotoScene( "oven_screen", {effect = "fade", time = 0})    
end

--this function transition to the pause screen
local function pauseTransition()
    if (soundPressed == false) then
      audio.stop(20)
    else
      playSound7()
    end
  composer.showOverlay("pause5_screen", {isModal = true, effect = "fade", time = 500})
  StopTimer2()
end
--------------------------------------------
--GLOBAL FUNCTIONS
--------------------------------------------
  --this function stops the timer and hides the timer text
  function StopTimer2(event)
    timer.cancel(countDownTimer2)
    timerStarted2 = false
  end
 
  --this function updates the time
  function UpdateTime2()
    
    --decrement the number of seconds   
    secondsLeft2 = secondsLeft2 - 1

    --display the number of seconds left in the clock object
    clockText.text = secondsLeft2 .. "sec"
    
    if (secondsLeft2 < 0) then
      StopTimer2()
      composer.gotoScene("Lose_screen", {effect = "fade", time = 1000})      
      audio.stop(20)
      key1Touched = false
      key3Touched = false
      key4Touched = false
    end

  end

  function StartTimer2()
    -- create a countdown timer that loops indefinetly
    countDownTimer2 = timer.performWithDelay(1000, UpdateTime2, 0)
    timerStarted2 = true
  end

  function playSound7()
    bkgChannel = audio.play(bkgSound, {loop = -1, channel = 20})
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
      bkg = display.newImageRect("Level3/Level3ScreenValeriaV.png", 0, 0, 0, 0)
      bkg.width = display.contentWidth
      bkg.height = display.contentHeight+40
      bkg.x = 510
      bkg.y = 400
      sceneGroup:insert(bkg)


      

      ------------------------------------------------------------------------
      --CREATE THE OBJECTS (BUTTONS)

      --Creating First Cupboard Button
      cupboard1 = widget.newButton(
         {
             --set its possition on the screen 
              x = 95,
              y = 85,

               --Insert the images here
               defaultFile = "Separate/Drawer1Valeria.png",

              --set the size of the image
               width = 200,
               height = 200,

               -- When the button is released, call the LevelSelect screen transition function
               onRelease = Cupboard1Transition
            })

      sceneGroup:insert(cupboard1)

      --Creating Second Cupboard Button
      cupboard2 = widget.newButton(
         {
             --set its possition on the screen 
              x = 295,
              y = 83,

               --Insert the images here
               defaultFile = "Separate/Drawer1Valeria.png",

              --set the size of the image
               width = 200,
               height = 200,

               -- When the button is released, call the LevelSelect screen transition function
               onRelease = Cupboard2Transition
            })

      sceneGroup:insert(cupboard2)
  
     --Creating Third Cupboard Button
      cupboard3 = widget.newButton(
         {
             --set its possition on the screen 
              x = 98,
              y = 495,

               --Insert the images here
               defaultFile = "Separate/Drawer1Valeria.png",

              --set the size of the image
               width = 200,
               height = 180,

               -- When the button is released, call the LevelSelect screen transition function
               onRelease = Cupboard3Transition
            })

      sceneGroup:insert(cupboard3)

      --Creating Fourth Cupboard Button
      cupboard4 = widget.newButton(
         {
             --set its possition on the screen 
              x = 305,
              y = 475,

               --Insert the images here
               defaultFile = "Separate/Drawer2ValeriaV.png",

              --set the size of the image
               width = 215,
               height = 222,

               -- When the button is released, call the LevelSelect screen transition function
               onRelease = Cupboard4Transition
            })

      sceneGroup:insert(cupboard4)

      --Creating Fifth Cupboard Button
      cupboard5 = widget.newButton(
         {
             --set its possition on the screen 
              x = 713,
              y = 475,

               --Insert the images here
               defaultFile = "Separate/Drawer2ValeriaV.png",

              --set the size of the image
               width = 215,
               height = 222,

               -- When the button is released, call the LevelSelect screen transition function
               onRelease = Cupboard5Transition
            })

      sceneGroup:insert(cupboard5)
      
      --Creating  Drawer Button
      drawer = widget.newButton(
         {
             --set its possition on the screen 
              x = 513,
              y = 475,

               --Insert the images here
               defaultFile = "Separate/Drawer3ValeriaV.png",

              --set the size of the image
               width = 210,
               height = 222,

               -- When the button is released, call the LevelSelect screen transition function
               onRelease = DrawersTransition
            })

      sceneGroup:insert(drawer)

      --Creating Fridge Button
      fridge = widget.newButton(
         {
             --set its possition on the screen 
              x = 925,
              y = 368,

               --Insert the images here
               defaultFile = "Separate/FridgeValeriaV.png",

              --set the size of the image
               width = 210,
               height = 440,

               -- When the button is released, call the LevelSelect screen transition function
               onRelease = FridgeTransition
            })
      fridge:scale(-1,1)
      sceneGroup:insert(fridge)

      --Creating Oven Button
      oven = widget.newButton(
         {
             --set its possition on the screen 
              x = 93,
              y = 300,

               --Insert the images here
               defaultFile = "Separate/OvenValeriaV.png",

              --set the size of the image
               width = 210,
               height = 230,

               -- When the button is released, call the LevelSelect screen transition function
               onRelease = OvenTransition
            })
  
      sceneGroup:insert(oven)

      --Creating Microwave Button
      microwave= widget.newButton(
         {
             --set its possition on the screen 
              x = 485,
              y = 200,

               --Insert the images here
               defaultFile = "Separate/MicrowaveValeriaV.png",

              --set the size of the image
               width = 140,
               height = 130,

               -- When the button is released, call the LevelSelect screen transition function
               onRelease = MicrowaveTransition
            })
  
      sceneGroup:insert(microwave)

     ------------------------------------------------------------------------------ 
      dino = display.newImageRect("Level3/DinoValeriaV@2x.png", 0, 0, 0, 0)
      dino.x = -900
      dino.y = -100
      dino.width = 450
      dino.height = 600
      sceneGroup:insert(dino)

      instructions = display.newImageRect("Level3/scrollValeriaV.png", 0, 0, 0, 0)
      instructions.x = 1500
      instructions.y = 400
      instructions.height = 700
      instructions.width = 700
      sceneGroup:insert(instructions)

      instrText = display.newText("  In this level you \n have to find three\n  keys and answer \n 3 math questions.\nAfterwards you will\n win the game and\nsave the kingdom of\n Zeus. Don't forget\n     that you have\n       limited time.", 400, 400, native.systemFontBold, 50)
      instrText:setTextColor(0, 0, 0)
      instrText.alpha = 0
      sceneGroup:insert(instrText)

      bkgSound = audio.loadStream("Sounds/level3.mp3")

      --Creating Play Button
    pauseButton = widget.newButton(
      {
          --set its possition on the screen 
          x = 920,
          y = 70,

          --Insert the images here
          defaultFile = "ButtonImages/PauseButton.png",

          --set the size of the image
            width = 80,
            height = 80,

            -- When the button is released, call the LevelSelect screen transition function
            onRelease = pauseTransition

       })
    pauseButton.alpha = 0
    sceneGroup:insert(pauseButton)
      ----------------------------
      --TIMER OBJECTS
      ----------------------------
      --create the clock object
       clockText = display.newText("", 0, 0, native.systemFontBold, 55)
       clockText.x = 500
       clockText.y = 50
       clockText:setTextColor(255/255, 195/255, 0/255)
       sceneGroup:insert(clockText)
       
       --call the function
       timer.performWithDelay(0, moveDino)
       timer.performWithDelay(6000, moveDino2)
       timer.performWithDelay(6500, checkTime)


    
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
        print (timerStarted2)
        if (timerStarted2 == false) then
            StartTimer2()
            UpdateTime2()
        end

        if (soundPressed == true) then
          playSound7()
        end
       
    end
end
 
 
-- hide()
function scene:hide( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is on screen (but is about to go off screen)
 
    elseif ( phase == "did" ) then
        -- Code here runs immediately after the scene goes entirely off screen      
        
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
