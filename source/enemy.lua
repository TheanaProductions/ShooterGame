local pd <const> = playdate
local gfx <const> = pd.graphics

class("Enemy").extends(Entity)

function Enemy:init(x, y, scale, speed, health)
    local enemyImage = gfx.image.new("images/enemy")
    self:setImage(enemyImage)
    Enemy.super.init(self, x, y, scale, speed, health)
end

function Enemy:update()

    self:moveEntity(-self.speed, 0, false)

    if self.x < 0 - self.width / 2 then
        player.health:loseHealth(1)
        self:remove()
    end
end