-- Group Project
-- Jacob Passarello, Charlyn Woodruff, Austin Steen, Naedia McCann,
-- CIT 227 Applied Programming
-- Group Project - Love 2D & Tiled
-- April 18, 2025

--Heart class inherits from the Entity class
Heart = class('Heart', Entity) 


-- This is the function to update the Heart objects
function Heart:update(dt)

    self.animation:update(dt)
    Entity:update(self, dt)
 end

--This is the function to handle input
function Heart:handle_input(dt)
     
end

-- This is the function that draws the enemy objects
function Heart:draw()

    -- This line will draw the Heart animations to the the screen at a scale 2,2
    self.animation:draw(self.image, self.x, self.y, 0, 0.8,0.8) 
end