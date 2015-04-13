
-- 0 - disable debug info, 1 - less debug info, 2 - verbose debug info
DEBUG = 1

-- display FPS stats on screen
DEBUG_FPS = true

-- dump memory info every 10 seconds
DEBUG_MEM = false

-- load deprecated API
LOAD_DEPRECATED_API = false

-- load shortcodes API
LOAD_SHORTCODES_API = true

-- screen orientation
CONFIG_SCREEN_ORIENTATION = "portrait"

-- design resolution
CONFIG_SCREEN_WIDTH  = 640
CONFIG_SCREEN_HEIGHT = 960

-- auto scale mode
CONFIG_SCREEN_AUTOSCALE = "FIXED_WIDTH"

--下面是自己定义的配置
TOTAL_ELEMENT_TYPE = 4


MAP_WIDTH = 7
MAP_HEIGHT = 1
MAP_START_X = 30
MAP_START_Y = 0

elements = {
    blue = {
        texture = "blue.png",
        probability = 100,
        needDigTime = 1,
        isBrick = true,
    },
    green = {
        texture = "green.png",
        probability = 100,
        needDigTime = 1,
        isBrick = true,
    },
    orange = {
        texture = "orange.png",
        probability = 100,
        needDigTime = 1,
        isBrick = true,
    },
    purple = {
        texture = "purple.png",
        probability = 100,
        needDigTime = 1,
        isBrick = true,
    },
    red = {
        texture = "red.png",
        probability = 100,
        needDigTime = 1,
        isBrick = true,
    },


    oxygen = {
        texture = "oxygen.png",
        probability = 1,
        needDigTime = 0,
    },
    silverDrill = {
        texture = "silverDrill.png",
        probability = 1,
        needDigTime = 0,
    },
    goldenDrill = {
        texture = "goldenDrill.png",
        probability = 1,
        needDigTime = 0,
    },
    box = {
        texture = "box.png",
        probability = 1,
        needDigTime = 0,
        
    },
    coin = {
        texture = "coin.png",
        probability = 1,
        needDigTime = 0,
    },
    gem = {
        texture = "gem.png",
        probability = 1,
        needDigTime = 0,
    },
    bomb = {
        texture = "bomb.png",
        probability = 1,
        needDigTime = 0,
    },
    timebomb = {
        texture = "timebomb.png",
        probability = 1,
        needDigTime = 0,
    },
    
    
    mushroom = {
        texture = "mushroom.png",
        probability = 1,
        needDigTime = 0,
    },
    nut = {
        texture = "nut.png",
        probability = 1,
        needDigTime = 0,
    },
    cola = {
        texture = "cola.png",
        probability = 1,
        needDigTime = 0,
    },
    

    toy = {
        texture = "toy.png",
        probability = 1,
        needDigTime = 0,
    },
}

player = {
    oxgenReduceRate = 1,
}

initialGameData = {
    coins = 0,
    diamond = 0,
    highestScore = 0,
    
    moveSpeed = 1,
    digForce = 1,
    oxgenVol = 100,
    fortune = 1,
}