-----------------------------------------------------------------------------------------
-- level1_screen.lua
-- Created by: Valeria Veverita
-- ICS2O
-- Description: This is the background of level 1

local composer = require( "composer" )
local widget = require( "widget")

--give the name to the scene
sceneName = "level1_screen"

--creating scene object 
local scene = composer.newScene(sceneName)
  
--------------------------------------------------------------------------------
--LOCAL VARIABLES
----------------------------------------------------------------------------
--background
local bkg

--animation book and TV
local bookClosed
local bookOpen
local walkingTV

--Choose question
local chooseQuest

--Question function
local question
local correctAnswer
local wrongFirst
local wrongSecond

--Choose possition of the answers
local choosePosition

-- this variable displays the correct text
local correct

-- Boolean variable that states if user clicked the answer or not
local alreadyClickedAnswer = false
-----------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
------------------------------------------------------------------------------------
--This function animate the book (it opens)
local function openBook()
  transition.to(bookClosed, {alpha = 0, time = 1000})
  transition.to(bookOpen, {alpha = 1, time = 1000})
end


--This function moves the TV
local function moveTV()
  transition.to(walkingTV, {x = display.contentWidth/2+300, y = display.contentHeight/2+300, time = 1000})
end


-- This function creates the first question and answers
  local function firstQuestion()

   --create the question and set the color
   question = display.newText("Je me _____(être) bien amusée.", display.contentWidth/2, display.contentHeight/2-200, native.systemFontBold, 60)
   question:setTextColor(87/255, 53/255, 4/255)

   ---------------------------------------------
   --CreateAnswers
   ---------------------------------------------
   correctAnswer = display.newImage("Question1/Correctsuis.png")
   correctAnswer.y = display.contentHeight/2-30

   wrongFirst = display.newImage("Question1/Wrongest.png")
   wrongFirst.y = display.contentHeight/2-30

   wrongSecond = display.newImage("Question1/Wrongsoit.png")
   wrongSecond.y = display.contentHeight/2-30

   --------------------------------------------
   --Choose Position of Answers
   -------------------------------------------
   choosePosition = math.random(1,3)

   if (choosePosition == 1 ) then
      correctAnswer.x = display.contentWidth/4
      wrongFirst.x = display.contentWidth/2
      wrongSecond.x = display.contentWidth/3*2.3

    elseif( choosePosition == 2 )then
      correctAnswer.x = display.contentWidth/2
      wrongFirst.x = display.contentWidth/3*2.3
      wrongSecond.x = display.contentWidth/4

    
    elseif( choosePosition == 3 ) then
      correctAnswer.x = display.contentWidth/3*2.3
      wrongFirst.x = display.contentWidth/4
      wrongSecond.x = display.contentWidth/2

   end

  end
--This function choose randomly a number and depends what number was chosen we will display a question
local function displayQuestion()
  chooseQuest = math.random(1)
  
  if (chooseQuest == 1) then
    --display the first question first and answers
    firstQuestion()
  end
end

-- Function: correctTouch
-- Description: If the user touch the correct answer he/she gains one point
local function correctTouch(touch)
  if (touch.phase == "began") then
    --
  elseif (touch.phase == "ended") and (alreadyClickedAnswer == false) then
    correct.isVisible = true
  end

end
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------
 
-- create()
function scene:create( event )
 
    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen
  --create the background image
  bkg = display.newImageRect("Level1Images/Level1ScreenValeriaV.png", 0, 0, 0, 0)
  bkg.x = 510
  bkg.y = 385
  bkg.width = display.contentWidth
  bkg.height = display.contentHeight
  --Associating display objects with this scene
  sceneGroup:insert(bkg)
  
  --create the closed book
  bookClosed = display.newImage("Level1Images/book1.png")
  bookClosed.x = display.contentWidth/2
  bookClosed.y = display.contentHeight/2
  bookClosed.width = 700
  bookClosed.height = 750
  bookClosed.alpha = 1
  --Associating display objects with this scene
  sceneGroup:insert(bookClosed)

  --create the open book
  bookOpen = display.newImage("Level1Images/book4.png")
  bookOpen.x = display.contentWidth/2
  bookOpen.y = display.contentHeight/2
  bookOpen.width = 1000
  bookOpen.height = 700
  bookOpen.alpha = 0
  --Associating display objects with this scene
  sceneGroup:insert(bookOpen)

  ----------------------------------------------------------------------------
  --CREATE THE WALKING TV
  ----------------------------------------------------------------------------
  walkingTV = display.newImage("Level1Images/WalkingTvValeria&Aliya@2x.png")
  walkingTV.width = 600
  walkingTV.height = 450
  walkingTV.x = -200
  walkingTV.y = display.contentHeight/2+100

  -----------------------------------------------
  --
  correct = display.newText("Correct", display.contentWidth/2, display.contentHeight/2, nil, 70)
  correct.isVisible = false
  

end
 
 
-- show()
function scene:show( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)
 
    elseif ( phase == "did" ) then
        -- Code here runs when the scene is entirely on screen
       timer.performWithDelay(500, openBook)
       timer.performWithDelay(1000, moveTV)
       timer.performWithDelay(1500, displayQuestion)
       correctAnswer:addEventListener("touch", correctTouch)
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