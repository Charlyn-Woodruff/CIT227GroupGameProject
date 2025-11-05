-- Group Project
-- Jacob Passarello, Charlyn Woodruff, Austin Steen, Naedia McCann,
-- CIT 227 Applied Programming
-- Group Project - Love 2D & Tiled
-- April 18, 2025

Level = class('Level')

function Level:initialize(level_id, player_id, collectible, enemy)
	self.map = sti('/assets/maps/'.. level_id ..'.lua', {'bump'})
    
	self.entities = {
		players = {},
		enemies = {},
		collectibles = {},
		blocks = {},
		spikes = {},
		effects = {}
	}
	self.world = bump.newWorld()
	self.player = Character:new( 0,0,self.world, gCharacterDefs[player_id])

	--self.bg_music = Music[self.map.properties.bg_music]
	--self.name = self.map.properties.name
	self.map:bump_init(self.world)

	--self.time_limit = self.map.properties.time_limit
	--loop through all the objects in the map
	--enemies, collectibles, blocks, spawn_points, etc. 
	
	for _, o in pairs(self.map.objects) do -- for key, value in pairs(someTable) do 
		if o.type == 'spawn_point' then 

			self.player.x = o.x  
			self.player.y = o.y 
			self.player.x_vel = o.x_vel
			self.player.y_vel = o.y_vel
			self.player.w = o.properties.width
			self.player.h = o.properties.height
			self.player.hearts = 3
			self.player.lives = 5
			self.player.htbxwidth = 8
			self.player.htbxheight= 8
			self:addEntity(player)
	
			-- add it to the entities table
			table.insert(self.entities.players, self.player)

			-- add it to the collision world
			self.world:add(
				self.player, 
				self.player.x,
				self.player.y,
				self.player.w,
				self.player.h,
				self.player.htbxwidth, 
				self.player.htbxheight		
			)
			
		elseif o.type == 'spike' then

			if o.name == 'spike_block' then
				local b = Spike:new(0,0,gSpikes.spike_block,self)
				b.x = o.x 
				b.y = o.y  - o.height
				b.width = o.width
				b.height = o.height

 				self:addEntity(b)

				-- add it to the entities table
				table.insert(self.entities.blocks, b)

				self.world:add(b, b.x, b.y, b.width, b.height)
			end	
       
		elseif o.type == 'block' then 
			
			if o.name == 'red_block_brk' then
				local f = Block:new(0,0,gBlocks.red_brick,self)
				f.x = o.x 
				f.y = o.y  - o.height
				f.width = o.width
				f.height = o.height
 				self:addEntity(f)

				-- add it to the entities table
				table.insert(self.entities.blocks, f)

				self.world:add(f, f.x, f.y, f.width, f.height)
			end
			if o.name == 'green_block_brk' then
				local g = Block:new(0,0,gBlocks.green_brick,self)
				g.x = o.x 
				g.y = o.y  - o.height
				g.width = o.width
				g.height = o.height
 				self:addEntity(g)

				-- add it to the entities table
				table.insert(self.entities.blocks, g)

				self.world:add(g, g.x, g.y, g.width, g.height)
			end
			if o.name == 'smiley_mvBlock' then
				local s = Block:new(0,0,gBlocks.smiley_block,self)
				s.x = o.x 
				s.y = o.y  - o.height
				s.width = o.width
				s.height = o.height
 				self:addEntity(s)

				-- add it to the entities table
				table.insert(self.entities.blocks, s)

				self.world:add(s, s.x, s.y, s.width, s.height)
			end
		elseif o.type == 'terrain' then
			local t = {
				name = o.name or "terrain",
				type = "terrain",
				x = o.x,
				y = o.y - o.height,
				width = o.width,
				height = o.height
			}
		
			-- Optional: Add to entities list if you want to draw or debug
			table.insert(self.entities.blocks, t)
		
			-- Add to collision world
			self.world:add(t, t.x, t.y, t.width, t.height)
		
		

		elseif o.type == 'enemy' then 
			--create the enemy
			local e = Enemy:new(o.x, o.y - o.height, gEnemys[enemy])
			e.x = o.x  
			e.y = o.y - 18
			e.x_vel = 100
			e.y_vel = 100
			e.w = 16
			e.h = 16
			e.htbxwidth = 8
			e.htbxheight= 10
			e.patrol_speed = 50
			e.patrol_range = 30
			self:addEntity(e)

			-- add it to the entities table and the world
			table.insert(self.entities.enemies, e)
			self.world:add(e, e.x, e.y, e.w, e.h,e.htbxwidth, e.x_vel,e.y_vel,e.htbxheight)
			
			
		elseif o.type == 'collectible' then 

			if o.name == 'coin' then

				 c = Collectible:new(0,0,gCollectibles.coins,self)			
				c.x = o.x 
				c.y = o.y - o.height
				c.width = o.width
				c.height = o.height
				c.points = o.properties.points
				self:addEntity(c)
				
				-- add it to the entities table and the world
				table.insert(self.entities.collectibles, c)
           	 	self.world:add(c, c.x, c.y, c.width, c.height,c.points)
			end

		elseif o.type == 'heart' then
			
			if o.name == 'heart' then
				local hrt = Heart:new(0,0,gHeartDefs.heart,self)
				hrt.x = o.x 
				hrt.y = o.y  - o.height
				hrt.width = o.width
				hrt.height = o.height
				
 				self:addEntity(hrt)

				-- add it to the entities table and the world
				table.insert(self.entities.blocks, hrt)
				self.world:add(hrt, hrt.x, hrt.y, hrt.width, hrt.height)
			end

        end
	end

	gameWidth = 768
	gameHeight = 554
	self.camera = Camera:Create(self.map, gameWidth, gameHeight, self.player)


	local entityLayer = self.map:convertToCustomLayer('entities')
	entityLayer.update = function(layer, dt)
		--for _, e in ipairs(self.entities) do
		for _, entities in pairs(self.entities) do
			for i=#entities, 1, -1 do
				local e = entities[i]
				if e.remove then 
					-- remove from self table
					e:onRemove()
					table.remove(entities, i)
					if e.type ~= 'effect' then
						self.world:remove(e)
					end
				else
					e:update(dt)
				end
			end
		end
	end

	entityLayer.draw = function(layer)


		for _, e in ipairs(self.entities.blocks) do 
			e:draw()
		end

		--[[for _, e in ipairs(self.entities.effects) do 
			e:draw()
		end ]]
		for _, e in ipairs(self.entities.collectibles) do 
			e:draw()
		end
		for _, e in ipairs(self.entities.enemies) do 
			e:draw()
		end 
		for _, e in ipairs(self.entities.players) do 
			e:draw()
		end
	end

	--self.map:removeLayer('other') 

end

function Level:addEntity(e)
	--table.insert(self.entities[e.type], e)
	--self.world:add(e, e.x, e.y, e.width, e.height)
end

function Level:addEffect(e)
	--table.insert(self.entities.effects, e)
end

function Level:handleInput(dt)
	self.player:handleInput(dt)
end

function Level:update(dt)	
	self.map:update(dt)
	self.camera:update(dt)	
end

function Level:draw(sx, sy)
    --self.player:draw()
	local tx, ty = self.camera:transCoords()
	self.map:draw(tx, ty)	

 -- This if statement checks to see if the self.player value is greater than 2910, if it is
 -- it will change the game state to completed for the next level
    -- the character lives 
	x = self.player.x
	if x > 2910 then
		game:changeGameState('completed')
	end
	--love.graphics.setColor(0, 1, 0, 1)
	--self.map:bump_draw(tx, ty)
	--love.graphics.setColor(1, 1, 1, 1)
end 