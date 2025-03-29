local Class = require "libs.hump.class"

local Background = Class{}
function Background:init(imgPath, speed)
    self.img = love.graphics.newImage(imgPath)
    self.pos = 0
    self.width = self.img:getWidth()
    self.speed = speed
end

function Background:draw()
    love.graphics.draw(self.img,math.floor(0-self.pos),0)
    love.graphics.draw(self.img,math.floor(self.width-self.pos),0)    
end

function Background:update(dt)
    self.pos = (self.pos+self.speed*dt)%self.width
end


return Background