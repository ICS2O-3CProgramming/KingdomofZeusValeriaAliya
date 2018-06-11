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

 --this functions animate musical notes
 local function animateNotes1()
   transition.to(note1, {x = 900, y = 550, rotation = 90, alpha = 1, time = 1000})
   transition.to(note2, {x = 900, alpha = 1, rotation = 40, time = 1000})
   transition.to(note3, {x = 900, y = 300, alpha = 1, time = 1000})
   transition.to(note4, {x = 900, y = 200, alpha = 1, time = 1000, rotation = -30})
   transition.to(note5, {x = 170, y = 550, rotation = -90, alpha = 1, time = 1000})
   transition.to(note6, {x = 170, alpha = 1, rotation = -40, time = 1000})
   transition.to(note7, {x = 170, y = 300, alpha = 1, time = 1000})
   transition.to(note8, {x = 170, y = 200, alpha = 1, time = 1000, rotation = 30})
 end

 local function animateNotes2()
   transition.to(note1, {x = 950, y = 600, rotation = -50, time = 1000})
   transition.to(note2, {x = 950, y = 450, alpha = 1, rotation = 40, time = 1000})
   transition.to(note3, {x = 950, y = 250, alpha = 1, time = 1000, rotation = -30})
   transition.to(note4, {x = 950, y = 100, alpha = 1, time = 1000, rotation = 30})
   transition.to(note5, {x = 100, y = 600, rotation = 50, alpha = 1, time = 1000})
   transition.to(note6, {x = 100, y = 450, alpha = 1, rotation = -40, time = 1000})
   transition.to(note7, {x = 100, y = 250, alpha = 1, time = 1000, rotation = 30})
   transition.to(note8, {x = 100, y = 100, alpha = 1, time = 1000, rotation = -30})
 end

 local function animateNotes3()
   transition.to(note1, {x = 1000, y = 620, rotation = -50, time = 1000})
   transition.to(note2, {x = 1000, y = 400, alpha = 1, rotation = -40, time = 1000})
   transition.to(note3, {x = 1000, y = 200, alpha = 1, time = 1000, rotation = 45})
   transition.to(note4, {x = 1000, y = 50, alpha = 1, time = 1000, rotation = 30})
   transition.to(note5, {x = 50, y = 620, rotation = 50, time = 1000})
   transition.to(note6, {x = 50, y = 400, alpha = 1, rotation = 40, time = 1000})
   transition.to(note7, {x = 50, y = 200, alpha = 1, time = 1000, rotation = -45})
   transition.to(note8, {x = 50, y = 50, alpha = 1, time = 1000, rotation = -30})
 end

 local function animateNotes4()
   transition.to(note1, {x = 1200, y = 630, rotation = 50,time = 1000})
   transition.to(note2, {x = 1200, y = 410, alpha = 1, rotation = 40, time = 1000})
   transition.to(note3, {x = 1200, y = 210, alpha = 1, time = 1000, rotation = -45})
   transition.to(note4, {x = 1200, y = 60, alpha = 1, time = 1000, rotation = -30})
   transition.to(note5, {x = -40, y = 630, rotation = -50,time = 1000})
   transition.to(note6, {x = -40, y = 410, alpha = 1, rotation = -40, time = 1000})
   transition.to(note7, {x = -40, y = 210, alpha = 1, time = 1000, rotation = 45})
   transition.to(note8, {x = -40, y = 60, alpha = 1, time = 1000, rotation = 30})
 end

 local function animateNotes()
    animateNotes1()
    timer.performWithDelay(1000, animateNotes2)
    timer.performWithDelay(2000, animateNotes3)
    timer.performWithDelay(3000, animateNotes4)
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
 -------------------------------------------------------------------------------------
 --GLOBAL SCENE FUNCTION
 -----------------------------------------------------------------------------

-- create()
function scene:create( event )
 
    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen
   ----------------------------------------
   --MUSICAL NOTES
   ---------------------------------------

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
    
    -------------------------------------
    --MUSICAL NOTES
    -------------------------------------
    note1 = display.newImage("WinImages/note1.png")
    note1.x = 830
    note1.y = 400
    note1.width = 100
    note1.height = 100
    note1:scale(-1, 1)
    note1.alpha = 0 
    sceneGroup:insert(note1)

   ------------------------------------------------------

   note2 = display.newImage("WinImages/note2.png") 
   note2.x = 830
   note2.y = 400
   note2.width = 100
   note2.height = 100
   note2:scale(-1, 1) 
   note2.alpha = 0 
   sceneGroup:insert(note2)

   ------------------------------------------------------

   note3 = display.newImage("WinImages/note3.png")
   note3.x = 830
   note3.y = 400
   note3.width = 100
   note3.height = 100
   note3:scale(-1, 1)
   note3.alpha = 0 
   sceneGroup:insert(note3)

   ------------------------------------------------------

   note4 = display.newImage("WinImages/note4.png")
   note4.x = 830
   note4.y = 400
   note4.width = 100
   note4.height = 100
   note4:scale(-1, 1)
   note4.alpha = 0 
   sceneGroup:insert(note4)

   ------------------------------------------------------

   note5 = display.newImage("WinImages/note1.png")
   note5.x = 230
   note5.y = 400
   note5.width = 100
   note5.height = 100
   note5.alpha = 1 
   sceneGroup:insert(note5)

   ------------------------------------------------------

   note6 = display.newImage("WinImages/note2.png")
   note6.x = 230
   note6.y = 400
   note6.width = 100
   note6.height = 100
   note6.alpha = 1 
   sceneGroup:insert(note6)

   ------------------------------------------------------

   note7 = display.newImage("WinImages/note3.png")
   note7.x = 230
   note7.y = 400
   note7.width = 100
   note7.height = 100
   note7.alpha = 1 
   sceneGroup:insert(note7)

   ------------------------------------------------------

   note8 = display.newImage("WinImages/note4.png")
   note8.x = 230
   note8.y = 400
   note8.width = 100
   note8.height = 100
   note8.alpha = 1 
   sceneGroup:insert(note8)
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
        turnTouch()
 
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