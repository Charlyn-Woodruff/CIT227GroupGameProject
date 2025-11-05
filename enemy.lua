-- Group Project
-- Jacob Passarello, Charlyn Woodruff, Austin Steen, Naedia McCann,
-- CIT 227 Applied Programming
-- Group Project - Love 2D & Tiled
-- April 18, 2025

---Enemy class inherits from the Entity class
Enemy = class('Enemy', Entity) 

-- This is the function to update the enemy objects and calls the handle input function
function Enemy:update(dt)
    self:handle_input(dt)  
    Entity.update(self, dt)
 end

-- added initialize funtions for the enemies that handles their patrol speed and distance
function Enemy:initialize(x, y, def)
    Entity.initialize(self, x, y, def)

    self.start_x = x
    self.patrol_range = def.patrol_range or 100
    self.x_vel = def.patrol_speed or 100
    self.facing = 1
    self.animation = self.frames.enemy2
end

-- function changes the way the enemies are facing 
function Enemy:handle_input(dt)
    local left_bound = self.start_x - self.patrol_range
    local right_bound = self.start_x + self.patrol_range

    if self.x >= right_bound then
        self.facing = -1
        self.x_vel = -math.abs(self.x_vel)
    elseif self.x <= left_bound then
        self.facing = 1
        self.x_vel = math.abs(self.x_vel)
    end

    self.x = self.x + self.x_vel * dt
    self.animation:update(dt)
end

-- This is the function that draws the enemy objects
function Enemy:draw()

    -- This line sets the offset for the images to 16
   local offset = 16

    -- This if else statement checks to see if the facing direction for the enemy object is equal to -1, if it is it will draw the 
    -- self animation to face to the left, if it does not equal -1 if will draw the animation to face to the right
    if self.facing == -1 then
        self.animation:draw(self.image, self.x, self.y, 0, self.facing*1,1, offset)
    else
        self.animation:draw(self.image, self.x, self.y, 0, 1,1) 
    end
end