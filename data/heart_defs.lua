-- Group Project
-- Jacob Passarello, Charlyn Woodruff, Austin Steen, Naedia McCann,
-- CIT 227 Applied Programming
-- Group Project - Love 2D & Tiled
-- April 18, 2025

-- Hearts definition table 
gHeartDefs = {
  

    --Heart Table with the x and y position, width, height,sound, hit box width and height,  heart values,and image file for each animation
    heart = {
        w = 16,
        h = 16,
        img_file = 'pickups/heart.png',
        x = 0,
        y = 0,
        ox = 8,
        oy = 2,
        startHearts = 3, 
        addHearts = 0,
        maxHearts = 5,
        htbxwidth = 8,
        htbxheight = 14,
        totalHearts = 0,
        minusHearts = 1,
        soundHearts = 'assets/sound/Powerup 11.wav',

        -- Animation table with the frames,column number and duration for each animation
        animations = {
            heart = {frames={'1-4', 1}, duration=0.19},
           
        },
        -- default animation set
        defaultAnimation = "heart"

    },

    lives = {
        w = 16,
        h = 16,
        points = 1,
        img_file = 'pickups/health_kit.png',

        -- Animation table with the frames,column number and duration for each animation
        animations = {
            healthKit = {frames={1,1}, duration=0.15},
        },
        -- default animation set
        defaultAnimation = "healthKit"
    },

}