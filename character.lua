-- Group Project
-- Jacob Passarello, Charlyn Woodruff, Austin Steen, Naedia McCann,
-- CIT 227 Applied Programming
-- Group Project - Love 2D & Tiled
-- April 18, 2025

--Character class inherits from the Entity class
Character = class('Character', Entity) 
 
--Funtion to initialize the character and all the parameters for creating the player character
function Character:initialize(x, y, world,def)
    Entity.initialize(self, x, y,def)
    self.world = world
    self.x = x
    self.y = y
    self.x_vel = 0
    self.y_vel = 0
    self.facing = 1
    self.Time = 300
    self.maxHealth=5
    self.gravityEffect = 1
    self.isGrounded=false
    self.colfilter=gColFilters.Character   
end


-- This is the function to update the Character object, calls the handle input, movePlayer function and updates entity
function Character:update(dt)
   self:handle_input(dt)
   self:movePlayer(dt)
    Entity:update(self, dt)
end

-- This function handles the input from the user keys pressed for the Character object, sets the gravity, x and y velocity, sounds, sound volume, 
-- plays the sound and sets the animation for each key that is down
function Character:handle_input(dt)
    local speed = 100
    GRAVITY = 1500
    TERMINAL_Y = 100

    if love.keyboard.isDown('up') and self.isGrounded then --one jump   
        self.y_vel = -500 -- change as needed for jump height
        self.animation = self.frames.jump
        self.isGrounded = false
        sound = love.audio.newSource(gCharacterDefs.mr_man.soundJump, "static") 
        sound:setVolume(0.5) 
        sound:play()

    elseif love.keyboard.isDown('down') then
        self.y_vel = 100
        self.animation = self.frames.fall

    elseif love.keyboard.isDown('left') then
        self.facing = -1
        self.x_vel = -speed
        self.animation = self.frames.run
  
    elseif love.keyboard.isDown('right') then
        self.facing = 1
        self.x_vel = speed
        self.animation = self.frames.run
       
        -- This checks to see if the space bar is pressed and will make the character jump across the screen if held down
        if love.keyboard.isDown('space') then
            self.y_vel = -100 -- change as needed for jump height
            self.animation = self.frames.jump
            self.isOnGround = false
        end
        
    else
        
        -- These lines set the x and y velocity to 0 and the animation to idle when not moving
        self.y_vel = 0
        self.x_vel = 0
        self.animation = self.frames.idle
    end  
    -- These two lines set the gravity and update the character's animations
    self.y_vel =  self.y_vel + dt * GRAVITY
    self.animation:update(dt)
end


-- This is the function that draws the Character object
function Character:draw()

    -- This line sets the offset for the images to 16
   local offset = 16

    -- This if else statement checks to see if the facing direction for the Character object is equal to -1, if it is it will draw the 
    -- self animation to face to the left, if it does not equal -1 if will draw the animation to face to the right
    if self.facing == -1 then
        self.animation:draw(self.image, self.x, self.y, 0, self.facing*1,1, offset)
    else
        self.animation:draw(self.image, self.x, self.y, 0, 1,1) 
    end

end

-- Function to move the player 
function Character:movePlayer( dt)

    local goalX, goalY = self.x + self.x_vel * dt, self.y + self.y_vel * dt
    local actualX, actualY, cols, len = self.world:move(self, goalX, goalY,self.colfilter)
    self.x, self.y = actualX, actualY
    self.isGrounded=false
    for i=1,len do
      local col=cols[i]  
      local other = col.other
      if col.normal.y < 0 then--checks for normal movement
        self.isGrounded = true--checks if on the ground
        self.y_vel = 0
    end
        if other and other.oncollide then
            other:oncollide(self)
        end     
    end
end