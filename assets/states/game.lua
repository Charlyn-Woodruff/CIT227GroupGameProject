-- Group Project
-- Jacob Passarello, Charlyn Woodruff, Austin Steen, Naedia McCann,
-- CIT 227 Applied Programming
-- Group Project - Love 2D & Tiled
-- April 18, 2025

--Game state function to set the states for the game
function Game()
    return{
        state = {
            menu = false,
            pause = false,
            running = true,
            restart = false,
            completed = false,
            gameover = false,
            ended = false
        },
        -- These lines are to check for which level is running
        level = {
            levelOne = false,
            levelTwo = false
        },
        -- These lines are to set the game states
        changeGameState = function (self, state)
            self.state.menu = state =="menu"
            self.state.pause = state =="pause"
            self.state.running = state =="running"
            self.state.restart = state == "restart"
            self.state.completed = state == "completed"
            self.state.gameover= state == "gameover"
            self.state.ended = state =="ended"
            self.state.endedlevel2 = state =="endedlevel2"
        end,
        -- These lines are to set the game state levels of the game
        changeLevel = function (self, level)
            self.level.levelOne = level =="levelOne"
            self.level.levelTwo = level =="levelTwo"
        end
    }
end

return Game