local Class = require "libs.hump.class"
local spriBorder = love.graphics.newImage("graphics/border/purple_border_sprites.png")
local FrameSize = 64 -- Border frame has 64x64
local Cursor = Class{}

function Cursor:init(x, y, tileSize)
    self.x = x
    self.y = y
    self.row = 0 -- for later, Board matrix coord
    self.col = 0 -- for later, Board matrix coord
    self.scale = tileSize / FrameSize -- scale to tile size
    self.frame = self:getFrame(2,1) -- frame row 2, col 1
end

function Cursor:getFrame(frow, fcol)
    -- convert frameImg row, col coordinate to quad
    return love.graphics.newQuad(
        (fcol-1)*FrameSize, (frow-1)*FrameSize, -- x,y
        FrameSize, FrameSize, -- width, height
        spriBorder:getWidth(),spriBorder:getHeight()) --img w,h
end

function Cursor:draw()
    if self.row > 0 and self.col > 0 then
        love.graphics.draw(spriBorder, self.frame, 
            self.x, self.y, 0, self.scale, self.scale)
    end -- end if
end

function Cursor:setCoords(x,y)
    self.x = x
    self.y = y
end

function Cursor:setMatrixCoords(row,col)
    self.row = row
    self.col = col
end

function Cursor:clear()
    self.row = 0
    self.col = 0
end

return Cursor