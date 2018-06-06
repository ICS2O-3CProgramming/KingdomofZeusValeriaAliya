-----------------------------------------------------------------------------------------
-- level2.lua
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

local drawer1
local drawer2
local drawer3
local drawer4
local drawer5
local drawer6
local fridge
local oven
local microwave

-- set the boolean varibales to know if they have already touched an image 


-----------------------------------------
--SOUND
-----------------------------------------
--- Background sound 


--correctSound


--magic sound


--this variable will set randomly the possition of the puzzles


--------------------------------------
--PUZZLE FADED
--------------------------------------


---------------------------------------
--PUZZLE PIECES
---------------------------------------


-----------------------------------------
--PUZZLE PIECES (POSITION)
-----------------------------------------
---------
--X-VALUE
---------

---------
--Y-VALUE
---------


--------------------------------------------
--LOCAL FUNCTIONS
-------------------------------------------

--this function transition to the drawer screen
-- Creating Transition Function to Credits Page
local function CreditsTransition( )       
    composer.gotoScene( "CreditsScreen", {effect = "fade", time = 0}) 
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

      --Creating First Drawer Button
      drawer1 = widget.newButton(
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
               onRelease = CreditsTransition
            })

      sceneGroup:insert(drawer1)

      --Creating Second Drawer Button
      drawer2 = widget.newButton(
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
               onRelease = CreditsTransition
            })

      sceneGroup:insert(drawer2)
  
     --Creating Third Drawer Button
      drawer3 = widget.newButton(
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
               onRelease = CreditsTransition
            })

      sceneGroup:insert(drawer3)

      --Creating Fourth Drawer Button
      drawer4 = widget.newButton(
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
               onRelease = CreditsTransition
            })

      sceneGroup:insert(drawer4)

      --Creating Fifth Drawer Button
      drawer5 = widget.newButton(
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
               onRelease = CreditsTransition
            })

      sceneGroup:insert(drawer5)
      
       --Creating Fifth Drawer Button
      drawer6 = widget.newButton(
         {
             --set its possition on the screen 
              x = 713,
              y = 475,

               --Insert the images here
               defaultFile = "Separate/Drawer3ValeriaV.png",

              --set the size of the image
               width = 215,
               height = 222,

               -- When the button is released, call the LevelSelect screen transition function
               onRelease = CreditsTransition
            })

      sceneGroup:insert(drawer6)


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
