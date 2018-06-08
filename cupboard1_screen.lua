-----------------------------------------------------------------------------------------
-- level2.lua
-- Created by: Valeria & Aliya
-- Date: May 10th, 2018
-- Description: 

-- Naming scene



local composer = require( "composer" )

local widget = require ("widget")

local sceneName = "cupboard1_screen.lua" 
local scene = composer.newScene( sceneName )

---------------------------------------------------------------------------------------
--LOCAL VARIABLES
---------------------------------------------------------------------------------------
local bkg
local backButton
local key
--TIMER VARIABLES
local clockText

levelCounter = 1
-----------------------------------------
--SOUND
-----------------------------------------
--- Background sound 


--correctSound


--magic sound


--------------------------------------------
--LOCAL FUNCTIONS
-------------------------------------------

--this function transition to the first cuboard screen

local function level3Transition( )
  if (levelCounter == 1) then
    composer.gotoScene( "level3Zeus_screen", {effect = "fade", time = 0}) 
  end
end 

--this function displays or not (depends on the scene) the key
local function displayKey()
  if (levelCounter == 1) then
    key.isVisible = true
  elseif(levelCounter == 1)then
    key.isVisible = false
  end
end

--this function to the simple division scene
local function divisionScene()
  composer.showOverlay("division_scene", {isModal = true, effect = "fade", time = 500})
end

--[[local function displayTimer( )
  if (levelCounter == 1) then
    --this function updates the time
    
    --decrement the number of seconds   
    secondsLeft1 = secondsLeft1 - 1

    --display the number of seconds left in the clock object
    clockText.text = minutesLeft1 .. "min " .. secondsLeft1 .. "sec"

    if (secondsLeft1 == 0) then
        --reset the number of seconds
        secondsLeft1 = totalSeconds1
        minutesLeft1 = minutesLeft1 - 1
    end
    
    if (minutesLeft1 < 0) then
      --composer.gotoScene("Lose_screen", {effect = "fade", time = 1000}) 
      --StopTimer()     
      timer.cancel(countDownTimer)
      clockText.isVisble = false
    end
  end
end ]]
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
      bkg = display.newImageRect("OpenObjects/OpenDrawer5.png", 0, 0, 0, 0)
      bkg.width = display.contentWidth
      bkg.height = display.contentHeight+40
      bkg.x = 510
      bkg.y = 400
      sceneGroup:insert(bkg)

      --create back button
      backButton = widget.newButton(
        {  
            --load the image files
            defaultFile = "ButtonImages/BackButtonUnpressed.png",
            overFile = "ButtonImages/BackButtonPressed.png",
            --set the possition
            x = 120,
            y = 100,
            --set the size
            width = 200,
            height = 200,
            -- when the button is pressed call the function go to main scene
            onRelease = level3Transition
          })
      sceneGroup:insert(backButton)

      --create the key
      key = widget.newButton(
        {
          --load the image files
          defaultFile = "Level3/KeyValeriaV.png",
          --set the position
          x = 400,
          y = 470,
          -- when the button is pressed call the function go to main scene
          onRelease = divisionScene
         })
      key.isVisible = false
      sceneGroup:insert(key)


      ----------------------------
      --TIMER OBJECTS
      ----------------------------
      --create the clock object
       clockText = display.newText("", 0, 0, native.systemFontBold, 55)
       clockText.x = 870
       clockText.y = 50
       clockText:setTextColor(255/255, 195/255, 0/255)
       sceneGroup:insert(clockText)
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
        --displayTimer( )
        displayKey()
       
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
