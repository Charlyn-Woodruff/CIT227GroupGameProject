-- Group Project
-- Jacob Passarello, Charlyn Woodruff, Austin Steen, Naedia McCann,
-- CIT 227 Applied Programming
-- Group Project - Love 2D & Tiled
-- April 18, 2025

-- Enemy  definition table with the width, height,sounds, x and y velocity and image file for each animation
gEnemys = {

    round_dudes = {
        w = 16,
        h = 16,
        x = 0,
        y = 0,
        x_vel = 0,
        y_vel = 0,
        htbxwidth = 8,
        htbxheight = 10,
        ox = 4,
        oy = 2,
        patrol_range = 30  ,
        patrol_speed = 50,

        img_file = 'characters/round_dudes.png',
        soundEnemy = 'assets/sound/Hit_hurt 6.wav',

        -- Animation table with the frames,column number and duration for each animation
        animations = {
            enemy1 = {frames={'1-4', 1}, duration=0.15},
            enemy2 = {frames={'1-6', 2}, duration=0.15},
            enemy3= {frames={'1-6', 3}, duration=0.15},
        },
        -- default animation set
        defaultAnimation = "enemy2"
    },
    platformians = {

        w = 16,
        h = 16,
        img_file = 'characters/platformians.png',

        -- Animation table with the frames,column number and duration for each animation
        animations = {
            enemy1 = {frames={'1-6', 1}, duration=0.15},
            enemy2 = {frames={'1-6', 2}, duration=0.15},
            enemy3 = {frames={'1-6', 3}, duration=0.15},
        },
        -- default animation set
        defaultAnimation = "enemy3"
    },

    jumpy_nero_gloppy = {
        w = 16,
        h = 16,
        img_file = 'characters/jumpy_nero_gloppy.png',

        -- Animation table with the frames,column number and duration for each animation
        animations = {
            enemy1 = {frames={'1-6', 1}, duration=0.15},
            enemy2 = {frames={'1-6', 3}, duration=0.12},
            enemy3 = {frames={'1-6', 8}, duration=0.15},
        },
        -- default animation set
        defaultAnimation = "enemy1"
    },
    
    cheesepuff = {
        w = 16,
        h = 16,
        img_file = 'characters/cheesepuff_totem.png',

        -- Animation table with the frames,column number and duration for each animation
        animations = {
            enemy1 = {frames={'1-3', 2}, duration=0.19},
        },
        -- default animation set
        defaultAnimation = "enemy1"
    },

    chichi = {
        w = 16,
        h = 16,
        img_file = 'characters/chichi.png',

        -- Animation table with the frames,column number and duration for each animation
        animations = {
            enemy1 = {frames={'1-4', 2}, duration=0.15},
        },
        -- default animation set
        defaultAnimation = "enemy1"
    }
}