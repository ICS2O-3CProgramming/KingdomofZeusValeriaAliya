-----------------------------------------------------------------------------------------
-- main_menu.lua
-- Created by: Valeria Veverita
-- ICS2O
-- Description: This is the main menu, displaying the credits, instructions & play button

local composer = require( "composer" )

--give the name to the scene
sceneName = "pause1_screen"

--creating scene object 
local scene = composer.newScene(sceneName)

local widget = require ("widget")
  
--------------------------------------------------------------------------------------
--LOCAL VARIABLES
--------------------------------------------------------------------------------------
local bkg
local cover
local soundButtonOn
local soundButtonOff
local title
local titleLight
local bkgStop
local resumeButton
local mainButton


--------------------------
--SOUND
--------------------------


-------------------------------------------------------------------------------------
--LOCAL FUNCTIONS
------------------------------------------------------------------------------------
--creating sound button function
local function soundOn1()
   playSound8()
   soundPressed2 = true
   soundButtonOff.isVisible = false
   soundButtonOn.isVisible = true
end

--creating mute function
local function soundOff1()
  bkg.stop = audio.stop(21)
  soundPressed2 = false
  soundButtonOn.isVisible = false
  soundButtonOff.isVisible = true
end

--this function trasnition to the level 1 archer
local function archerTransition()
  composer.hideOverlay("fade", 500)
end

--this function transition to the main menu
local function menuTransition()
  composer.gotoScene("main_menu", {effect = "fade", time = 500})
  StopTimer()
  audio.stop(21)
end
-----------------------------------------------------------------------------------------

-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------
 

-- create()
function scene:create( event )
 
    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen
   
   ----------------------------------------------------------------------------------------
   --CREATE OBJECTS
   -----------------------------------------------------------------------------------------
    cover = display.newRect(display.contentWidth/2, display.contentHeight/2, display.contentWidth, display.contentHeight)
    cover:setFillColor(0, 0, 0)
    cover.alpha = 0.5
    sceneGroup:insert(cover)

    bkg = display.newImageRect("Level3/scrollValeriaV.png", 0, 0,
     0, 0)
    bkg.x = display.contentWidth / 2
    bkg.y = display.contentHeight / 2
    bkg.width = 800
    bkg.height = 700
    sceneGroup:insert(bkg)

    --create the title brightness effect
    titleLight = display.newImage("MenuImages/TitleLight.png")
    titleLight.x = display.contentWidth/2-15
    titleLight.y = display.contentHeight/2-230
    titleLight:scale(1, 1.5)
    -- Associating display objects with this scene
    sceneGroup:insert(titleLight)

    --create the title
    title = display.newImage("MenuImages/TitleValeriaV.png")
    title.x = display.contentWidth/2-15
    title. y = display.contentHeight/2-230
    title:scale(1, 1.3)
    -- Associating display objects with this scene
    sceneGroup:insert(title)
     --Creating Sounds Button
    soundButtonOn = widget.newButton(
     { 
         --set its position on the screen
         x = display.contentWidth/2,
         y = display.contentHeight/2-120,

         --Insert the image
         defaultFile = "ButtonImages/SoundButton.png",

         --set the size of the image
         width = 110,
         height = 110,
         --when the button is released, call the soundOff function
         onRelease = soundOff1

     })
    soundButtonOn.isVisible = true
    --Associating display objects with this scene
    sceneGroup:insert(soundButtonOn)
   
    --Creating Sounds Button
   soundButtonOff = widget.newButton(
     { 
         --set its position on the screen
         x = display.contentWidth/2,
         y = display.contentHeight/2-120,

         --Insert the image
         defaultFile = "ButtonImages/MuteButton.png",

         --set the size of the image
         width = 110,
         height = 110,
         --when the button is released, call the soundOff function
         onRelease = soundOn1

     })
    soundButtonOff.isVisible = false
    --Associating display objects with this scene
    sceneGroup:insert(soundButtonOff)

    --Creating Sounds Button
   resumeButton = widget.newButton(
     { 
         --set its position on the screen
         x = display.contentWidth/2,
         y = display.contentHeight/2+30,

         --Insert the image
         defaultFile = "ButtonImages/ResumeButtonUnpressed.png",
         overFile = "ButtonImages/ResumeButtonPressed.png",

         --set the size of the image
         width = 220,
         height = 170,
         --when the button is released, call the soundOff function
         onRelease = archerTransition

     })
    resumeButton.isVisible = true
    --Associating display objects with this scene
    sceneGroup:insert(resumeButton)

     --Creating Sounds Button
   mainButton = widget.newButton(
     { 
         --set its position on the screen
         x = display.contentWidth/2,
         y = display.contentHeight/2+210,

         --Insert the image
         defaultFile = "ButtonImages/MainButtonUnpressed.png",
         overFile = "ButtonImages/MainButtonPressed.png",

         --set the size of the image
         width = 220,
         height = 170,
         --when the button is released, call the soundOff function
         onRelease = menuTransition

     })
    mainButton.isVisible = true
    --Associating display objects with this scene
    sceneGroup:insert(mainButton)

    
    
end
 
 
-- show()
function scene:show( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)
        if (soundPressed2 == true) then
            soundOn1()
        elseif(soundPressed2 == false) then
            soundOff1()
        end 
 
    elseif ( phase == "did" ) then
        -- Code here runs when the scene is entirely on screen
    
        
 
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
        --audio.stop(bkgChannel)
        UpdateTime()
        StartTimer()
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