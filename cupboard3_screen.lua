-----------------------------------------------------------------------------------------
-- level2.lua
-- Created by: Valeria & Aliya
-- Date: May 10th, 2018
-- Description: 

-- Naming scene



local composer = require( "composer" )

local widget = require ("widget")

local sceneName = "cupboard3_screen.lua" 
local scene = composer.newScene( sceneName )

---------------------------------------------------------------------------------------
--LOCAL VARIABLES
---------------------------------------------------------------------------------------
local bkg
local backButton

---------------------------------------------------------------------------------------
--GLOBAL VARIABLES
---------------------------------------------------------------------------------------
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
  elseif (levelCounter == 2) then
    composer.gotoScene( "level3Dino_screen", {effect = "fade", time = 0}) 
  end
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
      bkg = display.newImageRect("OpenObjects/OpenDrawer.png", 0, 0, 0, 0)
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
