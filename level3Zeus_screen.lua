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

---------------------------------------------------------------------------------------
--GLOBAL VARIABLES
---------------------------------------------------------------------------------------
levelCounter = 0
mathCounter = 0

--TIMER VARIABLES
--local countDownTimer
totalSeconds1 = 60
secondsLeft1 = 60

timerStarted = false

soundPressed2 = true

--------------------------------------------
--LOCAL FUNCTIONS
-------------------------------------------
--this functions displays the instructions
local function displayInstructions()
  transition.to(instrText, {alpha = 1, time = 1000})
end
--this function creates the animation (moves the wizard, scroll and displays the instructions after a period of time)
local function moveZeus()
    transition.to(Zeus, {x = 850, y = 450, time = 1000})
    transition.to(instructions, {x = 400, y = 400,time = 1000})
    timer.performWithDelay(1000, displayInstructions)
    timerStarted = true
end

--this function hides the instructions and displays the explossion image
local function moveZeus2()
    transition.to(Zeus, {x = 970, y = 600, height = 300, width = 400})
    transition.to(instructions, {alpha = 0})
    transition.to(instrText, {alpha = 0})
    timerStarted = false
    pauseButton.alpha = 1
end

--this functions checks the time
local function checkTime()
   if (timerStarted == false) then
        StartTimer()
        UpdateTime()
   end
end

--this function transition to the first cupboard screen
local function Cupboard1Transition( ) 
  if (soundPressed2 == false) then
      audio.stop(21)
    else
      playSound8()
    end 
    levelCounter = 1     
    composer.gotoScene( "cupboard1_screen", {effect = "fade", time = 0}) 
end 

--this function transition to the second cupboard screen
local function Cupboard2Transition( ) 
    if (soundPressed2 == false) then
      audio.stop(21)
    else
      playSound8()
    end 
    levelCounter = 1     
    composer.gotoScene( "cupboard2_screen", {effect = "fade", time = 0}) 
end 

--this function transition to the third cupboard screen
local function Cupboard3Transition( )  
    if (soundPressed2 == false) then
      audio.stop(21)
    else
      playSound8()
    end 
    levelCounter = 1     
    composer.gotoScene( "cupboard3_screen", {effect = "fade", time = 0}) 
end 

--this function transition to the fourth cupboard screen
local function Cupboard4Transition( ) 
    if (soundPressed2 == false) then
      audio.stop(21)
    else
      playSound8()
    end  
    levelCounter = 1     
    composer.gotoScene( "cupboard4_screen", {effect = "fade", time = 0}) 
end 

--this function transition to the fifth cupboard screen
local function Cupboard5Transition( )  
    if (soundPressed2 == false) then
      audio.stop(21)
    else
      playSound8()
    end 
    levelCounter = 1     
    composer.gotoScene( "cupboard5_screen", {effect = "fade", time = 0}) 
end 

--this function transition to the drawers screen
local function DrawersTransition( )  
    if (soundPressed2 == false) then
      audio.stop(21)
    else
      playSound8()
    end 
    levelCounter = 1     
    composer.gotoScene( "drawers_screen", {effect = "fade", time = 0}) 
end 

--this function transition to the fridge screen
local function FridgeTransition( )
    if (soundPressed2 == false) then
      audio.stop(21)
    else
      playSound8()
    end   
    levelCounter = 1     
    composer.gotoScene( "fridge_screen", {effect = "fade", time = 0}) 
end 

--this function transition to the oven screen
local function OvenTransition( ) 
    if (soundPressed2 == false) then
      audio.stop(21)
    else
      playSound8()
    end  
    levelCounter = 1     
    composer.gotoScene( "oven_screen", {effect = "fade", time = 0}) 
end 

--this function transition to the microwave screen
local function MicrowaveTransition( )  
    if (soundPressed2 == false) then
      audio.stop(21)
    else
      playSound8()
    end 
    levelCounter = 1     
    composer.gotoScene( "microwave_screen", {effect = "fade", time = 0}) 
end 

--this function transition to the pause screen
local function pauseTransition()
   if (soundPressed2 == false) then
      audio.stop(21)
    else
      playSound8()
    end 
  composer.showOverlay("pause6_screen", {isModal = true, effect = "fade", time = 500})
  StopTimer()
end
--------------------------------------------
--GLOBAL FUNCTIONS
--------------------------------------------
  --this function stops the timer and hides the timer text
  function StopTimer(event)
    timer.cancel(countDownTimer)
    timerStarted = false
  end
 
  --this function updates the time
  function UpdateTime()
    
    --decrement the number of seconds   
    secondsLeft1 = secondsLeft1 - 1

    --display the number of seconds left in the clock object
    clockText.text =secondsLeft1 .. "sec"

    
    if (secondsLeft1 < 0) then
      StopTimer()
      composer.gotoScene("Lose_screen", {effect = "fade", time = 1000})      
      audio.stop(21)
      key2Touched = false
      key5Touched = false
      key6Touched = false
    end

  end

  function StartTimer()
    -- create a countdown timer that loops indefinetly
    countDownTimer = timer.performWithDelay(1000, UpdateTime, 0)
    timerStarted = true
  end

  function playSound8()
    bkgChannel = audio.play(bkgSound, {loop = -1, channel = 21})
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

      Zeus = display.newImageRect("Level3/ZeusValeriaV@2x.png", 0, 0, 0, 0)
      Zeus.x = -900
      Zeus.y = -100
      Zeus.width = 600
      Zeus.height = 500
      sceneGroup:insert(Zeus)

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
       timer.performWithDelay(0, moveZeus)
       timer.performWithDelay(6000, moveZeus2)
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
        print (timerStarted)
        if (timerStarted == false) then
            StartTimer()
            UpdateTime()
        end

        if (soundPressed2 == true) then
          playSound8()
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
