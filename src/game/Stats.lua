local Class = require "libs.hump.class"
local Timer = require "libs.hump.timer"
local Tween = require "libs.tween" 
local Sounds = require "src.game.SoundEffects"


local statFont = love.graphics.newFont(26)

local Stats = Class{}
function Stats:init()
    self.y = 10 -- we will need it for tweening later
    self.level = 1 -- current level    
    self.totalScore = 0 -- total score so far
    self.targetScore = 1000
    self.maxSecs = 99 -- max seconds for the level
    self.elapsedSecs = 0 -- elapsed seconds
    self.timeOut = false -- when time is out
    self.tweenLevel = nil -- for later

   
    Timer.every(1, function ()
    if gameState == "play" then
        self.elapsedSecs = self.elapsedSecs + 1    
         end
     end)
  
end

function Stats:draw()
    love.graphics.setColor(1,0,1) -- Magenta
    love.graphics.printf("Level "..tostring(self.level), statFont, gameWidth/2-60,self.y,100,"center")
    love.graphics.printf("Time "..tostring(self.elapsedSecs).."/"..tostring(self.maxSecs), statFont,10,10,200)
    love.graphics.printf("Score "..tostring(self.totalScore), statFont,gameWidth-210,10,200,"right")
    love.graphics.setColor(1,1,1) -- White
end
    
function Stats:update(dt) -- for now, empty function
Timer.update(dt)
end

function Stats:addScore(n)
    self.totalScore = self.totalScore + n
    if self.totalScore > self.targetScore then
        self:levelUp()
    end
end


function Stats:levelUp()
    Sounds['levelUp']:play()
    self.level = self.level + 1
    self.targetScore = self.targetScore+self.level*1000
    self.elapsedSecs = 0
end
    
return Stats
    
-- * git it 