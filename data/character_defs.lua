-- Group Project
-- Jacob Passarello, Charlyn Woodruff, Austin Steen, Naedia McCann,
-- CIT 227 Applied Programming
-- Group Project - Love 2D & Tiled
-- April 18, 2025

-- Character definition table 
gCharacterDefs = {

    -- Mr Man table with the width, height, image file for each animation
    mr_man = {
        
        x = 0,
        y = 0,
        w = 16,
        h = 16,
        x_vel = 0,
        y_vel = 0,
        coins = 0,
        lives = 5,
        newLives = 1,
        totalCoins = 0,
        health = 3,
        img_file = 'characters/mr_man.png',
        soundDie ='assets/sound/Die.wav',
        soundJump = 'assets/sound/Jump.wav',
       
        htbxwidth = 8,
        htbxheight = 10,
        ox = 4,
        oy = 2,

        -- Animation table with the frames,column number and duration for each animation
        animations = {
            idle = {frames={'1-3', 1}, duration=0.15},
            run = {frames={'1-6', 2}, duration=0.15},
            swim = {frames={'1-6', 4}, duration=0.15},
            jump = {frames={1,3}, duration=1},
            fall = {frames={2,3}, duration=1}
        },
        -- default animation set
        defaultAnimation = "idle"
    },

    -- Princess Sera table with the width, height, image file for each animation
    princess_sera ={

        w = 16,
        h = 32,
        img_file = 'characters/princess_sera.png',

        -- Animation table with the frames,column number and duration for each animation
        animations = {
            idle = {frames={'1-3', 1}, duration=0.15},
            run = {frames={'1-6', 2}, duration=0.15},
            swim = {frames={'1-6', 4}, duration=0.15},
            jump = {frames={1,3}, duration=1},
            fall = {frames={2,3}, duration=1}
        },
        -- default animation set
        defaultAnimation = "idle"

    },

    -- Bushly table with the width, height, image file for each animation
    bushly = {

        w = 16,
        h = 16,
        img_file = 'characters/bushly.png',

        -- Animation table with the frames,column number and duration for each animation
        animations = {
            idle = {frames={'1-3', 1}, duration=0.15},
            run = {frames={'1-6', 2}, duration=0.15},
            swim = {frames={'1-6', 4}, duration=0.15},
            jump = {frames={1,3}, duration=1},
            fall = {frames={2,3}, duration=1}
        },
        -- default animation set
        defaultAnimation = "idle"

    },
    
    -- Bumpy table with the width, height, image file for each animation
    bumpy = {

        w = 16,
        h = 16,
        img_file = 'characters/bumpy.png',

        -- Animation table with the frames,column number and duration for each animation
        animations = {
            idle = {frames={'1-3', 1}, duration=0.15},
            run = {frames={'1-6', 2}, duration=0.15},
            swim = {frames={'1-6', 4}, duration=0.15},
            jump = {frames={1,3}, duration=1},
            fall = {frames={2,3}, duration=1}
        },
        -- default animation set
        defaultAnimation = "idle"
    }
}
 