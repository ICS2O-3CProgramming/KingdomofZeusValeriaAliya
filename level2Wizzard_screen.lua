-----------------------------------------------------------------------------------------
-- level2.lua
-- Created by: Valeria & Aliya
-- Date: May 10th, 2018
-- Description: 

-- Naming scene



local composer = require( "composer" )
local widget = require("widget")
local sceneName = "level2.lua" 
local scene = composer.newScene( sceneName )

---------------------------------------------------------------------------------------
--LOCAL VARIABLES
---------------------------------------------------------------------------------------
local bkg
local wizard
local scroll
local instructions
local puzzleCounter = 0
local explossion
local pauseButton
--this variable will set randomly the possition of the puzzles
local changePosit

-- set the boolean varibales to know if they have already touched an image 
local piece1AlreadyTouched = false 
local piece2AlreadyTouched = false 
local piece3AlreadyTouched = false 
local piece4AlreadyTouched = false
local piece5AlreadyTouched = false 
local piece6AlreadyTouched = false 
local piece7AlreadyTouched = false 
local piece8AlreadyTouched = false
local piece9AlreadyTouched = false

-----------------------------------------
--SOUND
-----------------------------------------
--- Background sound 
local bkgSound
local bkgChannel
local bkgStop

--correctSound
local correctSound
local correctChannel

--magic sound
local magicSound
local magicChannel

local levelCounter = 0
--------------------------------------
--PUZZLE FADED
--------------------------------------
local pieceF1
local pieceF2
local pieceF3
local pieceF4
local pieceF5
local pieceF6
local pieceF7
local pieceF8
local pieceF9

---------------------------------------
--PUZZLE PIECES
---------------------------------------
 local piece1
 local piece2
 local piece3
 local piece4
 local piece5
 local piece6
 local piece7
 local piece8
 local piece9

-----------------------------------------
--PUZZLE PIECES (POSITION)
-----------------------------------------
---------
--X-VALUE
---------
local piece1PreviousX
local piece2PreviousX
local piece3PreviousX
local piece4PreviousX
local piece5PreviousX
local piece6PreviousX
local piece7PreviousX
local piece8PreviousX
local piece9PreviousX
---------
--Y-VALUE
---------
local piece1PreviousY
local piece2PreviousY
local piece3PreviousY
local piece4PreviousY
local piece5PreviousY
local piece6PreviousY
local piece7PreviousY
local piece8PreviousY
local piece9PreviousY

--------------------------------------------
--LOCAL FUNCTIONS
-------------------------------------------
--this functions displays the instructions
local function displayInstructions()
	transition.to(instructions, {alpha = 1})
end


--this function transition to the pause screen
local function pauseTransition()
  composer.showOverlay("pause4_screen", {isModal = true, effect = "fade", time = 500})
end

--this function creates the animation (moves the wizard, scroll and displays the instructions after a period of time)
local function movewizard()
    transition.to(wizard, {x = 280, y = 400, alpha = 1, time = 1000})
    transition.to(scroll, {x = 715, y = 400, width = 600, height = 700, alpha = 1, time = 1000})
    timer.performWithDelay(1000, displayInstructions)
end

--this function hides the instructions and displays the explossion image
local function displayExplossion()
    magicChannel = audio.play(magicSound, {channel = 5, loop = -1})
    transition.to(explossion, {alpha = 1, width = 1000, height = 800, time = 500})
    transition.to(wizard, {alpha = 0})
    transition.to(scroll, {alpha = 0})
    transition.to(instructions, {alpha = 0})
    pauseButton.alpha = 1
end

--this function hides the explossion and displays the puzzle
local function displayPuzzle()
    --hide the explossion
    transition.to(explossion, {alpha = 0})

    --display the original image
    pieceF1.alpha = 0.8
    pieceF2.alpha = 0.8
    pieceF3.alpha = 0.8
    pieceF4.alpha = 0.8
    pieceF5.alpha = 0.8
    pieceF6.alpha = 0.8
    pieceF7.alpha = 0.8
    pieceF8.alpha = 0.8
    pieceF9.alpha = 0.8

    --display the pieces separate
    piece1.alpha = 1
    piece2.alpha = 1
    piece3.alpha = 1
    piece4.alpha = 1
    piece5.alpha = 1
    piece6.alpha = 1
    piece7.alpha = 1
    piece8.alpha = 1
    piece9.alpha = 1
end

local function changePossition()
    --choose a number between 1 and 9
   changePosit = math.random(1,9)

   --based on the chosen number set the position of the pieces
   if (changePosit == 1) then
     --set the position of the first piece
     piece1.x = 120
     piece1.y = 90
     --set the position of the second piece
     piece2.x = 910
     piece2.y = 450
     --set the position of the third piece
     piece3.x = 120
     piece3.y = 680
     --set the position of the fourth piece
     piece4.x = 910
     piece4.y = 680
     --set the position of the fifth piece
     piece5.x = 120
     piece5.y = 295
     --set the position of the sixth piece
     piece6.x = 650
     piece6.y = 680
     --set the position of the seventh piece
     piece7.x = 910
     piece7.y = 250
     --set the position of the eigthth piece
     piece8.x = 400
     piece8.y = 680
      --set the position of the nineth piece
     piece9.x = 120
     piece9.y = 485

    elseif(changePosit == 2) then
     --set the position of the first piece
     piece2.x = 120
     piece2.y = 90
     --set the position of the second piece
     piece3.x = 910
     piece3.y = 455
     --set the position of the third piece
     piece4.x = 120
     piece4.y = 680
     --set the position of the fourth piece
     piece5.x = 910
     piece5.y = 680
     --set the position of the fifth piece
     piece6.x = 120
     piece6.y = 295
     --set the position of the sixth piece
     piece7.x = 650
     piece7.y = 680
     --set the position of the seventh piece
     piece8.x = 910
     piece8.y = 250
     --set the position of the eigthth piece
     piece9.x = 400
     piece9.y = 680
      --set the position of the nineth piece
     piece1.x = 120
     piece1.y = 485

    elseif(changePosit == 3) then
     --set the position of the first piece
     piece3.x = 120
     piece3.y = 90
     --set the position of the second piece
     piece4.x = 910
     piece4.y = 455
     --set the position of the third piece
     piece5.x = 120
     piece5.y = 680
     --set the position of the fourth piece
     piece6.x = 910
     piece6.y = 680
     --set the position of the fifth piece
     piece7.x = 120
     piece7.y = 295
     --set the position of the sixth piece
     piece8.x = 910
     piece8.y = 680
     --set the position of the seventh piece
     piece9.x = 910
     piece9.y = 250
     --set the position of the eigthth piece
     piece1.x = 400
     piece1.y = 680
      --set the position of the nineth piece
     piece2.x = 120
     piece2.y = 485

    elseif(changePosit == 4) then
     --set the position of the first piece
     piece4.x = 120
     piece4.y = 90
     --set the position of the second piece
     piece5.x = 910
     piece5.y = 455
     --set the position of the third piece
     piece6.x = 120
     piece6.y = 680
     --set the position of the fourth piece
     piece7.x = 910
     piece7.y = 680
     --set the position of the fifth piece
     piece8.x = 120
     piece8.y = 295
     --set the position of the sixth piece
     piece9.x = 650
     piece9.y = 680
     --set the position of the seventh piece
     piece1.x = 910
     piece1.y = 250
     --set the position of the eigthth piece
     piece2.x = 400
     piece2.y = 680
      --set the position of the nineth piece
     piece3.x = 120
     piece3.y = 485

    elseif(changePosit == 5) then
     --set the position of the first piece
     piece5.x = 120
     piece5.y = 90
     --set the position of the second piece
     piece6.x = 910
     piece6.y = 455
     --set the position of the third piece
     piece7.x = 120
     piece7.y = 680
     --set the position of the fourth piece
     piece8.x = 910
     piece8.y = 680
     --set the position of the fifth piece
     piece9.x = 120
     piece9.y = 295
     --set the position of the sixth piece
     piece1.x = 650
     piece1.y = 680
     --set the position of the seventh piece
     piece2.x = 910
     piece2.y = 250
     --set the position of the eigthth piece
     piece3.x = 400
     piece3.y = 680
      --set the position of the nineth piece
     piece4.x = 120
     piece4.y = 485

    elseif(changePosit == 6) then
     --set the position of the first piece
     piece6.x = 120
     piece6.y = 90
     --set the position of the second piece
     piece7.x = 910
     piece7.y = 455
     --set the position of the third piece
     piece8.x = 120
     piece8.y = 680
     --set the position of the fourth piece
     piece9.x = 910
     piece9.y = 680
     --set the position of the fifth piece
     piece1.x = 120
     piece1.y = 295
     --set the position of the sixth piece
     piece2.x = 650
     piece2.y = 680
     --set the position of the seventh piece
     piece3.x = 910
     piece3.y = 250
     --set the position of the eightth piece
     piece4.x = 400
     piece4.y = 680
      --set the position of the nineth piece
     piece5.x = 120
     piece5.y = 485

    elseif(changePosit == 7) then
     --set the position of the first piece
     piece7.x = 120
     piece7.y = 90
     --set the position of the second piece
     piece8.x = 910
     piece8.y = 455
     --set the position of the third piece
     piece9.x = 120
     piece9.y = 680
     --set the position of the fourth piece
     piece1.x = 910
     piece1.y = 680
     --set the position of the fifth piece
     piece2.x = 120
     piece2.y = 295
     --set the position of the sixth piece
     piece3.x = 650
     piece3.y = 680
     --set the position of the seventh piece
     piece4.x = 910
     piece4.y = 250
     --set the position of the eigthth piece
     piece5.x = 400
     piece5.y = 680
      --set the position of the nineth piece
     piece6.x = 120
     piece6.y = 485

    elseif(changePosit == 8) then
     --set the position of the first piece
     piece8.x = 120
     piece8.y = 90
     --set the position of the second piece
     piece9.x = 910
     piece9.y = 455
     --set the position of the third piece
     piece1.x = 120
     piece1.y = 680
     --set the position of the fourth piece
     piece2.x = 910
     piece2.y = 680
     --set the position of the fifth piece
     piece3.x = 120
     piece3.y = 295
     --set the position of the sixth piece
     piece4.x = 650
     piece4.y = 680
     --set the position of the seventh piece
     piece5.x = 910
     piece5.y = 250
     --set the position of the eigthth piece
     piece6.x = 400
     piece6.y = 680
      --set the position of the nineth piece
     piece7.x = 120
     piece7.y = 485

    elseif(changePosit == 9) then
     --set the position of the first piece
     piece9.x = 120
     piece9.y = 90
     --set the position of the second piece
     piece1.x = 910
     piece1.y = 455
     --set the position of the third piece
     piece2.x = 120
     piece2.y = 680
     --set the position of the fourth piece
     piece3.x = 910
     piece3.y = 680
     --set the position of the fifth piece
     piece4.x = 120
     piece4.y = 295
     --set the position of the sixth piece
     piece5.x = 650
     piece5.y = 680
     --set the position of the seventh piece
     piece6.x = 910
     piece6.y = 250
     --set the position of the eigthth piece
     piece7.x = 400
     piece7.y = 680
      --set the position of the nineth piece
     piece8.x = 120
     piece8.y = 485
    end

    --save the x position
    piece1PreviousX = piece1.x
    piece2PreviousX = piece2.x
    piece3PreviousX = piece3.x
    piece4PreviousX = piece4.x
    piece5PreviousX = piece5.x
    piece6PreviousX = piece6.x
    piece7PreviousX = piece7.x
    piece8PreviousX = piece8.x
    piece9PreviousX = piece9.x

    --save the y position
    piece1PreviousY = piece1.y
    piece2PreviousY = piece2.y
    piece3PreviousY = piece3.y
    piece4PreviousY = piece4.y
    piece5PreviousY = piece5.y
    piece6PreviousY = piece6.y
    piece7PreviousY = piece7.y
    piece8PreviousY = piece8.y
    piece9PreviousY = piece9.y
end

--this function checks if the puzzleCounter equal to 9 (all pieces are on place) then move to the next level
local function checkPosition()
    print("puzzzleCounter"..puzzleCounter)

    if (puzzleCounter == 9) then
        selectCounter = 0 + 2
        composer.gotoScene("Select_screen", {effect = fade, time = 1000})
    end

end

--------------------------------------------------------
--MOVE PUZZLES (these functions allow us to move puzzle pieces and check if they are on the right possition)
-------------------------------------------------------
--move first puzzle piece
local function movePiece1(touch)
    --only work if none of the other pieces have been touched
        if (piece2AlreadyTouched == false and piece3AlreadyTouched == false and piece4AlreadyTouched == false and piece5AlreadyTouched == false and piece6AlreadyTouched == false and piece7AlreadyTouched == false and piece8AlreadyTouched == false and piece9AlreadyTouched == false) then 

            if touch.phase == "began" then
                --let other pieces know it has been clicked
                piece1AlreadyTouched = true
                
                --change the size of the piece
                piece1.width = 180
                piece1.height = 180

            elseif touch.phase == "moved" then
                --dragging function
                piece1.x = touch.x
                piece1.y = touch.y
            elseif touch.phase == "ended" then
                piece1AlreadyTouched = false

                -- if the piece is in the right spot go to center  and remove the event listener
                if (((pieceF1.x - pieceF1.width/2) < piece1.x ) and
                    ((pieceF1.x + pieceF1.width/2) > piece1.x ) and 
                    ((pieceF1.y - pieceF1.height/2) < piece1.y ) and 
                    ((pieceF1.y + pieceF1.height/2) > piece1.y ) ) then

                    piece1.x = pieceF1.x
                    piece1.y = pieceF1.y
                    
                    piece1:removeEventListener("touch", movePiece1)
                   
                   --increase the puzzleCounter by 1 and check if it's necessary to move to the next scene
                    puzzleCounter = puzzleCounter + 1
                    timer.performWithDelay(1000, checkPosition)
                    
                --else make piece go back to where it was
                else
                    piece1.x = piece1PreviousX
                    piece1.y = piece1PreviousY

                    --change the size of the piece
                    piece1.width = 120
                    piece1.height = 120

                end
            end
        end                
end -- end of movePiece1(touch)

--move second puzzle piece
local function movePiece2(touch)
    --only work if none of the other pieces have been touched
        if (piece1AlreadyTouched == false and piece3AlreadyTouched == false and piece4AlreadyTouched == false and piece5AlreadyTouched == false and piece6AlreadyTouched == false and piece7AlreadyTouched == false and piece8AlreadyTouched == false and piece9AlreadyTouched == false) then 

            if touch.phase == "began" then
                --let other pieces know it has been clicked
                piece2AlreadyTouched = true
                
                --change the size of the piece
                piece2.width = 180
                piece2.height = 180
            elseif touch.phase == "moved" then
                --dragging function
                piece2.x = touch.x
                piece2.y = touch.y
            elseif touch.phase == "ended" then
                piece2AlreadyTouched = false

                -- if the piece is in the right spot go to center  and remove the event listener
                if (((pieceF2.x - pieceF2.width/2) < piece2.x ) and
                    ((pieceF2.x + pieceF2.width/2) > piece2.x ) and 
                    ((pieceF2.y - pieceF2.height/2) < piece2.y ) and 
                    ((pieceF2.y + pieceF2.height/2) > piece2.y ) ) then

                    piece2.x = pieceF2.x
                    piece2.y = pieceF2.y

                    piece2:removeEventListener("touch", movePiece2)
                    
                    --increase the puzzleCounter by 1 and check if it's necessary to move to the next scene
                    puzzleCounter = puzzleCounter + 1
                    timer.performWithDelay(1000, checkPosition)
                --else make piece go back to where it was
                else
                    piece2.x = piece2PreviousX
                    piece2.y = piece2PreviousY

                    --change the size of the piece
                    piece2.width = 120
                    piece2.height = 120

                end
            end
        end                
end -- end of movePiece2(touch)

--move third puzzle piece
local function movePiece3(touch)
    --only work if none of the other pieces have been touched
        if (piece1AlreadyTouched == false and piece2AlreadyTouched == false and piece4AlreadyTouched == false and piece5AlreadyTouched == false and piece6AlreadyTouched == false and piece7AlreadyTouched == false and piece8AlreadyTouched == false and piece9AlreadyTouched == false) then 

            if touch.phase == "began" then
                --let other pieces know it has been clicked
                piece3AlreadyTouched = true
                
                --change the size of the piece
                piece3.width = 180
                piece3.height = 180
            elseif touch.phase == "moved" then
                --dragging function
                piece3.x = touch.x
                piece3.y = touch.y
            elseif touch.phase == "ended" then
                piece3AlreadyTouched = false

                -- if the piece is in the right spot go to center  and remove the event listener
                if (((pieceF3.x - pieceF3.width/2) < piece3.x ) and
                    ((pieceF3.x + pieceF3.width/2) > piece3.x ) and 
                    ((pieceF3.y - pieceF3.height/2) < piece3.y ) and 
                    ((pieceF3.y + pieceF3.height/2) > piece3.y ) ) then

                    piece3.x = pieceF3.x
                    piece3.y = pieceF3.y

                    piece3:removeEventListener("touch", movePiece3)
                    
                    --increase the puzzleCounter by 1 and check if it's necessary to move to the next scene
                    puzzleCounter = puzzleCounter + 1
                    timer.performWithDelay(1000, checkPosition)
                --else make piece go back to where it was
                else
                    piece3.x = piece3PreviousX
                    piece3.y = piece3PreviousY

                    --change the size of the piece
                    piece3.width = 120
                    piece3.height = 120

                end
            end
        end                
end -- end of movePiece3(touch)

--move fourth puzzle piece
local function movePiece4(touch)
    --only work if none of the other pieces have been touched
        if (piece1AlreadyTouched == false and piece2AlreadyTouched == false and piece3AlreadyTouched == false and piece5AlreadyTouched == false and piece6AlreadyTouched == false and piece7AlreadyTouched == false and piece8AlreadyTouched == false and piece9AlreadyTouched == false) then 

            if touch.phase == "began" then
                --let other pieces know it has been clicked
                piece4AlreadyTouched = true

                --change the size of the piece
                piece4.width = 180
                piece4.height = 180

            elseif touch.phase == "moved" then
                --dragging function
                piece4.x = touch.x
                piece4.y = touch.y
            elseif touch.phase == "ended" then
                piece4AlreadyTouched = false

                -- if the piece is in the right spot go to center  and remove the event listener
                if (((pieceF4.x - pieceF4.width/2) < piece4.x ) and
                    ((pieceF4.x + pieceF4.width/2) > piece4.x ) and 
                    ((pieceF4.y - pieceF4.height/2) < piece4.y ) and 
                    ((pieceF4.y + pieceF4.height/2) > piece4.y ) ) then

                    piece4.x = pieceF4.x
                    piece4.y = pieceF4.y

                    piece4:removeEventListener("touch", movePiece4)
                    
                    --increase the puzzleCounter by 1 and check if it's necessary to move to the next scene
                    puzzleCounter = puzzleCounter + 1
                    timer.performWithDelay(1000, checkPosition)
                --else make piece go back to where it was
                else
                    piece4.x = piece4PreviousX
                    piece4.y = piece4PreviousY

                    --change the size of the piece
                    piece4.width = 120
                    piece4.height = 120

                end
            end
        end                
end -- end of movePiece4(touch)

--move fifth puzzle piece
local function movePiece5(touch)
    --only work if none of the other pieces have been touched
        if (piece1AlreadyTouched == false and piece2AlreadyTouched == false and piece3AlreadyTouched == false and piece4AlreadyTouched == false and piece6AlreadyTouched == false and piece7AlreadyTouched == false and piece8AlreadyTouched == false and piece9AlreadyTouched == false) then 

            if touch.phase == "began" then
                --let other pieces know it has been clicked
                piece5AlreadyTouched = true

                --change the size of the piece
                piece5.width = 180
                piece5.height = 180

            elseif touch.phase == "moved" then
                --dragging function
                piece5.x = touch.x
                piece5.y = touch.y
            elseif touch.phase == "ended" then
                piece5AlreadyTouched = false

                -- if the piece is in the right spot go to center  and remove the event listener
                if (((pieceF5.x - pieceF5.width/2) < piece5.x ) and
                    ((pieceF5.x + pieceF5.width/2) > piece5.x ) and 
                    ((pieceF5.y - pieceF5.height/2) < piece5.y ) and 
                    ((pieceF5.y + pieceF5.height/2) > piece5.y ) ) then

                    piece5.x = pieceF5.x
                    piece5.y = pieceF5.y

                    piece5:removeEventListener("touch", movePiece5)
                    
                    --increase the puzzleCounter by 1 and check if it's necessary to move to the next scene
                    puzzleCounter = puzzleCounter + 1
                    timer.performWithDelay(1000, checkPosition)
                --else make piece go back to where it was
                else
                    piece5.x = piece5PreviousX
                    piece5.y = piece5PreviousY

                    --change the size of the piece
                    piece5.width = 120
                    piece5.height = 120

                end
            end
        end                
end -- end of movePiece5(touch)

--move sixth puzzle piece
local function movePiece6(touch)
    --only work if none of the other pieces have been touched
        if (piece1AlreadyTouched == false and piece2AlreadyTouched == false and piece3AlreadyTouched == false and piece4AlreadyTouched == false and piece5AlreadyTouched == false and piece7AlreadyTouched == false and piece8AlreadyTouched == false and piece9AlreadyTouched == false) then 

            if touch.phase == "began" then
                --let other pieces know it has been clicked
                piece6AlreadyTouched = true

                --change the size of the piece
                piece6.width = 180
                piece6.height = 180

            elseif touch.phase == "moved" then
                --dragging function
                piece6.x = touch.x
                piece6.y = touch.y
            elseif touch.phase == "ended" then
                piece6AlreadyTouched = false

                -- if the piece is in the right spot go to center  and remove the event listener
                if (((pieceF6.x - pieceF6.width/2) < piece6.x ) and
                    ((pieceF6.x + pieceF6.width/2) > piece6.x ) and 
                    ((pieceF6.y - pieceF6.height/2) < piece6.y ) and 
                    ((pieceF6.y + pieceF6.height/2) > piece6.y ) ) then

                    piece6.x = pieceF6.x
                    piece6.y = pieceF6.y

                    piece6:removeEventListener("touch", movePiece6)
                    
                    --increase the puzzleCounter by 1 and check if it's necessary to move to the next scene
                    puzzleCounter = puzzleCounter + 1
                    timer.performWithDelay(1000, checkPosition)
                --else make piece go back to where it was
                else
                    piece6.x = piece6PreviousX
                    piece6.y = piece6PreviousY

                    --change the size of the piece
                    piece6.width = 120
                    piece6.height = 120

                end
            end
        end                
end -- end of movePiece6(touch)

--move seventh puzzle piece
local function movePiece7(touch)
    --only work if none of the other pieces have been touched
        if (piece1AlreadyTouched == false and piece2AlreadyTouched == false and piece3AlreadyTouched == false and piece4AlreadyTouched == false and piece5AlreadyTouched == false and piece6AlreadyTouched == false and piece8AlreadyTouched == false and piece9AlreadyTouched == false) then 

            if touch.phase == "began" then
                --let other pieces know it has been clicked
                piece7AlreadyTouched = true

                --change the size of the piece
                piece7.width = 180
                piece7.height = 180

            elseif touch.phase == "moved" then
                --dragging function
                piece7.x = touch.x
                piece7.y = touch.y
            elseif touch.phase == "ended" then
                piece7AlreadyTouched = false

                -- if the piece is in the right spot go to center  and remove the event listener
                if (((pieceF7.x - pieceF7.width/2) < piece7.x ) and
                    ((pieceF7.x + pieceF7.width/2) > piece7.x ) and 
                    ((pieceF7.y - pieceF7.height/2) < piece7.y ) and 
                    ((pieceF7.y + pieceF7.height/2) > piece7.y ) ) then

                    piece7.x = pieceF7.x
                    piece7.y = pieceF7.y

                    piece7:removeEventListener("touch", movePiece7)
                    
                    --increase the puzzleCounter by 1 and check if it's necessary to move to the next scene
                    puzzleCounter = puzzleCounter + 1
                    timer.performWithDelay(1000, checkPosition)
                --else make piece go back to where it was
                else
                    piece7.x = piece7PreviousX
                    piece7.y = piece7PreviousY

                    --change the size of the piece
                    piece7.width = 120
                    piece7.height = 120

                end
            end
        end                
end -- end of movePiece7(touch)

--move eighth puzzle piece
local function movePiece8(touch)
    --only work if none of the other pieces have been touched
        if (piece1AlreadyTouched == false and piece2AlreadyTouched == false and piece3AlreadyTouched == false and piece4AlreadyTouched == false and piece5AlreadyTouched == false and piece6AlreadyTouched == false and piece7AlreadyTouched == false and piece9AlreadyTouched == false) then 

            if touch.phase == "began" then
                --let other pieces know it has been clicked
                piece8AlreadyTouched = true

                --change the size of the piece
                piece8.width = 180
                piece8.height = 180

            elseif touch.phase == "moved" then
                --dragging function
                piece8.x = touch.x
                piece8.y = touch.y
            elseif touch.phase == "ended" then
                piece8AlreadyTouched = false

                -- if the piece is in the right spot go to center  and remove the event listener
                if (((pieceF8.x - pieceF8.width/2) < piece8.x ) and
                    ((pieceF8.x + pieceF8.width/2) > piece8.x ) and 
                    ((pieceF8.y - pieceF8.height/2) < piece8.y ) and 
                    ((pieceF8.y + pieceF8.height/2) > piece8.y ) ) then

                    piece8.x = pieceF8.x
                    piece8.y = pieceF8.y

                    piece8:removeEventListener("touch", movePiece8)
                    
                    --increase the puzzleCounter by 1 and check if it's necessary to move to the next scene
                    puzzleCounter = puzzleCounter + 1
                    timer.performWithDelay(1000, checkPosition)
                --else make piece go back to where it was
                else
                    piece8.x = piece8PreviousX
                    piece8.y = piece8PreviousY

                    --change the size of the piece
                    piece8.width = 120
                    piece8.height = 120

                end
            end
        end                
end -- end of movePiece8(touch)


--move nineth puzzle piece
local function movePiece9(touch)
    --only work if none of the other pieces have been touched
        if (piece1AlreadyTouched == false and piece2AlreadyTouched == false and piece3AlreadyTouched == false and piece4AlreadyTouched == false and piece5AlreadyTouched == false and piece6AlreadyTouched == false and piece7AlreadyTouched == false and piece8AlreadyTouched == false) then 

            if touch.phase == "began" then
                --let other pieces know it has been clicked
                piece9AlreadyTouched = true

                --change the size of the piece
                piece9.width = 180
                piece9.height = 180

            elseif touch.phase == "moved" then
                --dragging function
                piece9.x = touch.x
                piece9.y = touch.y
            elseif touch.phase == "ended" then
                piece9AlreadyTouched = false

                -- if the piece is in the right spot go to center  and remove the event listener
                if (((pieceF9.x - pieceF9.width/2) < piece9.x ) and
                    ((pieceF9.x + pieceF9.width/2) > piece9.x ) and 
                    ((pieceF9.y - pieceF9.height/2) < piece9.y ) and 
                    ((pieceF9.y + pieceF9.height/2) > piece9.y ) ) then

                    piece9.x = pieceF9.x
                    piece9.y = pieceF9.y

                    piece9:removeEventListener("touch", movePiece9)
                    
                    --increase the puzzleCounter by 1 and check if it's necessary to move to the next scene
                    puzzleCounter = puzzleCounter + 1
                    timer.performWithDelay(1000, checkPosition)
                --else make piece go back to where it was and change the size
                else
                    piece9.x = piece9PreviousX
                    piece9.y = piece9PreviousY
                    
                    --change the size of the piece
                    piece9.width = 120
                    piece9.height = 120

                end
            end
        end                
end -- end of movePiece9(touch)


--this function hides the puzzle after the scene dissapears
local function hidePuzzle()
  --hide the original image
    pieceF1.alpha = 0
    pieceF2.alpha = 0
    pieceF3.alpha = 0
    pieceF4.alpha = 0
    pieceF5.alpha = 0
    pieceF6.alpha = 0
    pieceF7.alpha = 0
    pieceF8.alpha = 0
    pieceF9.alpha = 0

    --hide the separate pieces
    piece1.alpha = 0
    piece2.alpha = 0
    piece3.alpha = 0
    piece4.alpha = 0
    piece5.alpha = 0
    piece6.alpha = 0
    piece7.alpha = 0
    piece8.alpha = 0
    piece9.alpha = 0

    --change the size of the pieces
    piece1.width = 120
    piece1.height = 120
    piece2.width = 120
    piece2.height = 120
    piece3.width = 120
    piece3.height = 120
    piece4.width = 120
    piece4.height = 120
    piece5.width = 120
    piece5.height = 120
    piece6.width = 120
    piece6.height = 120
    piece7.width = 120
    piece7.height = 120
    piece8.width = 120
    piece8.height = 120
    piece9.width = 120
    piece9.height = 120

    --set the puzzleCounter to zero 
    puzzleCounter = 0
    print("puzzleCounter"..puzzleCounter)
end
-------------------------------------
--ADD EVENT LISTENERS TO THE OBJECTS
--------------------------------------
local function addEventListener()
    piece1:addEventListener("touch", movePiece1)
    piece2:addEventListener("touch", movePiece2)
    piece3:addEventListener("touch", movePiece3)
    piece4:addEventListener("touch", movePiece4)
    piece5:addEventListener("touch", movePiece5)
    piece6:addEventListener("touch", movePiece6)
    piece7:addEventListener("touch", movePiece7)
    piece8:addEventListener("touch", movePiece8)
    piece9:addEventListener("touch", movePiece9)
end

-------------------------------------
--REMOVE EVENT LISTENERS TO THE OBJECTS
--------------------------------------
local function removeEventListener()
    piece1:removeEventListener("touch", movePiece1)
    piece2:removeEventListener("touch", movePiece2)
    piece3:removeEventListener("touch", movePiece3)
    piece4:removeEventListener("touch", movePiece4)
    piece5:removeEventListener("touch", movePiece5)
    piece6:removeEventListener("touch", movePiece6)
    piece7:removeEventListener("touch", movePiece7)
    piece8:removeEventListener("touch", movePiece8)
    piece9:removeEventListener("touch", movePiece9)
end

-----------------------------------------------------------------
--GLOBAL FUNCTION
-----------------------------------------------------------------
function startWizzard()
    bkgChannel = audio.play(bkgSound, { channel=3, loops=-1 })
end

-- -----------------------------------------------------------------------------------
-- Global scene functions
-- -----------------------------------------------------------------------------------
 
-- create()
function scene:create( event )
 
    local sceneGroup = self.view

    --create the background
    bkg = display.newImageRect("Level2/Level2ScreenValeriaV.png", 0, 0, 0, 0)
    bkg.x = 500
    bkg.y = 380
    bkg.width = display.contentWidth + 20
    bkg.height = display.contentHeight + 10
    sceneGroup:insert(bkg)
    
    --create the character
    wizard = display.newImage("Level2/WizardValeriaV@2x.png")
    wizard.x = 1200
    wizard.y = -300
    wizard.width = 650
    wizard.height = 650
    wizard.alpha = 0
    sceneGroup:insert(wizard)

    --create the scroll
    scroll = display.newImage("Level2/ScrollValeriaV.png")
    scroll.x = -200
    scroll.y = 400
    scroll.width = 300
    scroll.height = 500
    scroll.alpha = 0
    sceneGroup:insert(scroll)

    --create the instuctions text
    instructions = display.newText("       In this Level\n      you must put\nthe puzzle pieces in\n   the correct spot.\n If you complete the\n    puzzle you will\n move on to level 3", 720, 400, native.systemFontBold, 45)
    instructions:setTextColor(14/255, 102/255, 85/255)
    instructions.alpha = 0
    sceneGroup:insert(instructions)

    --create the explossion
    explossion = display.newImage("Level2/ExplosionValeriaV.png")
    explossion.x = display.contentWidth/2
    explossion.y = display.contentHeight/2
    explossion.alpha = 0
    sceneGroup:insert(explossion)
    --------------------------------------------------------------
    --create the faded puzzle pieces
    --------------------------------------------------------------
    --first piece
    pieceF1 = display.newImageRect("PuzzleFade2/1Piece.png", 0, 0, 0, 0)
    pieceF1.x = 330
    pieceF1.y = 130
    pieceF1.width = 180
    pieceF1.height = 180
    pieceF1.alpha = 0
    sceneGroup:insert(pieceF1)
    
    --second piece
    pieceF2 = display.newImageRect("PuzzleFade2/2Piece.png", 0, 0, 0, 0)
    pieceF2.x = 510
    pieceF2.y = 130
    pieceF2.width = 180
    pieceF2.height = 180
    pieceF2.alpha = 0
    sceneGroup:insert(pieceF2)

    --third piece
    pieceF3 = display.newImageRect("PuzzleFade2/3Piece.png", 0, 0, 0, 0)
    pieceF3.x = 690
    pieceF3.y = 130
    pieceF3.width = 180
    pieceF3.height = 180
    pieceF3.alpha = 0
    sceneGroup:insert(pieceF3)

    --fourth piece
    pieceF4 = display.newImageRect("PuzzleFade2/4Piece.png", 0, 0, 0, 0)
    pieceF4.x = 330
    pieceF4.y = 310
    pieceF4.width = 180
    pieceF4.height = 180
    pieceF4.alpha = 0
    sceneGroup:insert(pieceF4)

    --fifth piece
    pieceF5 = display.newImageRect("PuzzleFade2/5Piece.png", 0, 0, 0, 0)
    pieceF5.x = 510
    pieceF5.y = 310
    pieceF5.width = 180
    pieceF5.height = 180
    pieceF5.alpha = 0
    sceneGroup:insert(pieceF5)

    --sixth piece
    pieceF6 = display.newImageRect("PuzzleFade2/6Piece.png", 0, 0, 0, 0)
    pieceF6.x = 690
    pieceF6.y = 310
    pieceF6.width = 180
    pieceF6.height = 180
    pieceF6.alpha = 0
    sceneGroup:insert(pieceF6)

    --seventh piece
    pieceF7 = display.newImageRect("PuzzleFade2/7Piece.png", 0, 0, 0, 0)
    pieceF7.x = 330
    pieceF7.y = 490
    pieceF7.width = 180
    pieceF7.height = 180
    pieceF7.alpha = 0
    sceneGroup:insert(pieceF7)

    --eighth piece
    pieceF8 = display.newImageRect("PuzzleFade2/8Piece.png", 0, 0, 0, 0)
    pieceF8.x = 510
    pieceF8.y = 490
    pieceF8.width = 180
    pieceF8.height = 180
    pieceF8.alpha = 0
    sceneGroup:insert(pieceF8)

    --nineth piece
    pieceF9 = display.newImageRect("PuzzleFade2/9Piece.png", 0, 0, 0, 0)
    pieceF9.x = 690
    pieceF9.y = 490
    pieceF9.width = 180
    pieceF9.height = 180
    pieceF9.alpha = 0
    sceneGroup:insert(pieceF9)

    --------------------------------------------------------------
    --create the  puzzle pieces
    --------------------------------------------------------------
    --first piece
    piece1 = display.newImageRect("Puzzle2/1Piece.png", 0, 0, 0, 0)
    piece1.x = 120
    piece1.y = 90
    piece1.width = 120
    piece1.height = 120
    piece1.alpha = 0
    sceneGroup:insert(piece1)

    --second piece
    piece2 = display.newImageRect("Puzzle2/2Piece.png", 0, 0, 0, 0)
    piece2.x = 910
    piece2.y = 295
    piece2.width = 120
    piece2.height = 120
    piece2.alpha = 0
    sceneGroup:insert(piece2)

    --third piece
    piece3 = display.newImageRect("Puzzle2/3Piece.png", 0, 0, 0, 0)
    piece3.x = 120
    piece3.y = 680
    piece3.width = 120
    piece3.height = 120
    piece3.alpha = 0
    sceneGroup:insert(piece3)

    --fourth piece
    piece4 = display.newImageRect("Puzzle2/4Piece.png", 0, 0, 0, 0)
    piece4.x = 910
    piece4.y = 485
    piece4.width = 120
    piece4.height = 120
    piece4.alpha = 0
    sceneGroup:insert(piece4)

    --fifth piece
    piece5 = display.newImageRect("Puzzle2/5Piece.png", 0, 0, 0, 0)
    piece5.x = 120
    piece5.y = 295
    piece5.width = 120
    piece5.height = 120
    piece5.alpha = 0
    sceneGroup:insert(piece5)

    --sixth piece
    piece6 = display.newImageRect("Puzzle2/6Piece.png", 0, 0, 0, 0)
    piece6.x = 910
    piece6.y = 680
    piece6.width = 120
    piece6.height = 120
    piece6.alpha = 0
    sceneGroup:insert(piece6)

    --seventh piece
    piece7 = display.newImageRect("Puzzle2/7Piece.png", 0, 0, 0, 0)
    piece7.x = 910
    piece7.y = 90
    piece7.width = 120
    piece7.height = 120
    piece7.alpha = 0
    sceneGroup:insert(piece7)

    --eigth piece
    piece8 = display.newImageRect("Puzzle2/8Piece.png", 0, 0, 0, 0)
    piece8.x = 500
    piece8.y = 680
    piece8.width = 120
    piece8.height = 120
    piece8.alpha = 0
    sceneGroup:insert(piece8)

    --nineth piece
    piece9 = display.newImageRect("Puzzle2/9Piece.png", 0, 0, 0, 0)
    piece9.x = 120
    piece9.y = 485
    piece9.width = 120
    piece9.height = 120
    piece9.alpha = 0
    sceneGroup:insert(piece9)


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

 --------------------------------------------------------------------------------------
 --sounds
 -------------------------------------------------------------------------------------
 
  --background sound 
  bkgSound = audio.loadStream("Sounds/level2.mp3")
  -- correct sound 
  correctSound = audio.loadStream("Sounds/correct.mp3")
  --magic sound
  magicSound = audio.loadStream("Sounds/magic.mp3")

  movewizard()
  timer.performWithDelay(3000, displayExplossion)
  timer.performWithDelay(3500, displayPuzzle)
end
 
 
-- show()
function scene:show( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)
 
    elseif ( phase == "did" ) then
        -- Code here runs when the scene is entirely on screen
        if (levelCounter == 1) then
         displayPuzzle()
         pauseButton.alpha = 1
        end
        changePossition()
        addEventListener()
        startWizzard()
        
        
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
        hidePuzzle()
        audio.stop(3)
        removeEventListener()
        levelCounter = 1
 
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
