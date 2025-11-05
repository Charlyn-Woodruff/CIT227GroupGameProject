-- Group Project
-- Jacob Passarello, Charlyn Woodruff, Austin Steen, Naedia McCann,
-- CIT 227 Applied Programming
-- Group Project - Love 2D & Tiled
-- April 18, 2025

--Block class inherits from the Entity class
Block = class('Block', Entity) 

-- This is the function to update the block objects
function Block:update(dt)
    Entity.update(self, dt)
 end

--This is the function to handle input
function Block:handle_input(dt)

end

-- This is the function that draws the enemy objects
function Block:draw()

    -- This line will draw the block animations to the the screen at a scale 4,4
    self.animation:draw(self.image, self.x, self.y, 0, 1,1) 
end