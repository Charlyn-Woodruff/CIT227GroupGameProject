-- Group Project
-- Jacob Passarello, Charlyn Woodruff, Austin Steen, Naedia McCann,
-- CIT 227 Applied Programming
-- Group Project - Love 2D & Tiled
-- April 18, 2025

-- Collectibles definition table 
gCollectibles = {
  

    -- Coins table with the x and y position, width, height,sound, hit box width and height,  points value, and image file for each animation
    coins = {

        w = 16,
        h = 16,
        x = 0,
        y = 0,
        img_file = 'pickups/coin.png',
        htbxwidth = 8,
        htbxheight = 14,
        ox = 8,
        oy = 2,
        points = 1,
        soundCoin = 'assets/sound/Pickup_coin 3.wav',

        -- Animation table with the frames,column number and duration for each animation
        animations = {
            coin = {frames={'1-4', 1}, duration=0.19},           
        },
        -- default animation set
        defaultAnimation = "coin"
    },
    --Heart Table with the width, height, image file for each animation
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
        totalHearts = 0,
        htbxwidth = 8,
        htbxheight = 14,
        
        -- Animation table with the frames,column number and duration for each animation
        animations = {
            heart = {frames={'1-4', 1}, duration=0.19},
           
        },
        -- default animation set
        defaultAnimation = "heart"

    },

    -- Food items table with the width, height, image file for each animation
    food_items = {

        w = 16,
        h = 16,
        img_file = 'pickups/food_items.png',

        -- Animation table with the frames,column number and duration for each animation
        animations = {
            hamburger = {frames={1, 1}, duration=0.15},
            fries = {frames={2, 2}, duration=0.15},
            cake = {frames={3, 1}, duration=0.15},
            grapes = {frames={5,5}, duration=1},

        },
        -- default animation set
        defaultAnimation = "hamburger"      
    },

    --Health Table with the width, height, image file for each animation
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