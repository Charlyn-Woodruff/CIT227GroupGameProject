

Entity = class('Entity')

-- Entity Constructor
function Entity:initialize(x, y, def)
    self.x = x -- looks ambiguous, right? which 'x'? 
    self.y = y
    self.facing = 1
    self.x_vel = 0
    self.y_vel = 0
    self.gravityEffect = 0
    self.image = love.graphics.newImage('assets/graphics/'.. def.img_file)
    
    -- set up animations
    local hi_width, hi_height = self.image:getDimensions() -- Image object method
    -- returns a function (that we call 'g')
    local g = anim8.newGrid(def.w,def.h, hi_width, hi_height)
    --idle = anim8.newAnimation(g(1,1, 2,1, 3,1))
    self.frames = {}
    -- loop through key/value pairs of def.animations
    -- for key, value in pairs(tablename) do 

    for animName, animData in pairs(def.animations) do 
        self.frames[animName] = anim8.newAnimation(g(unpack(animData.frames)), animData.duration)
    end
    self.animation = self.frames[def.defaultAnimation] -- set current animation to idle
end

function Entity:update(dt)
    --self.animation:update(dt)
    self.x = self.x --- self.x_vel
    self.y = self.y --+ self.y_vel
    

end

function Entity:draw()
   
    local offset = 0
    if self.facing == -1 then
        offset = 16
    end
    self.animation:draw(self.image, self.x,self.y, 0, self.facing*2,2, offset)
end

function Entity:setPosition(x, y)
    self.x = x 
    self.y = y 
end

function Entity:onRemove()
  
    if self.world and self.world:hasItem(self) then
        self.world:remove(self)
    end
end