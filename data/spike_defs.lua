-- Group Project
-- Jacob Passarello, Charlyn Woodruff, Austin Steen, Naedia McCann,
-- CIT 227 Applied Programming
-- Group Project - Love 2D & Tiled
-- April 18, 2025

-- Spike Block definition table 
gSpikes = {

    -- spike block table with the width, height,sound, hit box width and height and image file for each animation
    spike_block = {

        w = 16,
        h = 16,
        x = 0,
        y = 0,
        ox = 8,
        oy = 2,
        htbxwidth = 8,
        htbxheight = 14,
        img_file = 'tilesets/block_tiles/blocks.png',
        soundSpike = 'assets/sound/Hit_hurt 6.wav',
        img_file = 'tilesets/blocks_tiles/blocks.png',
        
        -- Animation table with the frames,column number and duration for each animation
        animations = {
            block1 = {frames={4, 4}, duration=1},           
        },
        -- default animation set
        defaultAnimation = "block1"
    },

}