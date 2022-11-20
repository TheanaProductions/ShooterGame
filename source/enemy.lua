local pd <const> = playdate
local gfx <const> = pd.graphics

class("Enemy").extends(Entity)

function Enemy:init(x, y, scale, speed)
    local enemyImage = gfx.image.new("images/enemy")
    self:setImage(enemyImage)
    Enemy.super.init(self, x, y, scale, speed)
end

function Enemy:update()

    if self.x < 0 - self.width / 2 then
        resetGame()
    end

    self:moveEntity(-self.speed, 0, false)
end