-- Group Project
-- Jacob Passarello, Charlyn Woodruff, Austin Steen, Naedia McCann,
-- CIT 227 Applied Programming
-- Group Project - Love 2D & Tiled
-- April 18, 2025

--Spike class inherits from the Entity class
Spike = class('Spike', Entity) 


-- This is the function to update the Spike objects
function Spike:update(dt)

    self.animation:update(dt)
    Entity:update(self, dt)
 end

--This is the function to handle input
function Spike:handle_input(dt)
     
end

-- This is the function that draws the enemy objects
function Spike:draw()

    -- This line will draw the Spike animations to the the screen at a scale 2,2
    self.animation:draw(self.image, self.x, self.y, 0, 1,1) 
end