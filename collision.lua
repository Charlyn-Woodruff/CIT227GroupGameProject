-- Group Project
-- Jacob Passarello, Charlyn Woodruff, Austin Steen, Naedia McCann,
-- CIT 227 Applied Programming
-- Group Project - Love 2D & Tiled
-- April 18, 2025

gColFilters = {
  
    Character = function(char, other)
        if other.name == 'terrain' then
            return 'slide'
        elseif other.name == 'coin' or other.name == 'heart' or other.name == 'spike'  or other.type == 'block' then
            return 'cross'
        end
        return 'slide'
    end        
}

function CheckCollision(x1,y1,w1,h1, x2,y2,w2,h2)
    return x1 < x2+w2 and
           x2 < x1+w1 and
           y1 < y2+h2 and
           y2 < y1+h1
end

-- function for the removing the character from the game and sets the sound and plays it 
function Character:onRemove()
    sound = love.audio.newSource(gCharacterDefs.mr_man.soundDie, "static")  
    sound:play()      
   self.remove = true
end

-- function for the character colliding with coins,adds the coins to the total to increase the characters coins and
-- sets the sound and plays it and removes the coins after the character collides with them
function Collectible:oncollide(character)  

    gCharacterDefs.mr_man.totalCoins = gCharacterDefs.mr_man.totalCoins + c.points
    sound = love.audio.newSource(gCollectibles.coins.soundCoin, "static")  
    sound:play()
    self.remove = true
end

-- function for the character colliding with hearts,calls the health up function to increase the characters health and
-- sets the sound and plays it and removes the hearts after the character collides with them
function Heart:oncollide(character)
    gameworld:healthup()
    sound = love.audio.newSource(gHeartDefs.heart.soundHearts, "static")  
    sound:play()  
    self.remove = true
end

-- function for the character colliding with blocks, sets the sound and plays it and
-- removes the blocks after the character collides with them
function Block:oncollide(character)
    sound = love.audio.newSource(gBlocks.red_brick.soundBlock, "static")  
    sound:play()
    self.remove = true
end

-- function for the character colliding with spike blocks
function Spike:oncollide(character)

    -- These two lines set the variable for the collide sound, sets the volume of the sound 
    -- and plays it when the character collides with spike blocks
    sound = love.audio.newSource(gSpikes.spike_block.soundSpike, "static")  
    sound:setVolume(0.8)
    sound:play()

    -- This line sets the variable health to the healthdown function return value
    health = gameworld:healthdown()

   -- This if statement checks to see if the health value is 0, if it is 0 it will call the function gaemworld:loselife() and then removes on of
    -- the character lives 
     if  health == 0 then       
       gameworld:loseLife()
     end
 end

-- function for the character colliding with enemies
function Enemy:oncollide(character)

    --Function called to remove the characters health hearts after colliding with enemy
    gameworld:healthdown()

    -- These two lines set the variable for the collide sound and plays it when the character collides with enemies
    sound = love.audio.newSource(gEnemys.round_dudes.soundEnemy, "static")  
    sound:play()

    -- This line sets the variable health to the healthdown function return value
   health = gameworld:healthdown()

 -- This if statement checks to see if the health value is 0, if it is 0 it will call the function gaemworld:loselife() and then removes one of 
    -- the character lives 
    if  health == 0 then
        gameworld:loseLife()
    end

end