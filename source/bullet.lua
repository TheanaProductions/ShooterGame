local pd <const> = playdate
local gfx <const> = pd.graphics

class ('Bullet').extends(gfx.sprite)

function Bullet:init(x, y, scale, speed)
    local bulletImage = gfx.image.new("images/bullet")
    self:setImage(bulletImage)
    self:moveTo(x, y)
    self:setScale(scale)
    self:add()
    self.speed = speed
    self:setCollideRect(0, 0, self:getSize())
end

function Bullet:update()
    local actualX, actualY, collisions, length = self:moveWithCollisions(self.x + self.speed, self.y)

    if length > 0 then
        for index, collision in pairs(collisions) do
            local obj = collision['other']
            if obj:isa(Enemy) then
                obj.health:loseHealth(1)
                obj:checkIfDead()
            end
        end

        self:remove()
    end

    if self.x > 420 + self.width / 2 then
        self:remove()
    end
end

function Bullet:collisionResponse()
    return "overlap"
end