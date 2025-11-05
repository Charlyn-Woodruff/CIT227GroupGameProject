-- Group Project
-- Jacob Passarello, Charlyn Woodruff, Austin Steen, Naedia McCann,
-- CIT 227 Applied Programming
-- Group Project - Love 2D & Tiled
-- April 18, 2025

-- Blocks definition table 
gBlocks = {

    -- red brick block table with the width, height, image file for each animation
    red_brick = {
        w = 16,
        h = 16,
        x = 0,
        y = 0,
        soundBlock = 'assets/sound/Explosion 5.wav',
        img_file = 'tilesets/blocks_tiles/blocks.png',
        
        -- Animation table with the frames,column number and duration for each animation
        animations = {
            block1 = {frames={'1-2', 3}, duration=0.9},           
        },
        -- default animation set
        defaultAnimation = "block1"
    },
    -- green brick block table with the width, height, image file for each animation
    green_brick = {
        w = 16,
        h = 16,
        x = 0,
        y = 0,
        img_file = 'tilesets/blocks_tiles/blocks.png',
        
        -- Animation table with the frames,column number and duration for each animation
        animations = {
            block1 = {frames={1 , 4}, duration=0.9},           
        },
        -- default animation set
        defaultAnimation = "block1"
    },
    -- smiley block table with the width, height, image file for each animation
    smiley_block = {

        w = 16,
        h = 16,
        x = 0,
        y = 0,
        img_file = 'tilesets/blocks_tiles/blocks.png',
        
        -- Animation table with the frames,column number and duration for each animation
        animations = {
            block1 = {frames={11, 5}, duration=1},           
        },
        -- default animation set
        defaultAnimation = "block1"
    },
    -- blue block table with the width, height, image file for each animation
    blue = {
        w = 16,
        h = 16,
        x = 0,
        y = 0,
        img_file = 'tilesets/blocks_tiles/blocks.png',
        
        -- Animation table with the frames,column number and duration for each animation
        animations = {
            block1 = {frames={4, 4}, duration=1},           
        },
        -- default animation set
        defaultAnimation = "block1"
    },
}