
StateStack = {}
StateStack.__index = StateStack
function StateStack:Create()
    local this =
    {
        states = {},
    }

    setmetatable(this, self)
    return this
end

function StateStack:push(state)
    table.insert(self.states, state)
    state:enter()
end

function StateStack:pop()
  local top = self.states[#self.states]
  table.remove(self.states, #self.states)
  top:exit()
  return top
end

function StateStack:top()
    return self.states[#self.states]
end

function StateStack:update(dt)
        local top = self.states[#self.states]
            if not top then
                return
            end
        -- This is where the in-game input is handled
        -- By that, I mean other than the few inputs that are handled
        -- by the Game object, the top state of the gamestack will
        -- handle all other input
        top:handleInput()
    for k = #self.states, 1, -1 do
        local v = self.states[k]
        if v then 
          local continue = v:update(dt)
          if not continue then
              break
          end
        end
    end

end

function StateStack:draw()
    for _, v in ipairs(self.states) do
        v:draw()
    end
end
