-- Group Project
-- Jacob Passarello, Charlyn Woodruff, Austin Steen, Naedia McCann,
-- CIT 227 Applied Programming
-- Group Project - Love 2D & Tiled
-- April 18, 2025


GameWorld = class('GameWorld')

function GameWorld:initialize(heartImage)

    -- these 7 lines set the variables for the gameworld
    self.lives = gCharacterDefs.mr_man.lives
    self.Time = 300
    self.health = GameWorld:getHearts()
    self.maxHealth=5
    self.heartFull= heartImage
    self.heartWidth = self.heartFull:getWidth() / 2  -- Assuming 2 hearts side-by-side
    self.heartHeight = self.heartFull:getHeight()

    -- These 3 lines set the background music for the game, sets it to loop, sets the volume and plays it
    music = love.audio.newSource( 'assets/music/backgroundMusic.wav', 'static' )
    music:setLooping(true)
    music:setVolume(0.1)
    music:play()


    self.heartQuads = {
       full = love.graphics.newQuad(0, 0, self.heartWidth, self.heartHeight, self.heartFull:getDimensions()),
       empty = love.graphics.newQuad(self.heartWidth, 0, self.heartWidth, self.heartHeight, self.heartFull:getDimensions())
    } 
 end

 -- function to update the time  and health in the gameworld
 function GameWorld:update(dt)
    if self.Time > 0 then
        self.Time = self.Time - dt
        if self.Time < 0 then
            self.Time = 0
        end 
    end
    self.health=math.max(0,math.min(self.health,self.maxHealth))   
 end

-- function to print total stats to the game
function GameWorld:draw()

    -- These lines are the x postion of the print lines, sets the font color, font type, sets font filter, and then sets the font
    x = 890
    love.graphics.setColor(0,0,0)
    font = love.graphics.newFont('assets/fonts/HennyPenny-Regular.ttf', 20)
    font:setFilter('nearest')
    love.graphics.setFont(font)

    -- this sets the time for the game
    Time = math.floor(self.Time)

-- this if statement checks to see if if the players total coins is more than 5000 if it is it removes 5000 coins returns the total coin amount
-- and adds another life to the players lives count
  if gCharacterDefs.mr_man.totalCoins > 1000 then
        gCharacterDefs.mr_man.totalCoins = gCharacterDefs.mr_man.totalCoins - 1000
        self.lives = self.lives + 1
        return gCharacterDefs.mr_man.totalCoins
    end
 

    --These lines print the player statistics to the screen and their position
    love.graphics.print('Mr Man  Mario Adventures',400,10)
    love.graphics.print('Lives :    '..self.lives,x,8)
    love.graphics.print('Coins :    '..gCharacterDefs.mr_man.totalCoins ,x,28)
    love.graphics.print('Time :   '..Time,x,50) 
    love.graphics.print('Escape key to pause', 10,10,0,0.8,0.8) 
    love.graphics.print('Tab key to play', 10,35,0,0.8,0.8) 
   
    -- this if statement checks to see if the time has run out, sets the sound, plays it and changes the game state to restart
   if Time == 0 then
        sound = love.audio.newSource(gCharacterDefs.mr_man.soundDie, "static")   
        music:setVolume(0)
        sound:play()
        game:changeGameState('restart')
   end 
   
   -- this calls the function to draw the heart bar to the game
    self:drawHeartBar(890,88,15)

    -- this if statement checks to see if the health equals 0 and then sets the background music volume to 0
    if self.health == 0 then 
        music:setVolume(0)
    end
end

-- function to create and draw the heart health bar to the game
function GameWorld:drawHeartBar(x, y, spacing)
    local width = self.heartWidth 
    local height = self.heartHeight 
    local scale=2
    for i = 1, self.maxHealth do
        local drawX = x + (i - 1) * (width + spacing)
        local quad = i <= self.health and self.heartQuads.full or self.heartQuads.empty
        love.graphics.setColor(1, 1, 1)
        love.graphics.draw(self.heartFull, quad, drawX, y,0, scale,scale)
    end
end

-- function for removing health points from the character and returning the value
function GameWorld:healthdown()
    local health=self.health or  0
    self.health=math.max(0,self.health-1)
    return self.health
end  

-- function for adding health points from the character
function GameWorld:healthup()
    local health=self.health or 0
    local maxHealth=self.maxHealth or 4
    self.health=math.min(maxHealth,health + 1)
end   

-- function for getting health points from the character and returning the value
function GameWorld:getHearts()
    gHeartDefs.heart.totalHearts = gHeartDefs.heart.startHearts 
	self.health = gHeartDefs.heart.totalHearts
    return self.health
end

-- function for getting lives and health from the character and removing a life when the health reaches 0,
-- sets the background music volume to 0 and changes the game state to ended and if the lives are less then 1 changes the gamestate to gameover
function GameWorld:loseLife()
    self.lives = math.max(0, self.lives - 1)
    if self.lives > 0 then
        self.health = self.maxHealth 
        game:changeGameState('ended')
    elseif self.lives < 1 then
        music:setVolume(0)
        game:changeGameState('gameover')
    end   
end
