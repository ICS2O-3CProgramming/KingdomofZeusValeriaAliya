-----------------------------------------------------------------------------------------
-- CreditsScreen.lua
-- Created by: Valeria Veverita
-- ICS2O
-- Description: This is the credits screen of the game
local composer = require( "composer" )

local widget = require("widget")

--give the name to the scene
sceneName = "Lose_screen"

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
 local explosion
 local loseText

 local fire1
 local fire2
 local fire3
 local fire4
 local fire5
 local fire6
 local fire7
 -------------------------------------------------------------------------------------
 --LOCAL FUNCTIONS
 -----------------------------------------------------------------------------
 local function menuTransition()
    composer.gotoScene("main_menu", {effect = "fade", time = 300})
 end

 local function explosionStarts()
   transition.to(explosion, {alpha = 1, time = 1000})
   transition.to(fire1, {alpha = 1})
   transition.to(fire2, {alpha = 1})
   transition.to(fire3, {alpha = 1})
   transition.to(fire4, {alpha = 1})
   transition.to(fire5, {alpha = 1})
   transition.to(fire6, {alpha = 1})
   transition.to(fire7, {alpha = 1})
   transition.to(loseText, {alpha = 1})
 end

 local function fireMove()
   transition.to(fire1, {x = 1200, y = -100, time = 1000})
   transition.to(fire2, {x = -100, y = -100, time = 1000})
   transition.to(fire3, { y = -100, time = 1000})
   transition.to(fire4, {x = -100, y = 350, time = 1000})
   transition.to(fire5, {x = 1200, y = 350, time = 1000})
   transition.to(fire6, {x = -100, y = 800, time = 1000})
   transition.to(fire7, {x = 1200, y = 800, time = 1000})
 end 

  --this functions turn key touched false
 local function turnTouch()
    --Dino screen
    key1Touched = false
    key3Touched = false
    key4Touched = false
    --Zeus screen
    key2Touched = false
    key5Touched = false
    key6Touched = false
    mathCounter = 0

    secondsLeft2 = 60
    secondsLeft1 = 60
 end
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
    
   --create the sound
    bkgSound = audio.loadStream("Sounds/explosion.mp3")
   
   -----------------------------------------
   --CREATE THE FIRE
   -----------------------------------------
   fire1 = display.newImage("LoseImages/exlposionValeriaV.png")
   fire1.x = display.contentWidth/2
   fire1.y = display.contentHeight/2
   fire1.width = 150
   fire1.height = 150
   fire1.alpha = 0
   -- --Associating display objects with this scene
   sceneGroup:insert(fire1)

   fire2 = display.newImage("LoseImages/exlposionValeriaV.png")
   fire2.x = display.contentWidth/2
   fire2.y = display.contentHeight/2
   fire2.width = 150
   fire2.height = 150
   fire2.rotation = -90
   fire2.alpha = 0
   -- --Associating display objects with this scene
   sceneGroup:insert(fire2)

   fire3 = display.newImage("LoseImages/exlposionValeriaV.png")
   fire3.x = display.contentWidth/2
   fire3.y = display.contentHeight/2
   fire3.width = 150
   fire3.height = 150
   fire3.rotation = -40
   fire3.alpha = 0
   -- --Associating display objects with this scene
   sceneGroup:insert(fire3)

   fire4 = display.newImage("LoseImages/exlposionValeriaV.png")
   fire4.x = display.contentWidth/2
   fire4.y = display.contentHeight/2
   fire4.width = 150
   fire4.height = 150
   fire4.rotation = -140
   fire4.alpha = 0
   -- --Associating display objects with this scene
   sceneGroup:insert(fire4)

   fire5 = display.newImage("LoseImages/exlposionValeriaV.png")
   fire5.x = display.contentWidth/2
   fire5.y = display.contentHeight/2
   fire5.width = 150
   fire5.height = 150
   fire5.rotation = 50
   fire5.alpha = 0
   -- --Associating display objects with this scene
   sceneGroup:insert(fire5)

   fire6 = display.newImage("LoseImages/exlposionValeriaV.png")
   fire6.x = display.contentWidth/2
   fire6.y = display.contentHeight/2
   fire6.width = 150
   fire6.height = 150
   fire6.rotation = -180
   fire6.alpha = 0
   -- --Associating display objects with this scene
   sceneGroup:insert(fire6)

   fire7 = display.newImage("LoseImages/exlposionValeriaV.png")
   fire7.x = display.contentWidth/2
   fire7.y = display.contentHeight/2
   fire7.width = 150
   fire7.height = 150
   fire7.rotation = 80
   fire7.alpha = 0
   -- --Associating display objects with this scene
   sceneGroup:insert(fire7)
   
   --create explosionexplosion
   explosion = display.newImage("LoseImages/ExplosionValeriaV.png")
   explosion.x = display.contentWidth/2
   explosion.y = display.contentHeight/2
   explosion.width = 750
   explosion.height = 750
   explosion.alpha = 0
   -- --Associating display objects with this scene
   sceneGroup:insert(explosion)

   --create the text
   loseText = display.newImage("LoseImages/youloseValeriaV.png")
   loseText.x = display.contentWidth/2
   loseText.y = display.contentHeight/2
   loseText.alpha = 0
   -- --Associating display objects with this scene
   sceneGroup:insert(loseText)

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
        explosionStarts()
        turnTouch()
        timer.performWithDelay(2000, fireMove)
 
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