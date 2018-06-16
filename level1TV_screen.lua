-----------------------------------------------------------------------------------------
-- level1_screen.lua
-- Created by: Valeria Veverita
-- ICS2O
-- Description: This is the background of level 1

local composer = require( "composer" )
local widget = require( "widget")

--give the name to the scene
sceneName = "level1TV_screen"

--creating scene object 
local scene = composer.newScene(sceneName)
  
--------------------------------------------------------------------------------
--LOCAL VARIABLES
------------------------------------------------------------------------------
--the scene objects (backgrounds, character)
local bkg
local bookClosed
local bookOpen
local Tv
local pannel
local instructions
local pauseButton

--the text that displays the question
local questionText 

-- the options of images for the game
local correctImage
local incorrectImage1
local incorrectImage2

--lives
local heart1
local heart2
local heart3

-- boolean variables telling me which answer box was touched
local correctImageAlreadyTouched = false
local incorrectImage1AlreadyTouched = false
local incorrectImage2AlreadyTouched = false

--Number of correct/incorrect answers
local correct = 0
local wrong = 3

--background sound
local bkgSound
local bkgChannel
local bkgStop

--WrongSound
local wrongSound
local wrongChannel

--correctSound
local correctSound
local correctChannel

local passedLevel

------------------------------------
--GLOBAL VARIABLE
------------------------------------
--levelStart1 = false

----------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
------------------------------------------------------------------------------------
--this function is responsible for animating the book
local function openBook()
  transition.to(bookClosed, {alpha = 0, time = 1000})
  transition.to(questionText, {alpha = 1, time = 700})
  transition.to(bookOpen, {alpha = 1, time = 700})
  transition.to(heart1, {alpha = 1, time = 700})
  transition.to(heart2, {alpha = 1, time = 700})
  transition.to(heart3, {alpha = 1, time = 700})
end

local function openBook2()
  transition.to(bookClosed, {alpha = 0, time = 1000})
  transition.to(questionText, {alpha = 1, time = 700})
  transition.to(bookOpen, {alpha = 1, time = 700})
  
end

--this function moves the Tv
local function moveTv()
  transition.to(Tv, { x = display.contentWidth/3*2, y = display.contentHeight/3*2})
  transition.to(pannel, {alpha = 1, time = 500})
  transition.to(instructions, {alpha = 1, time = 500})
end

local function moveTv2()
  transition.to(Tv, { alpah = 1, x = display.contentWidth/3*2.6, y = display.contentHeight/3*2.8, time = 500})
  transition.to(pannel, {alpha = 0, time = 800})
  transition.to(instructions, {alpha = 0, time = 800})
  transition.to(bookClosed, {alpha = 1, time = 1000})
  pauseButton.alpha = 1
end


-----------------------------------------
--QUESTION's FUNCTIONS
-----------------------------------------
local function DisplayQuestion( )

    -- make it possible to click on the answers again
    correctImageAlreadyTouched = false

    -- generate a random number between 1 and the length of table
    randomIndex = math.random(1,10)

    -- place each questions with it's correct image and with 2 other options
    if (randomIndex == 1) then
        questionText.text = "Je me _________  (être) bien amusée."
        correctImage = display.newImageRect("Question1/Correctsuis.png", 200, 200)
        incorrectImage1 = display.newImageRect("Question1/Wrongest.png", 200, 200)
        incorrectImage2 = display.newImageRect("Question1/Wrongsoit.png", 200, 200)

    elseif (randomIndex == 2) then
        questionText.text = "Tu _________ (Chanter) très fort."
        correctImage = display.newImageRect("Question2/Correctchantes.png", 200, 200)
        incorrectImage1 = display.newImageRect("Question2/Wrongchante.png", 200, 200)
        incorrectImage2 = display.newImageRect("Question2/Wrongchantent.png", 200, 200)

    elseif (randomIndex == 3) then
        questionText.text = "Vous _________ (apprendre)\n          à faire de la pizza."
        correctImage = display.newImageRect("Question3/Correctapprenez.png", 200, 200)
        incorrectImage1 = display.newImageRect("Question3/wrong appredrent.png", 200, 200)
        incorrectImage2 = display.newImageRect("Question3/wrongappreniez.png", 200, 200)

    elseif (randomIndex == 4) then
        questionText.text = "  Ils _________ ( avoir)\ndes nouveaux souliers."
        correctImage = display.newImageRect("Question4/correctont.png", 200, 200)
        incorrectImage1 = display.newImageRect("Question4/Wronga.png", 200, 200)
        incorrectImage2 = display.newImageRect("Question4/Wrongavons.png", 200, 200)

    elseif (randomIndex == 5) then
        questionText.text = "J’_________ ( avoir) beaucoup d’amis."
        correctImage = display.newImageRect("Question5/Correctai.png", 200, 200)
        incorrectImage1 = display.newImageRect("Question5/Wrongavaient.png", 200, 200)
        incorrectImage2 = display.newImageRect("Question5/Wrongsuis.png", 200, 200)

    elseif (randomIndex == 6) then
        questionText.text = "   Elle _________ (être) gentille."
        correctImage = display.newImageRect("Question6/Correctest.png", 200, 200)
        incorrectImage1 = display.newImageRect("Question6/Wrongfait.png", 200, 200)
        incorrectImage2 = display.newImageRect("Question6/Wrongsommes.png", 200, 200)

    elseif (randomIndex == 7) then
        questionText.text = " On _________ (vouloir) faire du ménage."
        correctImage = display.newImageRect("Question7/Correctveut.png", 200, 200)
        incorrectImage1 = display.newImageRect("Question7/Wrongquoi.png", 200, 200)
        incorrectImage2 = display.newImageRect("Question7/Wrongvont.png", 200, 200)

    elseif (randomIndex == 8) then
        questionText.text = " Vous _________ (aller) au parc?"
        correctImage = display.newImageRect("Question8/Correctallez.png", 200, 200)
        incorrectImage1 = display.newImageRect("Question8/Wrongaillent.png", 200, 200)
        incorrectImage2 = display.newImageRect("Question8/Wrongallons.png", 200, 200)

     elseif (randomIndex == 9) then
        questionText.text = "Elle _________ (aimer) danser la Salsa."
        correctImage = display.newImageRect("Question9/Correctaime.png", 200, 200)
        incorrectImage1 = display.newImageRect("Question9/Wrongaimons.png", 200, 200)
        incorrectImage2 = display.newImageRect("Question9/Wrongamez.png", 200, 200)

    elseif (randomIndex == 10) then
        questionText.text = "Nous _________ (manger) du pains"
        correctImage = display.newImageRect("Question10/Correctmangeons.png", 200, 200)
        incorrectImage1 = display.newImageRect("Question10/Wrongmange.png", 200, 200)
        incorrectImage2 = display.newImageRect("Question10/Wrongmangez.png", 200, 200)
    end
    -- set the y-values for all of the correct and incorrect images to be on the same line
    correctImage.y = display.contentHeight /2
    incorrectImage1.y = display.contentHeight /2
    incorrectImage2.y = display.contentHeight /2
end

local function RemoveImageAnswers()
    -- remove all of the image answers form the screen
    display.remove(correctImage)
    display.remove(incorrectImage1)
    display.remove(incorrectImage2)
end

local function WinScreenTransition()
    composer.gotoScene("Select_screen", {effect = "fade", time = 500})
end



local function PositionAnswers( )

    local randomAnswerPosition = math.random (1, 3)

    -- create 3 diffrent position options for the images displayed
    if (randomAnswerPosition == 1) then
        correctImage.x = display.contentWidth/4
        incorrectImage1.x = display.contentWidth/2
        incorrectImage2.x = display.contentWidth/3*2.3

    elseif (randomAnswerPosition == 2) then
        correctImage.x = display.contentWidth/2
        incorrectImage1.x = display.contentWidth/3*2.3
        incorrectImage2.x = display.contentWidth/4

    elseif (randomAnswerPosition == 3) then
        correctImage.x = display.contentWidth/3*2.3
        incorrectImage1.x =  display.contentWidth/4
        incorrectImage2.x = display.contentWidth/2
    end
end

local function TouchListenerCorrectImage(touch)
    --only work if none of the other boxes have been touched
    if (incorrectImage1AlreadyTouched == false) and 
        (incorrectImage2AlreadyTouched == false) then

        if (touch.phase == "began") then

            --let other boxes know it has been clicked
            correctImageAlreadyTouched = true

        -- this occurs when they release the mouse
        elseif (touch.phase == "ended") then
            --play the wrong sound
            correctChannel = audio.play(correctSound)

            -- set the boolean that the answer box has not been touched yet
            answerboxAlreadyTouched = false            

                -- give the user a point
                 correct = correct + 1
                 print("plus"..correct)
                
                --check the answers and based on how many points the user lost or gained
                checkAnswersTv()

                --hide the question and answers
                if (correct ~= 3) or (wrong ~= 0) then
                  RemoveEventListenersTv()
                  RemoveImageAnswers()
                  RestartLevelTV1()
                end
        end
    end                
end 

local function TouchListenerIncorrectImage1(touch)
    --only work if none of the other boxes have been touched
    if (correctImageAlreadyTouched == false) and 
        (incorrectImage2AlreadyTouched == false) then

        if (touch.phase == "began") then

            --let other boxes know it has been clicked
            incorrectImage1AlreadyTouched = true

        -- this occurs when they release the mouse
        elseif (touch.phase == "ended") then

           --play the wrong sound
            wrongChannel = audio.play(wrongSound)

            -- set the boolean that the answer box has not been touched yet
              incorrectImage1AlreadyTouched = false
                -- give the user a point
                wrong = wrong - 1
                print("minus"..wrong) 

                --check the answers and based on how many points the user lost or gained
                checkAnswersTv()  

                --hide the wrong answer
                transition.to(incorrectImage1, {alpha = 0, time = 500})
        end
    end                
end 

local function TouchListenerIncorrectImage2(touch)
    --only work if none of the other boxes have been touched
    if (correctImageAlreadyTouched == false) and 
        (incorrectImage1AlreadyTouched == false) then

        if (touch.phase == "began") then

            --let other boxes know it has been clicked
            incorrectImage2AlreadyTouched = true

        -- this occurs when they release the mouse
        elseif (touch.phase == "ended") then

            --play the wrong sound
            wrongChannel = audio.play(wrongSound)

            -- set the boolean that the answer box has not been touched yet
              incorrectImage2AlreadyTouched = false
                -- give the user a point
                wrong = wrong - 1
                print("minus"..wrong)

                --check the answers and based on how many points the user lost or gained
                checkAnswersTv()
                
                --hide the wrong answer
                transition.to(incorrectImage2, {alpha = 0, time = 500})
        end
    end                
end 

-- Function that Adds Listeners to each answer box
local function AddEventListeners()
    correctImage:addEventListener("touch", TouchListenerCorrectImage)
    incorrectImage1:addEventListener("touch", TouchListenerIncorrectImage1)
    incorrectImage2:addEventListener("touch", TouchListenerIncorrectImage2)
end 


local function hideQuestion()
  bookOpen.alpha = 0
  questionText.alpha = 0
  heart1.alpha = 0
  heart2.alpha = 0
  heart3.alpha = 0 
  print(correct)
  wrong = 3
  print(wrong)
end

local function hideQuestion2()
  bookOpen.alpha = 0
  questionText.alpha = 0
  correct = correct
  print(correct)
  print(wrong)
end

--this function transition to the pause screen
local function pauseTransition()
  composer.showOverlay("pause2_screen", {isModal = true, effect = "fade", time = 500})
  RemoveImageAnswers()
  hideQuestion2()
  pauseButton.alpha = 0 
  Tv.alpha = 0
end

-- -----------------------------------------------------------------------------------
-- GLOBAL FUNCTIONS
-- -----------------------------------------------------------------------------------
-- Function that Removes Listeners to each answer box
function RemoveEventListenersTv()
    --correctImage:removeEventListener("touch", TouchListenerCorrectImage)
    --incorrectImage1:removeEventListener("touch", TouchListenerIncorrectImage1)
    --incorrectImage1:removeEventListener("touch", TouchListenerIncorrectImage2)
end 

function removePause2()
   openBook2()
   moveTv2()
   RestartLevelTV1()
   Tv.alpha = 1
end

-- Function to Restart Level 1
function RestartLevelTV1()
    bookOpen.isVisible = true
    DisplayQuestion()
    PositionAnswers()
    AddEventListeners()
end

function checkAnswersTv()
  if (wrong == 2 ) then
    heart1.alpha = 0


  elseif (wrong == 1) then
     heart2.alpha = 0


  elseif(wrong == 0) then
     heart3.alpha = 0
    composer.gotoScene("Lose_screen", {effect = "fade", time = 500})
    correctImage.isVisible = false
    incorrectImage1.isVisible = false
    incorrectImage2.isVisible = false
  end

  if(correct == 3) then    
    correctImage.isVisible = false
    incorrectImage1.isVisible = false
    incorrectImage2.isVisible = false
    timer.performWithDelay(0, WinScreenTransition)
    selectCounter = 0 + 1
    print ("counter"..selectCounter)
    
  end
  
end

function playSoundTv()
   bkgChannel = audio.play(bkgSound, {loop = -1, channel = 15})
end

-- -----------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-- -----------------------------------------------------------------------------------
 
-- create()
function scene:create( event )
 
    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen

  -----------------------
  --Sounds
  -------------------------
  --background
  bkgSound = audio.loadStream("Sounds/level1.mp3")
  --wrong
  wrongSound = audio.loadStream("Sounds/wrong.mp3")
  --correct
  correctSound = audio.loadStream("Sounds/correct.mp3")

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
  bookClosed.width = 600
  bookClosed.height = 700
  bookClosed.alpha = 0
  --Associating display objects with this scene
  sceneGroup:insert(bookClosed)

  --create the open book
  bookOpen = display.newImage("Level1Images/book4.png")
  bookOpen.x = display.contentWidth/2
  bookOpen.y = display.contentHeight/2
  bookOpen.width = 1050
  bookOpen.height = 700
  bookOpen.alpha = 0
  --Associating display objects with this scene
  sceneGroup:insert(bookOpen)
 
 --create the instructions pannel
 pannel = display.newImage("Level1Images/intrsuctionsValeriaV.png")
 pannel.x = display.contentWidth/3.7
 pannel.y = 450
 pannel.width = 500
 pannel.height = 900
 pannel.alpha = 0
 --Associating display objects with this scene
  sceneGroup:insert(pannel)

  --create the instruction text
  instructions = display.newText("   In this level you\nneed to choose the\n    verbs that are\n  conjugated right.\n       If you get 3\n    questions right,\nyou'll move to the\nnext level. If\nyou forfeit all\n     three lives,\n   you'll lose the\n           game.", display.contentWidth/2-230, 420, "Georgia", 50)
  instructions:setTextColor( 104/255, 76/255, 24/255 )
  alpha = 0
  --Associating display objects with this scene
  sceneGroup:insert(instructions)

 --create the Tv
  Tv = display.newImage("Level1Images/WalkingTvValeria&Aliya@2x.png")
  Tv.width = 600
  Tv.height = 500
  Tv.x = -300
  Tv.y = display.contentHeight/2
  --Associating display objects with this scene
  sceneGroup:insert(Tv)

  --the text that displays the questions
  questionText = display.newText( "" , 1, 1, native.systemFontBold, 50)
  questionText:setTextColor (166/255, 61/255, 40/255 )
  questionText.x = 500
  questionText.y = 200
  --Associating display objects with this scene
  sceneGroup:insert( questionText )
  
  ----------------------------------------
  --LIVES
  -----------------------------------------
  --first heart
  heart1 = display.newImage("Level1Images/HeartValeriaV.png")
  heart1.x  = display.contentWidth/2.8
  heart1.y = 70
  heart1.width = 120
  heart1.height = 120
  heart1.alpha = 0
  --Associating display objects with this scene
  sceneGroup:insert(heart1)

  --second heart
  heart2 = display.newImage("Level1Images/HeartValeriaV.png")
  heart2.x  = display.contentWidth/1.9
  heart2.y = 70
  heart2.width = 120
  heart2.height = 120
  heart2.alpha = 0
  --Associating display objects with this scene
  sceneGroup:insert(heart2)

  --first heart
  heart3 = display.newImage("Level1Images/HeartValeriaV.png")
  heart3.x  = display.contentWidth/1.44
  heart3.y = 70
  heart3.width = 120
  heart3.height = 120
  heart3.alpha = 0
  --Associating display objects with this scene
  sceneGroup:insert(heart3)

   --Creating Play Button
    pauseButton = widget.newButton(
      {
          --set its possition on the screen 
          x = 900,
          y = 80,

          --Insert the images here
          defaultFile = "ButtonImages/PauseButton.png",

          --set the size of the image
            width = 80,
            height = 80,

            -- When the button is released, call the LevelSelect screen transition function
            onRelease = pauseTransition

       })
    pauseButton.alpha = 0
    sceneGroup:insert(pauseButton)


  passedLevel = 0
  moveTv()
  timer.performWithDelay(5600, openBook)
  timer.performWithDelay(4500, moveTv2)
  timer.performWithDelay(5600, RestartLevelTV1)
end
 
 
-- show()
function scene:show( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)
        --bookOpen.isVisible = false

    elseif ( phase == "did" ) then
        -- Code here runs when the scene is entirely on screen
      --moveTv()
      --timer.performWithDelay(5600, openBook)
      --timer.performWithDelay(4500, moveTv2)
      --timer.performWithDelay(8000, ShowHearts)
      if (passedLevel == 1) then
        openBook()
        moveTv2()
        RestartLevelTV1()
      end
      
      playSoundTv()
    end
end
 
 
-- hide()
function scene:hide( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is on screen (but is about to go off screen
        RemoveEventListenersTv()
        RemoveImageAnswers()
        hideQuestion()

    elseif ( phase == "did" ) then
        -- Code here runs immediately after the scene goes entirely off screen
        bkgStop = audio.stop(15)
        audio.play(1)
        passedLevel = 1
        correct = 0
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