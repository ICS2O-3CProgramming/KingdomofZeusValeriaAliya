-----------------------------------------------------------------------------------------
-- CreditsScreen.lua
-- Created by: Valeria Veverita
-- ICS2O
-- Description: This is the credits screen of the game
local composer = require( "composer" )

local widget = require("widget")

--give the name to the scene
sceneName = "Win_screen"

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
 local bkgSound
 local bkgChannel
 local bkgStop
 local pannel

  ------------------------
  --Musical Notes
  ------------------------
  local note1
  local note2
  local note3
  local note4
 -------------------------------------------------------------------------------------
 --LOCAL FUNCTIONS
 -----------------------------------------------------------------------------
 local function menuTransition()
    composer.gotoScene("main_menu", {effect = "fade", time = 300})
 end

 --this function animates te notes
 local function animateNotes()
   transition.to(note1, {alpha = 1, x = 900, y = 450, time = 500, rotation = 90})
   transition.to(note1, {x = 950, y = 500, time = 1000, roation = 120})
   transition.to(note1, {x = 950, y = 600, time = 1000, roation = 120})
 end
-- create()
function scene:create( event )
 
    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen
   ----------------------------------------
   --MUSICAL NOTES
   ---------------------------------------
   note1 = display.newImage("WinImages/note1.png")
   note1.x = 800
   note1.y = 400
   note1.alpha = 1
   -- --Associating display objects with this scene
   --sceneGroup:insert(note1)

    --create the background image
   bkg = display.newImageRect("MenuImages/MainMenuValeriaV.png", 0, 0, 0, 0)
   bkg.x = 510
   bkg.y = 385
   bkg.width = display.contentWidth
   bkg.height = display.contentHeight
   -- --Associating display objects with this scene
   sceneGroup:insert(bkg)

   --create the pannel
   pannel = display.newImage("WinImages/VictoryValeriaV.png")
   pannel.x = display.contentWidth/2
   pannel.y = display.contentHeight/2
   pannel.width = 750
   pannel.height = 700
   sceneGroup:insert(pannel)
    
   --create the sound
    bkgSound = audio.loadStream("Sounds/win.mp3")

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
     onRelease = menuTransition
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
        bkgChannel = audio.play(bkgSound)
        animateNotes()
 
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
        bkgStop = audio.stop(bkgChannel)
 
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