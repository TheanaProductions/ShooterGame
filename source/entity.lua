local pd <const> = playdate
local gfx <const> = pd.graphics

import ('healthManager')

class("Entity").extends(gfx.sprite)

function Entity:init(x, y, scale, speed, health) -- Constructor
    self:moveTo(x, y)
    self:setScale(scale);
    self:add()
    self.speed = speed
    self.health = HealthManager(health)
end

function Entity:moveEntity(x, y, collissions)
    if collissions then
        self:moveWithCollisions(x * self.speed, y * self.speed)
    else
        self:moveBy(x * self.speed, y * self.speed)
    end
end