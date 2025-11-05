-- Group Project
-- Jacob Passarello, Charlyn Woodruff, Austin Steen, Naedia McCann,
-- CIT 227 Applied Programming
-- Group Project - Love 2D & Tiled
-- April 18, 2025

-- Third party libraries
anim8 = require('libraries/anim8/anim8')
log = require('libraries/log')
inspect = require('libraries/inspect')
class = require('libraries/middleclass')
sti = require('libraries/sti')
bump = require('libraries/bump')
stateful = require('libraries/stateful')
game = require('assets/states/game')

--Custom Libraries


--Code files
require('entity')
require('enemy')
require('character')
require('collectible')
require('block')
require('spike')
require('gameworld')
require('heart')
require('myLevel')
require('camera')
require('collision')

--require('gameworldTest') my testing experiment


--Data Files
require('data/character_defs')
require('data/collectible_defs')
require('data/blocks_defs')
require('data/effect_defs')
require('data/enemy_defs')
require('data/heart_defs')
require('data/spike_defs')