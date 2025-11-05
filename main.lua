-- Group Project
-- Jacob Passarello, Charlyn Woodruff, Austin Steen, Naedia McCann,
-- CIT 227 Applied Programming
-- Group Project - Love 2D & Tiled
-- April 18, 2025

--this requires all files needed for the game to run
require('dependencies')

-- love load function
function love.load()

    -- These lines below set the window size and resizable to false, sets the window title, the background color
    love.graphics.setDefaultFilter('nearest', 'nearest')
	love.window.setMode(1024, 643, {resizable=false})
    love.window.setTitle("Mr Man Mario Adventures")
    bkgrndcolor = {0, 0.4, 0.2}
    bkgrndcolor2 = {0, 0.5, 0.7}


    -- These lines set the tx amount to 0, creates the new canvas at size of 256*3 by 554 and stores it in the variable gameScreen and 
    -- sets the variable map to level one lua file
    tx = 0
    gameScreen = love.graphics.newCanvas(256*3,554)
    heartImage= love.graphics.newImage("assets/graphics/ui/health_black_outline.png")
    heartImage:setFilter('nearest','nearest')
    gameworld = GameWorld:new(heartImage)

    -- This line creates level one of the game
    levelOne = Level:new('level1','mr_man','coins','round_dudes')

    -- This line calls the game state function
    game = game()
     -- This line sets the game state level to level one
    game:changeLevel('levelOne')

end

  

-- love update function
function love.update(dt)
    
    -- This if statement checks to see if the escape key is down  
    if love.keyboard.isDown('escape') then

       -- This if statement checks to see if the game state is running and then changes it to pause the game
        if game.state.running then
            game:changeGameState("pause")
        end
    end
        -- This if statement checks to see if the tab key is down if it is it will change the game state to running
        if love.keyboard.isDown('tab')then
            game:changeGameState("running")
        end

        -- This if statement checks to see if the game state is ended 
        if game.state.ended then   

            -- This if statement checks to see if the space key is down if it is it will load level 1 with the players lives, totalCoins
            -- and health for the game and change the game state level to levelOne and then to running
            if love.keyboard.isDown('1') then
                levelOne = Level:new('level1','mr_man','totalCoins','round_dudes')
                game:changeLevel('levelOne')

                game:changeGameState("running")
      
            -- This if statement checks to see if the 1 key is down or the key 2 if it is it will load level 2  with the players lives, totalCoins
            -- and health for the game and change the game state to levelTwo and then to running
            elseif love.keyboard.isDown('2') then
                levelOne = Level:new('level2','mr_man','totalCoins','round_dudes')
                game:changeLevel('levelTwo')

                game:changeGameState("running")
            end
        end
        
        --This if statement checks to see if the game state  gameover and checks to see if space key
        -- is pressed and will quit and restart the game from the beginning
        if game.state.gameover or game.state.restart then   
            if love.keyboard.isDown('space') then
                love.event.quit('restart')
            end
        end

    --This if statement checks to see if the game state is running
    if game.state.running then

        -- This if statement checks to see if the a key is down if it is it will move the map to the left by 1
        -- the elseif check to see if the d key is down and then will move the map to the right by 1
        if love.keyboard.isDown('a')  then     
            tx = tx + 1    
        elseif love.keyboard.isDown('d')  then
            tx = tx - 1  
        end
        
        -- These two lines updates the map and the gameworld
        gameworld:update(dt)
        levelOne:update(dt)  
    end

    --This if statement checks to see if the game state is completed
    if game.state.completed then   
        
    -- This if statement checks to see if the 2 key is down if it is it will load level 2 for the game with all health,coins and lives 
    -- and change the game state to levelTwo and then to gamestate running
        if love.keyboard.isDown('2') then
            levelOne = Level:new('Level2','mr_man','totalCoins','round_dudes')
            game:changeLevel('levelTwo')

            game:changeGameState("running")
        end    
    end
end


-- function to draw and sets the new canvas gamescreen to the screen with the scale size, sets the background color of the window 
-- and draws the map to the screen canvas using the tx direction
function love.draw()

    --This if statement checks to see if the game state is running
    if game.state.running then
        

        love.graphics.setCanvas(gameScreen)
        -- this line clears any graphics left
        love.graphics.clear()

        -- this line draws the map level
        levelOne:draw(tx)

        love.graphics.setCanvas()

        -- This line draw the gamescreen canvas at a scale of 2 by 2
        love.graphics.draw(gameScreen,0,0,0,2,2)

        --These two lines draws the gameworld and sets the font color to black
        gameworld:draw() 
        love.graphics.setColor(1,1,1) 

    --This if statement checks to see if the game state is paused, sets the background color and then prints to the gamescreen at x and y coordinates
    elseif game.state.pause then
        love.graphics.setBackgroundColor(bkgrndcolor)
        love.graphics.print("The game is paused.", 400, 300)

    --This if statement checks to see if the game state is ended, sets the background color and then prints to the gamescreen at x and y coordinates
    elseif game.state.ended then 
        love.graphics.setBackgroundColor(bkgrndcolor2)
        love.graphics.print("You have perished!", 400, 250)
        if(game.level.levelOne)then 
            love.graphics.print("Press key 1 to restart level 1", 350, 300)
        else
            love.graphics.print("Press key 2 to restart level 2", 370, 300)
        end
    --This if statement checks to see if the game state is restarted, sets the background color and then prints to the gamescreen at x and y coordinates
    elseif game.state.restart then
        love.graphics.setBackgroundColor(bkgrndcolor)
        love.graphics.print("You have run out of time!", 400, 250)
        love.graphics.print("Press spacebar to restart", 400, 300)
      
    --This if statement checks to see if the game state level is completed, sets the background color and then prints to the gamescreen at x and y coordinates
    elseif game.state.completed then
        love.graphics.setBackgroundColor(bkgrndcolor2)
        love.graphics.print("  Congrats you completed the level!", 380, 250)
        love.graphics.print("Press key 2 for the next level", 400, 300)

    --This if statement checks to see if the game state level is gameover, sets the background color and then prints to the gamescreen at x and y coordinates
    elseif game.state.gameover then
        love.graphics.setBackgroundColor(bkgrndcolor)
        love.graphics.print("Game Over !", 440, 250)
        love.graphics.print("Press key space bar to play again ", 350, 300)
    end  
end