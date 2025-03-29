-- Sound Dictionary / Table
local sounds = {}  -- create an empty table

-- Load sound effects
sounds['playStateMusic'] = love.audio.newSource("sounds/Calm Loop.wav","static")
sounds['breakGems'] = love.audio.newSource("sounds/glass_shatter_084.mp3","static")
sounds['levelUp'] = love.audio.newSource("sounds/Retro_Suc_Melody_01.wav","static")
sounds['timeOut'] = love.audio.newSource("sounds/Retro_Neg_Melody_01.wav","static")
sounds['coin'] = love.audio.newSource("sounds/Retro PickUp Coin 07.wav","static") -- for the exercise

-- Config music options
sounds['playStateMusic']:setLooping(true) -- game music is looped
sounds['playStateMusic']:setVolume(0.3) -- volume 40%

sounds['levelUp']:setVolume(1) -- volume 100%

return sounds