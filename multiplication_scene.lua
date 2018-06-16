-----------------------------------------------------------------------------------------
-- level2.lua
-- Created by: Valeria & Aliya
-- Date: May 10th, 2018
-- Description: 

-- Naming scene



local composer = require( "composer" )

local widget = require ("widget")

local sceneName = "multiplication_scene.lua" 
local scene = composer.newScene( sceneName )

---------------------------------------------------------------------------------------
--LOCAL VARIABLES
---------------------------------------------------------------------------------------
local bkg
local backButton

--position variables
local X1 = 380
local X2 = 620
local Y1 = 370
local Y2 = 550
------------------
--MATH VARIABLES
------------------
local questionText

local firstNum
local secondNum

local answer
local wrong1
local wrong2
local wrong3

local answerText
local wrongText1
local wrongText2
local wrongText3

local userAnswer

local position

-- set the boolean varibales to know if they have already touched an answer
local answerAlreadyTouched = false
local wrong1AlreadyTouched = false
local wrong2AlreadyTouched = false
local wwrong3AlreadyTouched = false
---------------------------------------------------------------------------------------
--GLOBAL VARIABLES
---------------------------------------------------------------------------------------
correctAnswer = 0
-----------------------------------------
--SOUND
-----------------------------------------
--- Background sound 


--correctSound


--magic sound


--------------------------------------------
--LOCAL FUNCTIONS
-------------------------------------------
--this function creates correct and incorrect answers. Also it displays the question and answers
local function createQuestion()
  -- choosing two random numbers
  firstNum = math.random(1,10)
  secondNum = math.random(1,10)
  
  --find the answer
  answer = firstNum * secondNum
 
 
  --create the wrong answers
  wrong1 = answer + math.random(1,5)
  wrong2 = answer - math.random(1,5)
  wrong3 = answer + math.random(6, 9)

  --create the question (text)
  questionText.text = secondNum .. " * " .. firstNum .. " = "

  --creating the answer text 
  answerText.text = answer

  --creating the wrong text
  wrongText1.text = wrong1
  wrongText2.text = wrong2
  wrongText3.text = wrong3
end

--this function chooses randomly the position of the questions
local function choosePosition()
  position = math.random(1, 4)

  if (position == 1) then
    --set the position of the correct answer
    answerText.x = X1
    answerText.y = Y1
    --set the position of the fisrt wrong answer
    wrongText1.x = X2
    wrongText1.y = Y1
    --set the position of the second wrong answer
    wrongText2.x = X1
    wrongText2.y = Y2
    --set the position of the third wrong answer
    wrongText3.x  = X2
    wrongText3.y = Y2

  elseif (position == 2) then
    --set the position of the correct answer
    answerText.x = X2
    answerText.y = Y1
    --set the position of the fisrt wrong answer
    wrongText1.x = X1
    wrongText1.y = Y2
    --set the position of the second wrong answer
    wrongText2.x = X2
    wrongText2.y = Y2
    --set the position of the third wrong answer
    wrongText3.x  = X1
    wrongText3.y = Y1

  elseif (position == 3) then
    --set the position of the correct answer
    answerText.x = X1
    answerText.y = Y2
    --set the position of the fisrt wrong answer
    wrongText1.x = X2
    wrongText1.y = Y2
    --set the position of the second wrong answer
    wrongText2.x = X1
    wrongText2.y = Y1
    --set the position of the third wrong answer
    wrongText3.x = X2
    wrongText3.y = Y1

  elseif (position == 4) then
    --set the position of the correct answer
    answerText.x = X2
    answerText.y = Y2
    --set the position of the fisrt wrong answer
    wrongText1.x = X1
    wrongText1.y = Y1
    --set the position of the second wrong answer
    wrongText2.x = X2
    wrongText2.y = Y1
    --set the position of the third wrong answer
    wrongText3.x = X1
    wrongText3.y = Y2
  end
end

--this function chechs if 4 question were answered right then move to the win screen
local function checkAnswers()
  if (mathCounter == 3 ) then
    composer.gotoScene( "Win_screen", {effect = "fade", time = 0}) 
    if (levelCounter == 2) then
       StopTimer2()
       audio.stop(20)
    elseif (levelCounter == 1) then
       StopTimer()
       audio.stop(21)
    end
  end
end
--when correct answer is pressed this function is executed
local function TouchListenerAnswer(touch)
  if(touch.phase == "ended") then
    composer.hideOverlay("fade", 400)
    mathCounter = mathCounter + 1
    checkAnswers()
  end 
end

--when wrong answer1 is pressed this function is executed
local function TouchListenerWrong1(touch)
  if(touch.phase == "ended") then
    wrongText1.isVisible = false
    checkAnswers()
  end 
end

--when wrong answer2 is pressed this function is executed
local function TouchListenerWrong2(touch)
  if(touch.phase == "ended") then
    wrongText2.isVisible = false
    checkAnswers()
  end 
end

--when wrong answer3 is pressed this function is executed
local function TouchListenerWrong3(touch)
    if(touch.phase == "ended") then
      wrongText3.isVisible = false
      checkAnswers()
    end 
end

--this functions adds event listener to the object
local function addEventListener()
  answerText:addEventListener("touch",TouchListenerAnswer)
  wrongText1:addEventListener("touch", TouchListenerWrong1)
  wrongText2:addEventListener("touch", TouchListenerWrong2)
  wrongText3:addEventListener("touch", TouchListenerWrong3)
end

--this functions removes event listener to the object
local function removeEventListener()
  answerText:removeEventListener("touch",TouchListenerAnswer)
  wrongText1:removeEventListener("touch", TouchListenerWrong1)
  wrongText2:removeEventListener("touch", TouchListenerWrong2)
  wrongText3:removeEventListener("touch", TouchListenerWrong3)
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
      bkg = display.newImageRect("Level3/scrollValeriaV.png", 0, 0, 0, 0)
      bkg.width = 750
      bkg.height = 730
      bkg.x = 510
      bkg.y = 380
      sceneGroup:insert(bkg)

      --create the question
      questionText = display.newText("", 0, 0, native.systemFontBold, 100)
      questionText.x = 525
      questionText.y = 200
      questionText:setTextColor( 14/255, 102/255, 85/255 )
      sceneGroup:insert(questionText)

      -- Create The Answer Text Object & Wrong Answer Text Objects
      --answer
      answerText = display.newText("", 0, 0, native.systemFontBold, 130)
      answerText:setTextColor( 202/255, 111/255, 30/255 )
      sceneGroup:insert(answerText)
      
      --wrong answer 1
      wrongText1 = display.newText("", 0, 0, native.systemFontBold, 130)
      wrongText1:setTextColor( 8/255, 145/255, 190/255 )
      sceneGroup:insert(wrongText1)
      
      --wrong answer 2
      wrongText2 = display.newText("", 0, 0, native.systemFontBold, 130)
      wrongText2:setTextColor( 41/255, 26/255, 81/255 )
      sceneGroup:insert(wrongText2)
      
      --wrong answer 3
      wrongText3 = display.newText("", 0, 0, native.systemFontBold, 130)
      wrongText3:setTextColor( 190/255, 19/255, 8/255 )
      sceneGroup:insert(wrongText3)
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
        createQuestion()
        choosePosition()
        addEventListener()
    end
end
 
 
-- hide()
function scene:hide( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is on screen (but is about to go off screen)
        if (levelCounter == 2) then
          key3.isVisible = false
        elseif(levelCounter == 1)then
          key5.isVisible = false
        end

        print(mathCounter)
        --wrongText1.isVisible = true
        --wrongText2.isVisible = true
        --wrongText3.isVisible = true
 
    elseif ( phase == "did" ) then
        -- Code here runs immediately after the scene goes entirely off screen
        removeEventListener()
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
