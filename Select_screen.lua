-----------------------------------------------------------------------------------------
-- CreditsScreen.lua
-- Created by: Valeria Veverita
-- ICS2O
-- Description: This is the credits screen of the game
local composer = require( "composer" )

local widget = require("widget")

--give the name to the scene
sceneName = "Select_screen"

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

 local pannel
 local level1
 local level2
 local level3

 local lock1
 local lock2

 local tv
 local archer
 -------------------------------------------------------------------------------------
 --LOCAL FUNCTIONS
 -----------------------------------------------------------------------------
 --this function moves to main menu
 local function menuTransition()
    composer.gotoScene("main_menu", {effect = "fade", time = 300})
 end
 
 --these functions move to the level one (different characters)
 local function LevelTvTransition()
    composer.gotoScene("level1TV_screen", {effect = "fade", time = 300})
 end

 local function LevelArcherTransition()
    composer.gotoScene("level1Archer_screen", {effect = "fade", time = 300})
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
   
    --create the pannel
    pannel = display.newImage("SelectImages/SelectValeriaV.png")
    pannel.x = display.contentWidth/2
    pannel.y = display.contentHeight/2
    pannel.width = 800
    pannel.height = 800
    -- --Associating display objects with this scene
   sceneGroup:insert(pannel)
   
   ------------------------------
   --LEVELS
   -----------------------------
   --create the level1
   level1 = display.newImage("SelectImages/level1.png")
   level1.x = 290
   level1.y = 200
   -- --Associating display objects with this scene
   sceneGroup:insert(level1)

   --create the level2
   level2 = display.newImage("SelectImages/level2.png")
   level2.x = 530
   level2.y = 200
   -- --Associating display objects with this scene
   sceneGroup:insert(level2)

   --create the level3
   level3 = display.newImage("SelectImages/level3.png")
   level3.x = 780
   level3.y = 200
   -- --Associating display objects with this scene
   sceneGroup:insert(level3)
   
   ---------------------------------
   --LOCKS
   ---------------------------------
   --CREATE THE FIRST LOCK
   lock1 = display.newImage("SelectImages/lockValeriaV.png")
   lock1.x = 526
   lock1.y = 280
   -- --Associating display objects with this scene
   sceneGroup:insert(lock1)

   --create the second lock
   lock2 = display.newImage("SelectImages/lockValeriaV.png")
   lock2.x = 780
   lock2.y = 280
   -- --Associating display objects with this scene
   sceneGroup:insert(lock2)

   -----------------------------------
   --CHARACTERS
   ------------------------------------
   -- create the tv
   tv = widget.newButton(
     {
     --load the image files
     defaultFile = "Level1Images/WalkingTvValeria&Aliya@2x.png",
  
     --set the possition
     x = 350,
     y = 500,
     --set the size
     width = 400,
     height = 300,
     -- when the button is pressed call the function go to main scene
     onRelease = LevelTvTransition
      })
   -- --Associating display objects with this scene
   sceneGroup:insert(tv)


    -- create the archer
   archer = widget.newButton(
     {
     --load the image files
     defaultFile = "Level1Images/ArcherValeriaV@2x.png",
  
     --set the possition
     x = 700,
     y = 500,
     --set the size
     width = 300,
     height = 400,
     -- when the button is pressed call the function go to main scene
     onRelease = LevelArcherTransition
      })
   -- --Associating display objects with this scene
   sceneGroup:insert(archer)


   ------------------------------
   --BUTTONS
   -----------------------------
   --create the sound
    bkgSound = audio.loadStream("Sounds/mainS.mp3")

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
        audio.stop(bkgChannel)
 
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