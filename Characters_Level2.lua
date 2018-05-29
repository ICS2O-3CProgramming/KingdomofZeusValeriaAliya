-----------------------------------------------------------------------------------------
--Characetrs_Level1.lua
-- Created by: Valeria Veverita
-- ICS2O
-- Description: This is the credits screen of the game
local composer = require( "composer" )

local widget = require("widget")

--give the name to the scene
sceneName = "Characetrs_Level2"

--creating scene object 
local scene = composer.newScene(sceneName)
  
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------
 
 --------------------------------------------------------------------------------
 --LOCAL VARIABLES
 ----------------------------------------------------------------------------
 local bkg
 local backButton

 local pannel

 local rabbit
 local wizzard
 -------------------------------------------------------------------------------------
 --LOCAL FUNCTIONS
 -----------------------------------------------------------------------------
 --this function moves to main menu
 local function selectTransition()
    composer.gotoScene("Select_screen", {effect = "fade", time = 300})
 end
 
 --these functions move to the level one (different characters)
 local function LevelRabbitTransition()
    composer.gotoScene("level2Rabbit_screen", {effect = "fade", time = 300})
    audio.stop(1)
 end

 local function LevelWizzardTransition()
    composer.gotoScene("level2Wizzard_screen", {effect = "fade", time = 300})
    audio.stop(1)
 end
----------------------------------------------------------------------------------
--GLOBAL SECENE FUNCTIONS
----------------------------------------------------------------------------------

-- create()
function scene:create( event )
 
    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen

    --create the background image
   bkg = display.newImageRect("MenuImages/MainMenuValeriaV.png", 0, 0, 0, 0)
   bkg.x = 510
   bkg.y = 385
   bkg.width = display.contentWidth
   bkg.height = display.contentHeight
   -- --Associating display objects with this scene
   sceneGroup:insert(bkg)
   
    --create the pannel
    pannel = display.newImage("SelectImages/SelectValeriaV.png")
    pannel.x = display.contentWidth/2
    pannel.y = display.contentHeight/2+50
    pannel.width = 1000
    pannel.height = 500
    -- --Associating display objects with this scene
   sceneGroup:insert(pannel)
  
   -----------------------------------
   --CHARACTERS
   ------------------------------------
   -- create the tv
   rabbit = widget.newButton(
     {
     --load the image files
     defaultFile = "CharactersSelect/level2Rabbit.png",
  
     --set the possition
     x = 300,
     y = 410,
     --set the size
     width = 400,
     height = 450,
     -- when the button is pressed call the function go to main scene
     onRelease = LevelRabbitTransition
      })
   -- --Associating display objects with this scene
   sceneGroup:insert(rabbit)


    -- create the archer
   wizzard = widget.newButton(
     {
     --load the image files
     defaultFile = "CharactersSelect/level2Wizard.png",
  
     --set the possition
     x = 700,
     y = 430,
     --set the size
     width = 450,
     height = 450,
     -- when the button is pressed call the function go to main scene
     onRelease = LevelWizzardTransition
      })
   -- --Associating display objects with this scene
   sceneGroup:insert(wizzard)


   ------------------------------
   --BUTTONS
   -----------------------------
   --create the back button
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
     onRelease = selectTransition
      })
     sceneGroup:insert(backButton)



   
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